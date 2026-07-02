#!/usr/bin/env python3
r"""
mysql2sqlite.py -- escape-aware MySQL-dump -> SQLite converter for the Notionary seed.
Fixes the two things a naive converter breaks on this seed:
  1. String escaping:  \' -> ''   \" -> "   \n -> LF   \r -> CR   \\ -> \   \0 \Z \t \b
  2. DDL dialect: strip ENGINE/CHARSET/COLLATE/CHARACTER SET/AUTO_INCREMENT/UNSIGNED/COMMENT,
                  backtick idents -> "..", map column types, inline single-col INTEGER PK
                  as rowid alias, drop secondary KEY/INDEX lines, drop mysqldump /*!..*/ cruft.
Usage: python3 mysql2sqlite.py in.sql > out.sql
"""
import re, sys

TYPE_MAP = [
    (re.compile(r'\b(?:tinyint|smallint|mediumint|bigint|int)\b(?:\(\d+\))?', re.I), 'INTEGER'),
    (re.compile(r'\b(?:varchar|char|tinytext|mediumtext|longtext|text)\b(?:\(\d+\))?', re.I), 'TEXT'),
    (re.compile(r'\b(?:double|float|decimal|numeric|real)\b(?:\([\d,]+\))?', re.I), 'REAL'),
    (re.compile(r'\b(?:datetime|timestamp|date|time)\b', re.I), 'TEXT'),
    (re.compile(r'\b(?:longblob|mediumblob|tinyblob|blob|varbinary|binary)\b(?:\(\d+\))?', re.I), 'BLOB'),
]

def reescape(stmt):
    out=[]; i=0; n=len(stmt); in_str=False
    while i<n:
        c=stmt[i]
        if not in_str:
            if c=='`':
                j=stmt.index('`', i+1); out.append('"'+stmt[i+1:j]+'"'); i=j+1; continue
            if c=="'": in_str=True; out.append("'"); i+=1; continue
            out.append(c); i+=1
        else:
            if c=='\\' and i+1<n:
                out.append({"'":"''", '"':'"', 'n':'\n', 'r':'\r',
                            '\\':'\\', '0':'\x00', 'Z':'\x1a', 't':'\t', 'b':'\b'}.get(stmt[i+1], stmt[i+1]))
                i+=2; continue
            if c=="'": in_str=False; out.append("'"); i+=1; continue
            out.append(c); i+=1
    return ''.join(out)

def convert_create(block):
    m=re.match(r'CREATE TABLE\s+`([^`]+)`\s*\((.*)\)\s*ENGINE.*?;', block, re.S|re.I) \
      or re.match(r'CREATE TABLE\s+`([^`]+)`\s*\((.*)\)[^)]*;', block, re.S|re.I)
    name, body = m.group(1), m.group(2)
    cols=[]; pk=[]
    for raw in body.split('\n'):
        line=raw.strip().rstrip(',')
        if not line: continue
        up=line.upper()
        if up.startswith(('KEY ','UNIQUE KEY','INDEX ','CONSTRAINT','FULLTEXT')): continue
        if up.startswith('PRIMARY KEY'):
            pk=[c.strip(' `"') for c in re.search(r'\((.*)\)',line).group(1).split(',')]; continue
        cm=re.match(r'`([^`]+)`\s+(.*)', line)
        if not cm: continue
        col, rest = cm.group(1), cm.group(2)
        rest=re.sub(r'CHARACTER SET \w+','',rest,flags=re.I)
        rest=re.sub(r'COLLATE \w+','',rest,flags=re.I)
        rest=re.sub(r'\bAUTO_INCREMENT\b','',rest,flags=re.I)
        rest=re.sub(r'\b(?:UNSIGNED|ZEROFILL)\b','',rest,flags=re.I)
        rest=re.sub(r"COMMENT\s+'(?:[^'\\]|\\.)*'",'',rest,flags=re.I)
        for rx,repl in TYPE_MAP: rest=rx.sub(repl, rest, count=1)
        rest=re.sub(r'\s+',' ',rest).strip()
        cols.append([col,rest])
    single_int_pk = (len(pk)==1 and any(c==pk[0] and t.upper().startswith('INTEGER') for c,t in cols))
    defs=[]
    for c,t in cols:
        if single_int_pk and c==pk[0]:
            defs.append(f'"{c}" INTEGER PRIMARY KEY')
        else:
            defs.append(f'"{c}" {t}')
    if pk and not single_int_pk:
        defs.append('PRIMARY KEY (%s)' % ', '.join('"%s"'%c for c in pk))
    return f'CREATE TABLE "{name}" (\n  ' + ',\n  '.join(defs) + '\n);'

def main():
    src=open(sys.argv[1],encoding='utf-8').read()
    print("PRAGMA journal_mode=MEMORY;\nBEGIN;")
    for m in re.finditer(r'(CREATE TABLE .*?;|INSERT INTO .*?;)\n', src, re.S):
        s=m.group(1)
        if s.upper().startswith('CREATE TABLE'):
            nm=re.match(r'CREATE TABLE\s+`([^`]+)`',s).group(1)
            print(f'DROP TABLE IF EXISTS "{nm}";'); print(convert_create(s))
        else:
            print(reescape(s))
    print("COMMIT;")

if __name__=='__main__': main()

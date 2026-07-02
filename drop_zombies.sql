-- drop_zombies.sql — deferred-zombie seed drop (Notionary STRIP)
PRAGMA foreign_keys=OFF;
BEGIN;
DROP TABLE IF EXISTS aanosnd;
DROP TABLE IF EXISTS aalogin;
DROP TABLE IF EXISTS aalast;
DROP TABLE IF EXISTS aaemail;
DROP TABLE IF EXISTS aajamsg;
DROP TABLE IF EXISTS aatwo55;
DROP TABLE IF EXISTS aarating;
DROP TABLE IF EXISTS aareview;
DELETE FROM aaglobe WHERE kodex IN ('dbhom','revus','dntxt','emtxt','extxt','fntxt','kntxt','metxt','nntxt','p2txt','pptxt','pwtxt','qitxt','sxtxt','untxt');
COMMIT;
VACUUM;

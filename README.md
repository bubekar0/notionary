# Notionary

A self-hosted spaced-repetition flashcard web app built on Hermann Ebbinghaus' forgetting-curve research. It supports text, images, and native-speaker audio across eight interface languages, and runs on a plain LAMP stack.

> **Status — donated as-is.** Notionary is a working but deliberately kludgey app with over a decade of history behind it. It has been repaired and confirmed running on a LAMP stack (Linux + Apache + MySQL/MariaDB + PHP) in production. It is shared here for anyone who wants a real, clone-and-run learning app to study, fork, or play with. It is **not** an actively developed product and is offered without support. The code is old-school procedural PHP with `mysqli`; treat it as a working artifact, not a style reference.

## Motivation

The app was inspired by the work of German psychologist Hermann Ebbinghaus, who in the late 19th century systematically studied memory and forgetting. His research produced the **forgetting curve** — a description of how quickly learned material fades from memory over time — and, crucially, a way to counteract it: **spaced repetition**. By reviewing material at timed intervals and adjusting those intervals based on performance, information can be moved efficiently into long-term memory.

## What is a Notion?

A notion is a list of question-and-answer pairs. Notions can cover any subject: vocabulary, world capitals, historical dates, music recognition, math facts — anything that can be expressed as Q&A. The shipped seed data includes a large multilingual set of ready-made notions (language vocabulary, geography, music, math, and more).

## Learning Modes

- **Flashcards** — cards that flip on click to reveal the answer.
- **Multiple Choice** — pick the correct answer from a menu.
- **Written Answer** — type the answer from memory.
- **Reverse Test** — the answer is shown first; recall the question.

## Requirements

- **PHP 8.2+** (developed and tested on 8.5; the production instance also runs on older PHP, but 8.2+ is the supported floor for a fresh setup).
- **MySQL 8.0+ or MariaDB 10.4+** (production runs MariaDB 10.11).
- The PHP `mysqli`, `gd`, and `zlib` extensions (all standard on a typical LAMP install).

That's it — no Composer, no Node, no build step required to run the app. The served JS/CSS bundles are already committed.

## Quick Start

This gets you a fully working app with the bundled seed notions.

### 1. Clone

```bash
git clone https://github.com/bubekar0/notionary.git
cd notionary
```

### 2. Create the database and a user

Open a MySQL/MariaDB shell as an admin user and run:

```sql
CREATE DATABASE notionary_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'notio_nary'@'localhost' IDENTIFIED BY 'choose_a_password';
GRANT ALL PRIVILEGES ON notionary_db.* TO 'notio_nary'@'localhost';
FLUSH PRIVILEGES;
```

Use any database name, user, and password you like — just match them in `config.php` in step 4.

### 3. Import the schema and seed data

Import the structure first, then the seed content (order matters):

```bash
mysql -u notio_nary -p notionary_db < db/schema.sql
mysql -u notio_nary -p notionary_db < db/data.sql
```

`schema.sql` creates the core `aa*` tables and the per-notion content tables; `data.sql` fills them with the seed notions plus one starter account, `owner@notionary`, which is also the admin.

### 4. Configure

```bash
cp config.example.php config.php
```

Edit `config.php` and set `DB_PASSWORD` (and `DB_NAME` / `DB_USER` if you changed them in step 2). Leave `APP_ENV` as `local` for a local run. `config.php` is git-ignored and is never committed — each machine keeps its own.

> **Local mode auto-login.** With `APP_ENV = 'local'`, the app auto-logs you in as the seeded `owner@notionary` account, so you immediately see the user and admin tools. For a real deployment set `APP_ENV = 'prod'`, which makes the app anonymous-by-default and logs errors instead of displaying them.

### 5. Run

```bash
php -S localhost:8080 router.php
```

Then open **http://localhost:8080/notionary.php**

> **Use port 8080.** The seed data pins the app's base URL to `http://localhost:8080/`. Running on a different port or host will still work for browsing. For a quick local try-out, just use 8080.

`router.php` is a tiny shim that lets PHP's built-in server mimic the production Apache routing (requests carrying a `?tun=` parameter are dispatched through `notionary.php`; everything else is served as a static file).

### Choose the interface language

The app serves **one interface language per install** (English by default). The seed ships notions in eight languages — including sets aimed at speakers of each language who are learning English — and the browse catalog you see is the one matching the active language. To switch, set the owner account's language to one of `en`, `de`, `es`, `fr`, `it`, `pt`, `hu`, `ru`:

```sql
UPDATE aauser SET ulang='es' WHERE user='owner@notionary';
```

This selects both the interface strings and which language's notion catalog you browse.

## Features

- Create and edit notion sets (type directly, paste, or import).
- Spaced-repetition engine that tracks performance and recommends review timing.
- Multilingual interface: English, German, Spanish, French, Italian, Portuguese, Hungarian, Russian.
- Math-problem generators (arithmetic, fractions, GCD/LCM, percentages).
- PDF generation for printable flashcards.
- Admin tools for content curation and database housekeeping.

## Project Structure

```
notionary.php          Main entry point and front controller (routes on ?tun=)
usrindex.php           Logged-in user features (create, edit, review)
admindex.php           Admin features
router.php             Dev-server router for `php -S`
config.example.php     Configuration template (copy to config.php)

php/                   Server-side PHP includes
dev/js/                JavaScript source modules
dev/css/               CSS source modules (PHP-generated)
js/                    Built JS bundle (generated by bin/build, committed)
css/                   Built CSS bundle (generated by bin/build, committed)
db/                    schema.sql (structure) + data.sql (seed content)
bin/                   build and install-content scripts
lib/tfpdf/             PDF-generation library
{en,de,es,fr,it,pt,hu,ru}/   Localized interface strings
```

## Rebuilding the bundles (only if you edit sources)

The app ships with the built `js/` and `css/` bundles already committed, so you do **not** need this to run it. If you modify anything under `dev/js/` or `dev/css/`, regenerate the served bundles with:

```bash
bin/build
```

## License

MIT — see [LICENSE](LICENSE).

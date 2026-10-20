# Notionary

A self-hosted spaced-repetition flashcard web app built on Hermann Ebbinghaus' forgetting-curve research. It works with plain-text question-and-answer pairs across eight interface languages, runs on plain PHP with a bundled SQLite database, and needs no database server to set up.

> **Status — donated as-is.** Notionary is a working but deliberately kludgey app with over a decade of history behind it. It has been repaired, ported to SQLite, and confirmed running. It is shared here for anyone who wants a real, clone-and-run learning app to study, fork, or play with. It is **not** an actively developed product and is offered without support. The code is old-school procedural PHP; treat it as a working artifact, not a style reference.

## Motivation

The app was inspired by the work of German psychologist Hermann Ebbinghaus, who in the late 19th century systematically studied memory and forgetting. His research produced the **forgetting curve** — a description of how quickly learned material fades from memory over time — and, crucially, a way to counteract it: **spaced repetition**. By reviewing material at timed intervals and adjusting those intervals based on performance, information can be moved efficiently into long-term memory.

## What is a Notion?

A notion is a list of question-and-answer pairs. Notions can cover any subject: vocabulary, world capitals, historical dates, math facts — anything that can be expressed as text Q&A. The shipped seed data includes a large multilingual set of ready-made notions (language vocabulary, geography, math, and more).

## Learning Modes

- **Flashcards** — cards that flip on click to reveal the answer.
- **Multiple Choice** — pick the correct answer from a menu.
- **Written Answer** — type the answer from memory.
- **Reverse Test** — the answer is shown first; recall the question.

## Requirements

- **PHP 8.2+** (developed and tested on 8.5).
- The PHP `sqlite3` and `zlib` extensions (both standard on a typical PHP install).

Don't have PHP yet? Install it with:

- **macOS** (Homebrew): `brew install php`
- **Debian/Ubuntu**: `sudo apt install php-cli php-sqlite3`
- **Fedora**: `sudo dnf install php-cli php-pdo`
- **Windows**: `winget install PHP.PHP`, or download from [windows.php.net/download](https://windows.php.net/download/) — or use WSL and follow the Debian line.

Verify with `php -v` (expect 8.2 or newer).

That's it — no database server, no Composer, no Node, no build step required to run the app. The SQLite database and the served JS/CSS bundles are all committed and ready to use.

## Quick Start

This gets you a fully working app with the bundled seed notions. It is a single-user, no-login app: it boots straight into the seeded `owner@notionary` space, and you start using it immediately.

> **Try it live first.** A running instance is at
> **[notionary.uozon.com](https://notionary.uozon.com/notionary.php)** — a public single-user
> sandbox where anyone can play with the app before downloading it (it's a shared space, so
> visitors see each other's edits, and it's reset periodically).

### 1. Clone

```bash
git clone https://github.com/bubekar0/notionary.git
cd notionary
```

### 2. Run

```bash
bin/serve
```

That's it. `bin/serve` starts the app on port 8080 **in the background** and opens
`http://localhost:8080/notionary.php` in your browser. Stop it any time with:

```bash
bin/stop
```

> **The one setup step.** Notionary is a PHP app, so it isn't literally double-click “plug and
> play”: it needs PHP installed (see **Requirements**) and this one command to launch. Nothing
> else — there is no config file to create and no database to provision. The bundled
> `db/notionary.db` and the committed JS/CSS bundles are used automatically.

Prefer the plain foreground server (occupies the terminal, **Ctrl-C** to stop)?

```bash
php -S localhost:8080 router.php   # then open http://localhost:8080/notionary.php
```

> **Use port 8080.** The seed data pins the base URL to `http://localhost:8080/`; other ports
> still work for browsing, but 8080 is the quick path.

To change any default (environment, timezone, a custom database path), edit `config.php`
directly — it's the single committed config the app reads.

`router.php` is a tiny shim that lets PHP's built-in server mimic the production Apache routing
(requests with a `?tun=` parameter go through `notionary.php`; everything else is served as a
static file).

### Choose the interface language

The app serves **one interface language per install** (English by default). The seed ships notions in eight languages — including sets aimed at speakers of each language who are learning English — and the browse catalog you see is the one matching the active language. To switch, set the owner account's language to one of `en`, `de`, `es`, `fr`, `it`, `pt`, `hu`, `ru`. Run this from the project directory (the same folder as `notionary.php`), since the database path is relative:

```bash
sqlite3 db/notionary.db "UPDATE aauser SET ulang='es' WHERE user='owner@notionary';"
```

This selects both the interface strings and which language's notion catalog you browse.

## Features

- Create and edit notion sets (type directly or paste in bulk).
- Performance tracking per notion across tests, shown on the results screen.
- Multilingual interface: English, German, Spanish, French, Italian, Portuguese, Hungarian, Russian.
- Math-problem generators (arithmetic, fractions, GCD/LCM, percentages).
- PDF export of a notion as a printable question-and-answer study list.

## Project Structure

```
notionary.php          Main entry point and front controller (routes on ?tun=)
usrindex.php           User features (create, edit, review)
router.php             Dev-server router for `php -S`
config.php             Configuration (SQLite; edit to change environment, timezone, DB path)

php/                   Server-side PHP includes
dev/js/                JavaScript source modules
dev/css/               CSS source modules (PHP-generated)
js/                    Built JS bundle (generated by bin/build, committed)
css/                   Built CSS bundle (generated by bin/build, committed)
db/                    notionary.db (bundled SQLite database + seed content)
bin/                   build + serve/stop scripts
lib/tfpdf/             PDF-generation library
tests/                 security_test.php — CLI regression test: `php tests/security_test.php`
{en,de,es,fr,it,pt,hu,ru}/   Localized interface strings
```

## Rebuilding the bundles (only if you edit sources)

The app ships with the built `js/` and `css/` bundles already committed, so you do **not** need this to run it. If you modify anything under `dev/js/` or `dev/css/`, regenerate the served bundles with:

```bash
bin/build
```

## License

MIT — see [LICENSE](LICENSE).

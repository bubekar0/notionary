# PENDING.md — notionary resurrection: scoped spec & handoff

> Purpose: let a fresh session resume this work cold. READ THIS FILE TOP TO
> BOTTOM FIRST. It is the source of truth. Local repo:
> `/Users/hec/Documents/uozon/notionary/` (Filesystem access under
> `/Users/hec/Documents`).

---

## 1. The goal

Resurrect "notionary" — spaced-repetition flashcard web app — running at
**https://notionary.uozon.com** beside polyglot.uozon.com.

Product model: anonymous by default, no signup wall. Three tiers: none →
user → admin. Validation test = Hector's son uses it.

---

## 2. Environment facts

- **GitHub:** https://github.com/bubekar0/notionary (public)
- **Local:** `/Users/hec/Documents/uozon/notionary/`
  - PHP 8.5.3 (Homebrew), MySQL 9.6.0
  - DB: `notionary_db`, user `notio_nary`, pass `notionary_local`
  - Run: `php -S localhost:8080 router.php`
- **Production:** Plesk/nginx → Apache (proxy mode) on rubidium.selfhost.de
  - **PHP VERSION: 7.3.33** on Apache (CLI `php` binary is 5.4 — only for linting)
  - Docroot: `/var/www/vhosts/uozon.rubidium.selfhost.de/notionary/`
  - DB: `notionary_db`, user `notio_nary`, pass `N60hewje!`
  - SSL: Let's Encrypt ✓
  - Deploy: `bin/build && ./deploy.sh` from local repo root
  - Plesk index file: `notionary.php` ✓
  - `cache/` dir exists on server ✓

---

## 3. Architecture

- Front controller: `notionary.php` (routes on `?tun=`)
- Authenticated user operations: `usrindex.php` (all guarded by `legal()`)
- Build: `bin/build` → `js/notionary-deve.js` + `css/notionary-deve.php`
- Cache: `cache/` dir exists on server, used by `fcach()` for JSON caching
- DB: `aa*` core tables + ~1,600 per-notion tables. 3.52 GB, fully populated.
- Code archive (read-only reference): `~/Documents/notionary_code_backups/notionary-mp4/`

---

## 4. Key design decisions

- `APP_ENV` in `config.php` governs dev/prod
- Base URL auto-derived from request (PHP: `app_base_url()`; JS: `window.location.origin`)
- Social SDKs (FB, Twitter, Google+) fully removed; stubs remain in `php/oauth2.php`
- `config.php` is git-ignored, per-environment, never deployed
- `obfus()` kept as-is — only used for email confirmation tokens, harmless

---

## 5. Current status (2026-06-27)

**PROD IS UP AND FUNCTIONAL. ✓**

### What was accomplished this session (full chain)

**Prod stability:**
1. PHP parse error: `empty( $nname = holen(...) )` — PHP 5.4/5.5 forbids
   expressions inside `empty()`. Split to preceding line. Fixed ✓
2. `cache/` dir missing on server — `fcach()` returned HTML instead of JSON.
   Fixed: `mkdir cache && chmod 755` ✓
3. `owner@notionary` had `ulang='1'` in DB. Fixed via SQL ✓
4. Server is PHP 7.3.33 on Apache, not 5.4 (CLI only) ✓

**Auth system (fully restored):**
5. `loadUserAdminSources` was stubbed (forced `LOGGEDIN=ROOTUSER=true`).
   Replaced with real XHR calls to `?tun=isusr` and `?tun=isadm` ✓
6. `killLoginSession` was stubbed. Replaced with `?tun=outen` + reload ✓
7. `notionary-auth.js` was a one-liner stub. Ported full login/register/
   forgot-password flow from archive (`notionary-mp4`). Social SDK buttons
   removed. Posts to `notionary.php` (was `index.php`) ✓
8. `php/oauth2.php` restored: `login()`, `vrify()`, `i4got()`, `crack()`,
   `legal()`, `tstmp()`, `spure()` ✓
9. `notionary.php` dispatch: added `isadm`, `outen`, `login`, `vrify`,
   `i4got`, `crack` routes ✓
10. `usrindex.php`: removed forced `$_SESSION['uname']` dev stub ✓
11. Anonymous users see no auth controls ✓
12. Logged-in users see user tools ✓
13. Admin (aaadmin table, userID=1 = hec@uozon.com) sees admin tools ✓
14. New user registration + email confirmation flow works ✓
15. Password reset (forgot password) flow wired ✓

**Cleanup:**
16. Logo text fixed: `HARDCODE.myenv` → `HARDCODE.mynom` (shows "notionary") ✓
17. Logo click: anonymous → login modal; logged-in → home URL ✓
18. `aaparam` DB: `myurl` → `https://notionary.uozon.com/`,
    `mynom` → `notionary`, `admin` → `hec@uozon.com` ✓
19. `notionary.php` dev stub: `owner@notionary` → `hec@uozon.com` ✓
20. DB `aauser` table cleaned up (dead accounts removed) ✓

**Exam flow:**
21. `showMultipleChoices` and `showStandardizedTests` — stale `onclick`
    handlers fired after test end, crashing on `WORKDATA[THEINDEX].a`.
    Fixed with `if (THEINDEX >= WORKDATA.length) return` guard ✓
22. Full notion → flashcard test → results screen works end to end ✓

---

## 6. IMMEDIATE NEXT ACTION

Pick up from remaining work in §7 below. Start with whatever Hector
prioritizes — suggested order: teaser text for anon visitors, then
admin tool audit, then Phase 1b auto-start.

---

## 7. Remaining work

### Functional
- **Anon teaser:** anonymous visitors see no encouragement to register.
  Add a small teaser somewhere (footer? above notion grid?) with text like
  "Track your progress and create your own notions — register free."
  Clicking it should trigger `showSigninZentral`.
- **Phase 1b auto-start:** auto-launch "European Capitals" (or similar
  beginner notion) for cold anonymous visitors on first load.
- **Admin tool audit:** most admin tools are untested since resurrection.
  Work through them one by one — expect broken dependencies (image upload,
  sound upload, PDF generation, etc.).
- **`doneTest.php` share buttons:** `$fbook`/`$tweet` render as empty
  strings. Either remove the share button markup or replace with a
  copy-link button.
- **Email delivery:** `mailx()` on prod — confirm it actually sends
  (test forgot-password flow end to end with a real email address).
- **`mail2()`** in `usrindex.php` — "share results by email" button at
  end of test. Test if it works.

### Cosmetic (deferred)
- Login popup styling — currently functional but ugly.
- Overall UI polish pass.

### Phase 1.5 (deferred)
- Tracker, minification, progressive bundle loading.

---

## 8. Tools for new session

- Filesystem: read/write under `/Users/hec/Documents`
- SSH: `uozon@rubidium.selfhost.de`
- Deploy: `cd ~/Documents/uozon/notionary && bin/build && ./deploy.sh`
- PHP lint check: `ssh uozon@rubidium.selfhost.de 'php -l /var/www/vhosts/uozon.rubidium.selfhost.de/notionary/notionary.php 2>&1'`
- DB access: `ssh uozon@rubidium.selfhost.de 'mysql -u notio_nary -pN60hewje! notionary_db -e "..."'`
- Code archive (read-only): `~/Documents/notionary_code_backups/notionary-mp4/`

_Last updated: 2026-06-27 — prod up, auth restored, exam flow working._

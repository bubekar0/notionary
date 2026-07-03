<?php
/**
 * notionary configuration.
 *
 * RULE OF THUMB for what belongs in this flat file vs. the database:
 *   This file holds only values that are (a) environment-specific,
 *   (b) secret, or (c) needed before the database is even reachable.
 *   Anything that is shared content or admin-editable at runtime
 *   lives in the database (the aaparam table), not here.
 *
 * Copy this file to config.php (which is git-ignored) and fill it in
 * per machine. config.php is never committed and never deployed; each
 * environment keeps its own. The defaults below run the app as-is.
 */
return [
    // Environment: 'local' or 'prod'.
    //   local -> errors shown on screen (development)
    //   prod  -> errors logged, not shown
    'APP_ENV'     => 'local',
    // Base URL. Leave '' to auto-derive from the incoming request, so the app
    // works unchanged on localhost or any self-hosted machine with no edits.
    // Set explicitly only to pin it, e.g. 'https://notionary.uozon.com/'.
    'APP_URL'     => '',
    // Absolute filesystem path to this app directory (trailing slash).
    'APP_ROOT'    => __DIR__ . '/',
    // SQLite database. The app ships with db/notionary.db ready to use, so
    // this is optional — uncomment DB_FILE only to point at a database elsewhere.
    // 'DB_FILE'  => __DIR__ . '/db/notionary.db',
    // Internal database identifier (branding constant; leave as-is).
    'DB_NAME'     => 'notionary_db',
    // Default timezone for date handling.
    'TIMEZONE'    => 'Europe/Berlin',
];

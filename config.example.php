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
 * environment keeps its own.
 */
return [

    // Environment: 'local' or 'prod'.
    //   local -> auto-login as owner, errors shown on screen, readable JS bundle
    //   prod  -> anonymous by default, errors logged not shown, minified bundle
    'APP_ENV'     => 'local',

    // Base URL. Leave '' to auto-derive from the incoming request, so the app
    // works unchanged on localhost, the subdomain, or any self-hosted machine
    // with no edits. Set explicitly only to pin it,
    // e.g. 'https://notionary.uozon.com/'.
    'APP_URL'     => '',

    // Absolute filesystem path to this app directory (trailing slash).
    'APP_ROOT'    => __DIR__ . '/',

    // Database connection (the password is the one true secret here).
    'DB_HOST'     => 'localhost',
    'DB_NAME'     => 'notionary_db',
    'DB_USER'     => 'notio_nary',
    'DB_PASSWORD' => '',

    // Default timezone for date handling.
    'TIMEZONE'    => 'Europe/Berlin',
];

<?php
// notionary configuration — committed and shipped; the app reads this file directly.
// SQLite only (the bundled db/notionary.db); no database server. Edit values as needed.
return [
    'APP_ENV'  => 'prod',                         // prod = errors logged, not shown; 'local' shows them on screen
    'APP_URL'  => '',                             // '' auto-derives from the request; pin e.g. 'https://notionary.uozon.com/'
    'APP_ROOT' => __DIR__ . '/',
    // 'DB_FILE' => __DIR__ . '/db/notionary.db', // optional; this is the default already
    'DB_NAME'  => 'notionary_db',                 // branding constant, not a server DB
    'TIMEZONE' => 'Europe/Berlin',
];

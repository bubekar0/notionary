<?php
// Shared bootstrap, included first by every entry file.
// Errors go to the PHP error log, never to the client.
ini_set('display_errors', '0');
ini_set('display_startup_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL & ~E_DEPRECATED);
?>

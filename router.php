<?php
// Dev server router
require_once __DIR__ . '/php/bootstrap.php';

// Route requests with ?tun= to notionary.php (mimics production Apache behavior)
if (isset($_GET['tun'])) {
    require 'notionary.php';
    return true;
}

return false;

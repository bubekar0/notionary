<?php
// Dev server router
error_reporting(E_ALL & ~E_DEPRECATED);

// Route requests with ?tun= to notionary.php (mimics production Apache behavior)
if (isset($_GET['tun'])) {
    require 'notionary.php';
    return true;
}

return false;

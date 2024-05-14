<?php
define('BASEPATH', dirname(__DIR__) . '/');
require_once BASEPATH . 'index.php';
require_once BASEPATH . 'application/controllers/SampleController.php';

// Create an instance of the controller
$controller = new SampleController();

// Log a message to the PHP error log
error_log("Cron job started");

// Call the scheduledAddingOfData() method from your controller
$controller->scheduledAddingOfData();

// Log a message to the PHP error log
error_log("Cron job finished");

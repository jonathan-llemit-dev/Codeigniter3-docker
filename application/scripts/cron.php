<?php
define('BASEPATH', __DIR__ . '/../');
require_once BASEPATH . 'index.php';

// Get an instance of the controller
$CI =& get_instance();

// Log a message to the PHP error log
error_log("Cron job started");

// Call the scheduledAddingOfData() method from your controller
$CI->load->controller('SampleController/scheduledAddingOfData');

// Log a message to the PHP error log
error_log("Cron job finished");

<?php
define('BASEPATH', __DIR__ . '/../');
require_once BASEPATH . 'index.php';

// Get an instance of the controller
$CI =& get_instance();

// Call the scheduledAddingOfData() method from your controller
$CI->load->controller('students_portal/StudentsPortalController/scheduledAddingOfData');

<?php
defined('BASEPATH') or exit('No direct script access allowed');

class SampleController extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();

    $this->load->model('StudentModel');
    $this->load->library('session');

  }

  public function hello()
  {

    echo "Hello World";

  }

  public function sample()
  {

    $this->load->view('sample_page');

  }

  public function aboutMe($name)
  {

    echo "My name is: " . $name;

  }

  public function aboutMeView($name, $age, $address)
  {

    $data['name'] = $name;
    $data['age'] = $age;
    $data['address'] = $address;

    $this->load->view('about_page', $data);

  }

  public function scheduledAddingOfData()
  {

    $StudentModel = new StudentModel;

    $stringDateTime = "hayst";

    $data = [
      'student_name' => $stringDateTime,
      'age' => 24,
      'gender' => 'male',
    ];

    $StudentModel->insert_data($data);

  }

}


/* End of file SampleController.php */
/* Location: ./application/controllers/SampleController.php */
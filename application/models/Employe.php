<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Employe extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function login($email, $password) {
        $query = $this->db->get_where('Employe', ['email' => $email, 'mdp' => $password]);
        return $query->row_array();
    }

    public function register($data) {
        return $this->db->insert('Employe', $data);
    }
}

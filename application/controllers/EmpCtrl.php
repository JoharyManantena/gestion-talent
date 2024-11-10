<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class EmpCtrl extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Employe');
    }

    public function index() {
        $this->load->view('login');
    }

    public function login() {
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        $employe = $this->Employe->login($email, $password);

        if ($employe) {
            $data = [
                'prenom' => $employe['prenom'],
                'nom' => $employe['nom'],
                'isAdmin' => $employe['isAdmin']
            ];
            $this->load->view('accueil', $data);
        } else {
            $data['error_message'] = 'Email ou mot de passe incorrect.';
            $this->load->view('login', $data);
        }
    }

    public function register() {
        $this->load->view('register');
    }

    public function process_register() {
        $data = [
            'prenom' => $this->input->post('prenom'),
            'nom' => $this->input->post('nom'),
            'email' => $this->input->post('email'),
            'mdp' => $this->input->post('password'),
            'telephone' => $this->input->post('telephone'),
            'date_embauche' => $this->input->post('date_embauche'),
            'departement' => $this->input->post('departement'),
            'poste' => $this->input->post('poste'),
            'isAdmin' => $this->input->post('isAdmin') ? TRUE : FALSE,
        ];

        if ($this->Employe->register($data)) {
            redirect('EmpCtrl/login');
        } else {
            $data['error_message'] = 'Erreur lors de l\'inscription. Veuillez réessayer.';
            $this->load->view('register', $data);
        }
    }
    public function logout() {
        redirect('EmpCtrl/login');
    }
    
}

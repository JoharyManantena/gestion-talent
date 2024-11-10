<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class EntrepriseCtrl extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Entreprise');
        $this->load->model('Poste');
    }

    public function index() {
        $data['entreprises'] = $this->Entreprise->get_all_entreprises();

        foreach ($data['entreprises'] as &$entreprise) {
            $entreprise->postes = $this->Poste->get_postes_by_entreprise($entreprise->id_entreprise);
        }

        $this->load->view('page/liste', $data);
    }

    public function view($id) {
        $data['entreprise'] = $this->Entreprise->get_entreprise_by_id($id);

        if (empty($data['entreprise'])) {
            show_404();
        }
        $this->load->view('entreprise/details', $data);
    }
}

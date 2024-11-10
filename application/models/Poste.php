<?php
class Poste extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_postes_by_entreprise($id_entreprise) {
        $this->db->where('id_entreprise', $id_entreprise);
        $query = $this->db->get('Poste');
        return $query->result();
    }
}

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Entreprise extends CI_Model {

    private $table = 'entreprise';

    public function __construct() {
        parent::__construct();
    }

    // Affichage des entreprises pour les employés
    public function get_all_entreprises() {
        $query = $this->db->get($this->table);
        return $query->result();
    }

    // Récupération d'une entreprise par son identifiant
    public function get_entreprise_by_id($id) {
        $query = $this->db->get_where($this->table, array('id_entreprise' => $id));
        return $query->row();
    }

    // Insertion d'une nouvelle entreprise (pour l'admin)
    public function insert_entreprise($data) {
        if ($this->db->insert($this->table, $data)) {
            return $this->db->insert_id(); // Retourne l'ID de l'entreprise insérée
        } else {
            return false; // En cas d'échec
        }
    }

    // Mise à jour d'une entreprise existante (pour l'admin)
    public function update_entreprise($id, $data) {
        $this->db->where('id_entreprise', $id);
        return $this->db->update($this->table, $data);
    }

    // Suppression d'une entreprise (pour l'admin)
    public function delete_entreprise($id) {
        $this->db->where('id_entreprise', $id);
        return $this->db->delete($this->table);
    }
}

<?php

class M_auth extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    function cekUser($email)
    {
        return $this->db->get_where('user', ['email' => $email])->row_array();
    }

    function data_user($id_user)
    {
        $this->db->select('*');
        $this->db->from('user u');
        $this->db->where('u.id_user', $id_user);
        $query = $this->db->get();
        return $query->row_array();
    }

    function cek_email($email)
    {
        $this->db->where('email', $email);
        $query = $this->db->get('user');
        return $query->num_rows();
    }

    function tambah_user($data)
    {
        return $this->db->insert('user', $data);
    }

    function update_profile($where, $data)
    {
        return $this->db->update('user', $data, $where);
    }

    function data_produk()
    {
        $this->db->select('*');
        $this->db->from('ketersediaanterasi');
        $query = $this->db->get();
        return $query->result_array();
    }
}

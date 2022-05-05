<?php

class M_admin extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    function data_user($id_user)
    {
        $this->db->select('*');
        $this->db->from('user u');
        $this->db->where('u.id_user', $id_user);
        $query = $this->db->get();
        return $query->row_array();
    }

    function update_profile($where, $data)
    {
        return $this->db->update('user', $data, $where);
    }

    function tampil_produk()
    {
        $this->db->select('*');
        $this->db->from('ketersediaanterasi');
        $query = $this->db->get();
        return $query->result_array();
    }

    function jumlah_produk()
    {
        $this->db->select('*');
        $this->db->from('ketersediaanterasi');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function data_produk($number, $offset, $keyword = '')
    {
        $this->db->select('*');
        $this->db->from('ketersediaanterasi');
        if (!empty($keyword)) {
            $this->db->like('id_ketersediaanTerasi', $keyword);
            $this->db->or_like('nama_terasi', $keyword);
        }
        $this->db->limit($number, $offset);
        $query = $this->db->get();
        return $query->result_array();
    }

    function tambah_produk($data)
    {
        return $this->db->insert('ketersediaanterasi', $data);
    }

    function getDataProduk($kode_produk)
    {
        $this->db->select('*');
        $this->db->from('ketersediaanterasi');
        $this->db->join('user', 'user.id_user = ketersediaanterasi.id_penjual');
        $this->db->where('kode_produk', $kode_produk);
        $query = $this->db->get();
        return $query->row_array();
    }

    function getJumlahStok($kode_produk)
    {
        $this->db->select('jumlah_ketersediaan');
        $this->db->from('ketersediaanterasi');
        $this->db->where('kode_produk', $kode_produk);
        $query = $this->db->get();
        return $query->row_array();
    }

    function update_stok($where, $data)
    {
        return $this->db->update('ketersediaanterasi', $data, $where);
    }

    function hapus_produk($where, $table)
    {
        $this->db->where($where);
        $this->db->delete($table);
    }
}

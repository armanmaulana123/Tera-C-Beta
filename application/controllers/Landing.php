<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Landing extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_auth');
    }

    public function index()
    {
        $data['title'] = 'Tera-C';
        $data['data_user'] = $this->M_auth->data_user($this->session->userdata('id_user'));
        $data['data_produk'] = $this->M_auth->data_produk();

        $this->load->view('landing/meta', $data);
        $this->load->view('landing/header', $data);
        $this->load->view('landing/index', $data);
        $this->load->view('landing/footer');
    }

    public function login()
    {
        $data['title'] = 'Masuk | Tera-C';
        $this->load->view('landing/meta', $data);
        $this->load->view('landing/login');
        $this->load->view('landing/footer');
    }

    public function proses_login()
    {
        $email = htmlspecialchars($this->input->post('email'));
        $password = htmlspecialchars($this->input->post('password'));

        $user = $this->M_auth->cekUser($email);
        $hash = password_hash($user['password'], PASSWORD_DEFAULT);

        if (password_verify(md5($password), $hash)) {
            $data = [
                'id_user' => $user['id_user'],
                'nama_user' => $user['nama_user'],
                'email' => $user['email'],
                'level_user' => $user['level_user']
            ];
            $this->session->set_userdata($data);

            if ($user['level_user'] == 2) {
                $this->session->set_flashdata('pesan', array(
                    'status_pesan' => true,
                    'isi_pesan' => 'Berhasil Login, Selamat Datang!'
                ));
                redirect('landing');
            } else if ($user['level_user'] == 1) {
                $this->session->set_flashdata('pesan', array(
                    'status_pesan' => true,
                    'isi_pesan' => 'Berhasil Login, Selamat Datang!'
                ));
                redirect('admin');
            } else {
                $this->session->set_flashdata('pesan', array(
                    'status_pesan' => false,
                    'isi_pesan' => 'Username Atau Password Salah, Silahkan Coba Lagi!'
                ));
                redirect('landing/login');
            }
        } else {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => false,
                'isi_pesan' => 'Username Atau Password Salah, Silahkan Coba Lagi!'
            ));
            redirect('landing/login');
        }
    }

    public function register()
    {
        $data['title'] = 'Daftar | Tera-C';
        $this->load->view('landing/meta', $data);
        $this->load->view('landing/register');
        $this->load->view('landing/footer');
    }

    public function proses_register()
    {
        $this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[user.email]', [
            'is_unique' => 'Email sudah terdaftar!'
        ]);
        $this->form_validation->set_rules('password', 'Password', 'trim|min_length[5]|matches[password2]', [
            'matches' => 'Password tidak cocok!',
            'min_length' => 'Password terlalu pendek!'
        ]);
        $this->form_validation->set_rules('password2', 'Password Confirmation', 'trim|matches[password]');

        $pesan = array();

        if ($this->form_validation->run() == false) {
            array_push($pesan, validation_errors());
        }

        $data = [
            'nama_user' => htmlspecialchars($this->input->post('nama', true)),
            'email' => htmlspecialchars($this->input->post('email')),
            'password' => md5(htmlspecialchars($this->input->post('password', true))),
            'no_telp' => htmlspecialchars($this->input->post('no_telp', true)),
            'alamat' => htmlspecialchars($this->input->post('alamat', true)),
            'level_user' => 2,
            'foto_profil' => "default.jpg"
        ];

        if (empty($pesan)) {
            $result = $this->M_auth->tambah_user($data);
        } else {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => false,
                'isi_pesan' => 'Isi Form Dengan Valid'
            ));
            redirect('landing/register');
        }
        if ($result == true) {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => true,
                'isi_pesan' => 'Akun Berhasil Didaftarkan'
            ));
            redirect('landing/login');
        } else {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => false,
                'isi_pesan' => 'Akun Gagal Didaftarkan'
            ));
            redirect('landing/register');
        }
    }

    public function check_email()
    {
        $email = $this->input->post("email");
        $cekUser = $this->M_auth->cek_email($email);
        if ($cekUser > 0) {
            echo "ok";
        }
    }

    public function profile()
    {
        $data['title'] = 'Profil | Tera-C';
        $data['data_user'] = $this->M_auth->data_user($this->session->userdata('id_user'));

        $this->load->view('landing/meta', $data);
        $this->load->view('landing/header', $data);
        $this->load->view('user/profile', $data);
        $this->load->view('landing/footer');
    }

    public function edit_profile()
    {
        $data['title'] = 'Edit Profil | Tera-C';
        $data['data_user'] = $this->M_auth->data_user($this->session->userdata('id_user'));

        $this->load->view('landing/meta', $data);
        $this->load->view('landing/header', $data);
        $this->load->view('user/edit_profile', $data);
        $this->load->view('landing/footer');
    }

    public function update_profile()
    {
        $this->form_validation->set_rules('email', 'Email', 'trim|valid_email');

        $pesan = array();

        if ($this->form_validation->run() == false) {
            array_push($pesan, validation_errors());
        }

        $config['upload_path']          = 'assets/images/img_profil';  // folder upload 
        $config['allowed_types']        = 'gif|jpg|png|jpeg'; // jenis file
        $config['max_size']             = 8000;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if (!$this->upload->do_upload('image') && $_FILES['image']['size'] != 0) //sesuai dengan name pada form 
        {
            array_push($pesan, $this->upload->display_errors());
        }

        $file = $this->upload->data();
        $image = $_FILES['image']['size'] != 0 ? $file['file_name'] : $this->input->post('image1');

        $update = [
            'nama_user' => htmlspecialchars($this->input->post('nama', true)),
            'email' => htmlspecialchars($this->input->post('email', true)),
            'no_telp' => htmlspecialchars($this->input->post('no_telp', true)),
            'jenis_kelamin' => htmlspecialchars($this->input->post('jk', true)),
            'alamat' => htmlspecialchars($this->input->post('alamat', true)),
            'tgl_daftar' => date('d-M-Y'),
            'foto_profil' => $image,
        ];

        $where = array(
            'id_user' => htmlspecialchars($this->input->post('id_user', true))
        );

        if (empty($pesan)) {
            $result = $this->M_auth->update_profile($where, $update);
        } else {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => false,
                'isi_pesan' => 'Isi Form Dengan Valid'
            ));
            redirect('landing/edit_profile');
        }
        if ($result == true) {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => true,
                'isi_pesan' => 'Update Profile Berhasil'
            ));
            redirect('landing/profile');
        } else {
            $this->session->set_flashdata('pesan', array(
                'status_pesan' => false,
                'isi_pesan' => 'Update Profile Gagal'
            ));
            redirect('landing/edit_profile');
        }
    }

    public function logout()
    {
        session_destroy();
        redirect('landing');
    }
}

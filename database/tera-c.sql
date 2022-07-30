-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2022 at 12:49 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tera-c`
--

-- --------------------------------------------------------

--
-- Table structure for table `aduanpembeli`
--

CREATE TABLE `aduanpembeli` (
  `id_aduanPembeli` int(11) NOT NULL,
  `kode_aduan` varchar(150) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `desk_aduan` varchar(255) NOT NULL,
  `bukti_aduan` varchar(255) NOT NULL,
  `status_aduan` int(11) NOT NULL,
  `tgl_aduan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aduanpembeli`
--

INSERT INTO `aduanpembeli` (`id_aduanPembeli`, `kode_aduan`, `id_pembeli`, `desk_aduan`, `bukti_aduan`, `status_aduan`, `tgl_aduan`) VALUES
(8, 'ADUAN08062022XY3', 2, 'Pengiriman tidak sesuai dengan kode transaksi 10202026ASDJIS', 'ADUAN08062022XY3.png', 2, '2022-06-08'),
(9, 'ADUAN11062022F5T', 2, 'cek dokumen', '2_ Aljabar Boole.pdf', 2, '2022-06-11'),
(10, 'ADUAN11062022ZMG', 2, 'coba', 'PENGERTIAN BALSAMIQ DAN KEKURANGA.docx', 2, '2022-06-11'),
(11, 'ADUAN11062022XTK', 2, 'cekk', '2_ Aljabar Boole.pdf', 1, '2022-06-11'),
(12, 'ADUAN11062022LJT', 4, 'coba', 'PAID PROMOTE TIT.pdf', 1, '2022-06-11'),
(13, 'ADUAN11062022UWW', 4, 'cek', 'PAID PROMOTE TIT.pdf', 1, '2022-06-11'),
(14, 'ADUAN11062022B3C', 4, 'cek', 'PAID PROMOTE TIT.pdf', 1, '2022-06-11'),
(15, 'ADUAN110620228IH', 4, 'cek', '(Pert 1) intro python.pptx', 1, '2022-06-11'),
(16, 'ADUAN110620227HC', 4, 'cek', '[removal_ai]_tmp-615334bcaf32f.png', 1, '2022-06-11'),
(17, 'ADUAN14062022MH0', 2, 'cek', 'ADUAN14062022MH01.jpeg', 1, '2022-06-14'),
(18, 'ADUAN14062022BZ7', 2, 'cek', 'ADUAN14062022BZ7.jpeg', 1, '2022-06-14'),
(19, 'ADUAN14062022KBW', 2, 'cek', 'ADUAN14062022KBW1.jpeg', 1, '2022-06-14'),
(20, 'ADUAN14062022LCE', 2, 'cek', 'ADUAN14062022LCE.jpeg', 1, '2022-06-14'),
(21, 'ADUAN14062022ADQ', 2, 'cek', 'ADUAN14062022ADQ.jpeg', 1, '2022-06-14'),
(22, 'ADUAN20062022FVE', 2, 'Barang Tidak Sesuai', 'ADUAN20062022FVE.jpg', 1, '2022-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `detaildatapemesanan`
--

CREATE TABLE `detaildatapemesanan` (
  `id_detaildataPemesanan` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `kode_transaksi` varchar(45) NOT NULL,
  `total_hargaPemesanan` varchar(45) NOT NULL,
  `tgl_pemesanan` date NOT NULL,
  `bulan_pemesanan` varchar(45) NOT NULL,
  `id_informasiStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detaildatapemesanan`
--

INSERT INTO `detaildatapemesanan` (`id_detaildataPemesanan`, `id_pembeli`, `kode_transaksi`, `total_hargaPemesanan`, `tgl_pemesanan`, `bulan_pemesanan`, `id_informasiStatus`) VALUES
(1, 2, '21062022S5OXDE', '50000', '2022-06-21', 'June', 3),
(2, 2, '220620226WSCH7', '42000', '2022-06-22', 'June', 6);

-- --------------------------------------------------------

--
-- Table structure for table `informasipemesananterasi`
--

CREATE TABLE `informasipemesananterasi` (
  `id_informasiPemesananTerasi` int(11) NOT NULL,
  `kode_transaksi` varchar(45) NOT NULL,
  `kode_produk` varchar(45) NOT NULL,
  `jumlah_terasi` int(11) NOT NULL,
  `total_harga` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasipemesananterasi`
--

INSERT INTO `informasipemesananterasi` (`id_informasiPemesananTerasi`, `kode_transaksi`, `kode_produk`, `jumlah_terasi`, `total_harga`) VALUES
(1, '21062022S5OXDE', 'KP_XNE2', 5, '50000'),
(2, '220620226WSCH7', 'KP_nvX1', 2, '12000'),
(3, '220620226WSCH7', 'KP_XNE2', 3, '30000');

-- --------------------------------------------------------

--
-- Table structure for table `informasistatuspemesananterasi`
--

CREATE TABLE `informasistatuspemesananterasi` (
  `id_informasiStatus` int(11) NOT NULL,
  `nama_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasistatuspemesananterasi`
--

INSERT INTO `informasistatuspemesananterasi` (`id_informasiStatus`, `nama_status`) VALUES
(1, 'Menunggu Pembayaran'),
(2, 'Pengecekan Pembayaran'),
(3, 'Pesanan Dikemas'),
(4, 'Pembayaran Ditolak'),
(5, 'Pesanan Dikirim'),
(6, 'Pesanan Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `ketersediaanterasi`
--

CREATE TABLE `ketersediaanterasi` (
  `id_ketersediaanTerasi` int(11) NOT NULL,
  `kode_produk` varchar(45) NOT NULL,
  `nama_terasi` varchar(45) NOT NULL,
  `id_penjual` int(11) NOT NULL,
  `ukuran_terasi` varchar(45) NOT NULL,
  `jumlah_ketersediaan` varchar(45) NOT NULL,
  `harga_terasi` varchar(45) NOT NULL,
  `foto_terasi` varchar(255) NOT NULL,
  `status_pembuatan` int(11) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `tgl_restock` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ketersediaanterasi`
--

INSERT INTO `ketersediaanterasi` (`id_ketersediaanTerasi`, `kode_produk`, `nama_terasi`, `id_penjual`, `ukuran_terasi`, `jumlah_ketersediaan`, `harga_terasi`, `foto_terasi`, `status_pembuatan`, `tgl_produksi`, `tgl_restock`) VALUES
(3, 'KP_nvX1', 'Terasi 1 Kg', 1, '20', '3', '6000', 'terasijpg-202104290510411.jpg', 2, '2022-05-05', '2022-06-07'),
(5, 'KP_XNE2', 'Terasi 2 Kg', 1, '30', '17', '10000', 'KP_XNE21.jpg', 8, '2022-06-21', '2022-06-21'),
(6, 'KP_UPl2', 'Terasi 3 Kg', 1, '45', '25', '15000', 'KP_UPl2.jpg', 8, '2022-06-21', '2022-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `laporankeuangan`
--

CREATE TABLE `laporankeuangan` (
  `id_laporanKeuangan` int(11) NOT NULL,
  `nominal` varchar(45) NOT NULL,
  `jenis` varchar(45) NOT NULL,
  `saldo_terakhir` varchar(45) NOT NULL,
  `tanggal` date NOT NULL,
  `bulan` varchar(15) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporankeuangan`
--

INSERT INTO `laporankeuangan` (`id_laporanKeuangan`, `nominal`, `jenis`, `saldo_terakhir`, `tanggal`, `bulan`, `keterangan`) VALUES
(1, '50000', 'Pemasukan', '50000', '2022-06-21', 'June', 'Pemasukan Dari Pemesanan Dengan Kode 21062022S5OXDE'),
(2, '5000', 'Pengeluaran', '45000', '2022-06-21', 'June', 'Membeli Minyak Goreng'),
(3, '10000', 'Pengeluaran', '35000', '2022-06-21', 'June', 'Pengeluaran Pembuatan Terasi Dengan Kode Produk KP_XNE2'),
(4, '42000', 'Pemasukan', '77000', '2022-06-22', 'June', 'Pemasukan Dari Pemesanan Dengan Kode 220620226WSCH7');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaranpembeliterasi`
--

CREATE TABLE `pembayaranpembeliterasi` (
  `id_pembayaranPembeliTerasi` int(11) NOT NULL,
  `id_detailDataPemesanan` int(11) NOT NULL,
  `kode_transaksi` varchar(45) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `metode_pembayaran` varchar(45) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaranpembeliterasi`
--

INSERT INTO `pembayaranpembeliterasi` (`id_pembayaranPembeliTerasi`, `id_detailDataPemesanan`, `kode_transaksi`, `tgl_pembayaran`, `metode_pembayaran`, `bukti_pembayaran`) VALUES
(2, 1, '060520225B6SOP', '2022-05-06', 'Transfer', 'BBB1.JPG'),
(6, 2, '070520226U73IX', '2022-05-07', 'Transfer', 'dddd.JPG'),
(7, 3, '070520227FZZJ1', '2022-05-07', 'Transfer', 'dddd1.JPG'),
(8, 4, '310520229W1RRG', '2022-05-31', 'Transfer', 'AAA3.JPG'),
(9, 6, '20062022TB3ZML', '2022-06-20', 'Transfer', 'terasijpg-20210429051041.jpg'),
(10, 7, '20062022VCAR35', '2022-06-20', 'Transfer', 'terasijpg-202104290510411.jpg'),
(11, 1, '21062022S5OXDE', '2022-06-21', 'Transfer', 'terasijpg-202104290510412.jpg'),
(12, 2, '220620226WSCH7', '2022-06-22', 'Transfer', 'terasijpg-202104290510413.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `statuspembuatanterasi`
--

CREATE TABLE `statuspembuatanterasi` (
  `id_statusPembuatanTerasi` int(11) NOT NULL,
  `nama_statusPembuatanTerasi` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuspembuatanterasi`
--

INSERT INTO `statuspembuatanterasi` (`id_statusPembuatanTerasi`, `nama_statusPembuatanTerasi`) VALUES
(1, 'Proses Pembersihan Bahan Baku'),
(2, 'Penggaraman'),
(3, 'Penjemuran'),
(4, 'Penggilingan Bahan Baku'),
(5, 'Penjemuran Lanjut'),
(6, 'Pencetakan Terasi'),
(7, 'Pengemasan Terasi'),
(8, 'Terasi Sedang Dalam Penjualan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(45) NOT NULL,
  `no_telp` char(12) DEFAULT NULL,
  `alamat` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `jenis_kelamin` varchar(45) DEFAULT NULL,
  `foto_profil` varchar(225) NOT NULL,
  `level_user` int(11) NOT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `no_telp`, `alamat`, `email`, `password`, `jenis_kelamin`, `foto_profil`, `level_user`, `tgl_daftar`) VALUES
(1, 'Admin Tera-C', '081234835361', 'Probolinggo', 'adminTera_c@gmail.com', '0192023a7bbd73250516f069df18b500', 'Perempuan', 'default.jpg', 1, '2022-05-04'),
(2, 'Arman Maulana Saputra', '081234091823', 'Lumajang', 'user@gmail.com', '6ad14ba9986e3615423dfca256d04e3f', 'Laki - Laki', 'default.jpg', 2, '0000-00-00'),
(3, 'Coba', '081234835352', 'coba', 'coba@gmail.com', 'a3040f90cc20fa672fe31efcae41d2db', 'Laki - Laki', 'AAA.JPG', 2, '2022-05-04'),
(4, 'coba user', '081290990102', 'coba', 'cobauser@gmail.com', 'a20234a5c8c4aee9c9aa302a7b02c7c8', NULL, 'default.jpg', 2, '2022-06-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aduanpembeli`
--
ALTER TABLE `aduanpembeli`
  ADD PRIMARY KEY (`id_aduanPembeli`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indexes for table `detaildatapemesanan`
--
ALTER TABLE `detaildatapemesanan`
  ADD PRIMARY KEY (`id_detaildataPemesanan`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `id_informasiStatus` (`id_informasiStatus`);

--
-- Indexes for table `informasipemesananterasi`
--
ALTER TABLE `informasipemesananterasi`
  ADD PRIMARY KEY (`id_informasiPemesananTerasi`),
  ADD KEY `id_ketersediaanTerasi` (`kode_produk`),
  ADD KEY `kode_transaksi` (`kode_transaksi`);

--
-- Indexes for table `informasistatuspemesananterasi`
--
ALTER TABLE `informasistatuspemesananterasi`
  ADD PRIMARY KEY (`id_informasiStatus`);

--
-- Indexes for table `ketersediaanterasi`
--
ALTER TABLE `ketersediaanterasi`
  ADD PRIMARY KEY (`id_ketersediaanTerasi`),
  ADD KEY `id_penjual` (`id_penjual`),
  ADD KEY `kode_produk` (`kode_produk`),
  ADD KEY `fk_pembuatanTerasi` (`status_pembuatan`);

--
-- Indexes for table `laporankeuangan`
--
ALTER TABLE `laporankeuangan`
  ADD PRIMARY KEY (`id_laporanKeuangan`);

--
-- Indexes for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  ADD PRIMARY KEY (`id_pembayaranPembeliTerasi`),
  ADD KEY `id_detailDataPemesanan` (`id_detailDataPemesanan`);

--
-- Indexes for table `statuspembuatanterasi`
--
ALTER TABLE `statuspembuatanterasi`
  ADD PRIMARY KEY (`id_statusPembuatanTerasi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aduanpembeli`
--
ALTER TABLE `aduanpembeli`
  MODIFY `id_aduanPembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `detaildatapemesanan`
--
ALTER TABLE `detaildatapemesanan`
  MODIFY `id_detaildataPemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `informasipemesananterasi`
--
ALTER TABLE `informasipemesananterasi`
  MODIFY `id_informasiPemesananTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `informasistatuspemesananterasi`
--
ALTER TABLE `informasistatuspemesananterasi`
  MODIFY `id_informasiStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ketersediaanterasi`
--
ALTER TABLE `ketersediaanterasi`
  MODIFY `id_ketersediaanTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laporankeuangan`
--
ALTER TABLE `laporankeuangan`
  MODIFY `id_laporanKeuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  MODIFY `id_pembayaranPembeliTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `statuspembuatanterasi`
--
ALTER TABLE `statuspembuatanterasi`
  MODIFY `id_statusPembuatanTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aduanpembeli`
--
ALTER TABLE `aduanpembeli`
  ADD CONSTRAINT `fk_pembeliAduan` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detaildatapemesanan`
--
ALTER TABLE `detaildatapemesanan`
  ADD CONSTRAINT `fk_pembeliPemesanan` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasipemesananterasi`
--
ALTER TABLE `informasipemesananterasi`
  ADD CONSTRAINT `fk_kodeProduk` FOREIGN KEY (`kode_produk`) REFERENCES `ketersediaanterasi` (`kode_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ketersediaanterasi`
--
ALTER TABLE `ketersediaanterasi`
  ADD CONSTRAINT `fk_ketersediaanPenjual` FOREIGN KEY (`id_penjual`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pembuatanTerasi` FOREIGN KEY (`status_pembuatan`) REFERENCES `statuspembuatanterasi` (`id_statusPembuatanTerasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  ADD CONSTRAINT `fk_detailPemesananPembayaran` FOREIGN KEY (`id_detailDataPemesanan`) REFERENCES `detaildatapemesanan` (`id_detaildataPemesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

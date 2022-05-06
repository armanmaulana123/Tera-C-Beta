-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2022 at 12:47 PM
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
  `jenis_aduan` varchar(45) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `desk_aduan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 2, '060520225B6SOP', '20000', '2022-05-06', 'May', 2);

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
(2, '060520225B6SOP', 'KP_nvX1', 2, '10000'),
(3, '060520225B6SOP', 'KP_QF92', 1, '10000');

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
  `tgl_produksi` date NOT NULL,
  `tgl_restock` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ketersediaanterasi`
--

INSERT INTO `ketersediaanterasi` (`id_ketersediaanTerasi`, `kode_produk`, `nama_terasi`, `id_penjual`, `ukuran_terasi`, `jumlah_ketersediaan`, `harga_terasi`, `foto_terasi`, `tgl_produksi`, `tgl_restock`) VALUES
(3, 'KP_nvX1', 'Terasi 1 Kg', 1, '15', '20', '5000', 'KP_nvX1.jpg', '2022-05-05', '2022-05-05'),
(4, 'KP_QF92', 'Terasi 2 Kg', 1, '20', '15', '10000', 'KP_QF92.jpg', '2022-05-06', '2022-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `laporankeuangan`
--

CREATE TABLE `laporankeuangan` (
  `id_laporanKeuangan` int(11) NOT NULL,
  `id_penjual` int(11) NOT NULL,
  `tgl_pemasukan` date NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `pemasukan` varchar(45) NOT NULL,
  `pengeluaran` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 1, '060520225B6SOP', '2022-05-06', 'Transfer', 'BBB1.JPG');

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
(2, 'Arman Maulana Saputra', '081234091823', 'Lumajang', 'user@gmail.com', '6ad14ba9986e3615423dfca256d04e3f', NULL, 'default.jpg', 2, '2022-04-14'),
(3, 'Coba', '081234835352', 'coba', 'coba@gmail.com', 'a3040f90cc20fa672fe31efcae41d2db', 'Laki - Laki', 'AAA.JPG', 2, '2022-05-04');

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
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `laporankeuangan`
--
ALTER TABLE `laporankeuangan`
  ADD PRIMARY KEY (`id_laporanKeuangan`),
  ADD KEY `id_penjual` (`id_penjual`);

--
-- Indexes for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  ADD PRIMARY KEY (`id_pembayaranPembeliTerasi`),
  ADD KEY `id_detailDataPemesanan` (`id_detailDataPemesanan`);

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
  MODIFY `id_aduanPembeli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detaildatapemesanan`
--
ALTER TABLE `detaildatapemesanan`
  MODIFY `id_detaildataPemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id_ketersediaanTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporankeuangan`
--
ALTER TABLE `laporankeuangan`
  MODIFY `id_laporanKeuangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  MODIFY `id_pembayaranPembeliTerasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `fk_ketersediaanPenjual` FOREIGN KEY (`id_penjual`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporankeuangan`
--
ALTER TABLE `laporankeuangan`
  ADD CONSTRAINT `fk_laporanPenjual` FOREIGN KEY (`id_penjual`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaranpembeliterasi`
--
ALTER TABLE `pembayaranpembeliterasi`
  ADD CONSTRAINT `fk_detailPemesananPembayaran` FOREIGN KEY (`id_detailDataPemesanan`) REFERENCES `detaildatapemesanan` (`id_detaildataPemesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

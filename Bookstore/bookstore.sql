-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 03:34 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pemesanan` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_nota` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pemesanan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` int(11) NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_pesanan`, `id_pemesanan`, `no_nota`, `tanggal_pemesanan`, `total`, `status`) VALUES
(1, 'PMSN-037', '004', '2020-05-17 05:15:55', 150000, 'TELAH DIBAYAR'),
(2, 'PMSN-038', '003', '2020-05-17 11:17:29', 24000, 'TELAH DIBAYAR'),
(3, 'PMSN-039', '002', '2020-05-17 11:26:27', 24000, 'TELAH DIBAYAR'),
(4, 'PMSN-040', '002', '2020-05-17 11:28:11', 24000, 'TELAH DIBAYAR'),
(5, 'PMSN-041', '002', '2020-05-17 14:04:45', 54000, 'TELAH DIBAYAR'),
(6, 'PMSN-042', '002', '2020-05-17 14:07:43', 54000, 'TELAH DIBAYAR'),
(7, 'PMSN-044', '006', '2020-05-18 15:30:07', 93000, 'TELAH DIBAYAR'),
(8, 'PMSN-047', '003', '2020-05-18 15:39:41', 27000, 'TELAH DIBAYAR'),
(9, 'PMSN-048', '002', '2020-05-18 15:47:59', 36000, 'TELAH DIBAYAR'),
(10, 'PMSN-048', '005', '2020-05-18 15:49:15', 12000, 'TELAH DIBAYAR'),
(11, 'PMSN-048', '004', '2020-05-18 15:50:12', 12000, 'TELAH DIBAYAR'),
(12, 'PMSN-048', '006', '2020-05-18 17:08:45', 54000, 'TELAH DIBAYAR'),
(13, 'PMSN-048', '003', '2020-05-18 17:10:09', 54000, 'TELAH DIBAYAR'),
(14, 'PMSN-048', '005', '2020-05-18 17:10:22', 66000, 'TELAH DIBAYAR'),
(15, 'PMSN-049', '001', '2021-07-05 11:41:50', 6000, 'TELAH DIBAYAR'),
(16, 'PMSN-050', '004', '2021-07-05 12:26:52', 6000, 'TELAH DIBAYAR'),
(17, 'PMSN-051', '006', '2021-07-07 10:11:38', 18000, 'TELAH DIBAYAR'),
(18, 'PMSN-052', '005', '2021-07-07 10:29:23', 36000, 'TELAH DIBAYAR'),
(19, 'PMSN-001', '001', '2022-05-17 10:45:43', 300000, 'TELAH DIBAYAR'),
(20, 'PMSN-002', '002', '2022-05-17 10:52:02', 60000, 'TELAH DIBAYAR'),
(21, 'PMSN-003', '001', '2022-05-17 12:16:59', 60000, 'TELAH DIBAYAR'),
(22, 'PMSN-004', '001', '2022-05-17 12:56:31', 60000, 'TELAH DIBAYAR');

-- --------------------------------------------------------

--
-- Table structure for table `dompet`
--

CREATE TABLE `dompet` (
  `id_dompet` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dompet`
--

INSERT INTO `dompet` (`id_dompet`, `id_user`, `jumlah`) VALUES
(6, 1, 120000);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_user`, `id_buku`, `jumlah`) VALUES
('PMSN-001', 1, 1, 1),
('PMSN-001', 1, 4, 2),
('PMSN-001', 1, 3, 1),
('PMSN-001', 1, 2, 1),
('PMSN-002', 1, 4, 1),
('PMSN-003', 1, 2, 1),
('PMSN-004', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_buku` int(11) NOT NULL,
  `nama_buku` varchar(150) NOT NULL,
  `harga` int(255) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_buku`, `nama_buku`, `harga`, `stok`) VALUES
(1, 'Tutorial Senam Irama', 40000, 27),
(2, 'Tutorial Corel Draw', 60000, 26),
(3, 'Ensiklopedia', 80000, 15),
(4, 'Legenda Batu Ajaib', 60000, 19);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_saldo`
--

CREATE TABLE `riwayat_saldo` (
  `idRiwayatSaldo` int(11) NOT NULL,
  `id_dompet` int(11) NOT NULL,
  `riwayat_saldo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_saldo`
--

INSERT INTO `riwayat_saldo` (`idRiwayatSaldo`, `id_dompet`, `riwayat_saldo`, `tanggal_transaksi`, `keterangan`) VALUES
(20, 6, '+ 100000', '2022-05-17 10:44:12', 'PENGISIAN SALDO'),
(21, 6, '+ 100000', '2022-05-17 10:44:22', 'PENGISIAN SALDO'),
(22, 6, '+ 100000', '2022-05-17 10:44:27', 'PENGISIAN SALDO'),
(23, 6, '+ 100000', '2022-05-17 10:45:36', 'PENGISIAN SALDO'),
(24, 6, '- 300000', '2022-05-17 10:45:43', 'PEMBELIAN'),
(25, 6, '- 60000', '2022-05-17 10:52:02', 'PEMBELIAN'),
(26, 6, '+ 100000', '2022-05-17 12:16:45', 'PENGISIAN SALDO'),
(27, 6, '- 60000', '2022-05-17 12:16:59', 'PEMBELIAN'),
(28, 6, '- 60000', '2022-05-17 12:56:31', 'PEMBELIAN'),
(29, 6, '+ 100000', '2022-05-17 12:57:05', 'PENGISIAN SALDO');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sandi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `dibuat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `diubah` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `sandi`, `role`, `dibuat`, `diubah`) VALUES
(1, 'Hanif', 'hanif123@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '2022-05-17 10:42:50', '2022-05-17 10:41:22'),
(12, 'Bagas', 'bagas123@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '2022-05-17 10:46:02', '2022-05-17 10:46:02'),
(13, 'baru', 'baru@gmail.com', '202cb962ac59075b964b07152d234b70', 2, '2022-05-17 10:46:27', '2022-05-17 10:46:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `dompet`
--
ALTER TABLE `dompet`
  ADD PRIMARY KEY (`id_dompet`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD KEY `id_user` (`id_user`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `riwayat_saldo`
--
ALTER TABLE `riwayat_saldo`
  ADD PRIMARY KEY (`idRiwayatSaldo`),
  ADD KEY `id_user` (`id_dompet`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dompet`
--
ALTER TABLE `dompet`
  MODIFY `id_dompet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `riwayat_saldo`
--
ALTER TABLE `riwayat_saldo`
  MODIFY `idRiwayatSaldo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dompet`
--
ALTER TABLE `dompet`
  ADD CONSTRAINT `dompet_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `produk` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_saldo`
--
ALTER TABLE `riwayat_saldo`
  ADD CONSTRAINT `riwayat_saldo_ibfk_1` FOREIGN KEY (`id_dompet`) REFERENCES `dompet` (`id_dompet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

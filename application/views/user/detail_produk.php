<!-- <nav class="navbar navbar-secondary navbar-expand-lg">
                <div class="container">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" class="nav-link has-dropdown"><i class="fas fa-fire"></i><span>Dashboard</span></a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a href="index-0.html" class="nav-link">General Dashboard</a></li>
                                <li class="nav-item"><a href="index.html" class="nav-link">Ecommerce Dashboard</a></li>
                            </ul>
                        </li>
                        <li class="nav-item active">
                            <a href="#" class="nav-link"><i class="far fa-heart"></i><span>Top Navigation</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" class="nav-link has-dropdown"><i class="far fa-clone"></i><span>Multiple Dropdown</span></a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a href="#" class="nav-link">Not Dropdown Link</a></li>
                                <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown">Hover Me</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                                        <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown">Link 2</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                                                <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                                                <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item"><a href="#" class="nav-link">Link 3</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav> -->

<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Detail Produk / <?= $data_produk['kode_produk'] ?></h1>
        </div>

        <?php $rupiah = "Rp " . number_format($data_produk['harga_terasi'], 0, ',', '.'); ?>
        <div class="section-body">
            <div class="card">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="<?= base_url('assets/images/foto_produk/') . $data_produk['foto_terasi'] ?>" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <form action="<?= base_url('landing/tambah_keranjang') ?>" method="POST">
                            <div class="card-body">
                                <h5 class="card-title"><?= $data_produk['nama_terasi'] ?></h5>
                                <h4 class="card-text text-primary mb-3"><?= $rupiah ?></h4>
                                <div class="row mb-4">
                                    <div class="col-md-3">
                                        <p class="card-text mb-3">Ukuran Terasi</p>
                                        <p class="card-text mb-3">Tanggal Produksi</p>
                                        <p class="card-text mb-3">Terakhir Restock</p>
                                        <p class="card-text mb-3">Kuantitas</p>

                                    </div>
                                    <div class="col-md-9">
                                        <p class="card-text text-dark mb-3"><?= $data_produk['ukuran_terasi'] ?> Cm.</p>
                                        <p class="card-text text-dark mb-3"><?= date_indo($data_produk['tgl_produksi']); ?></p>
                                        <p class="card-text text-dark mb-3"><?= date_indo($data_produk['tgl_restock']); ?></p>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="number" name="qty" class="form-control" min="1">
                                                <input type="hidden" name="kode_produk" value="<?= $data_produk['kode_produk'] ?>">
                                                <input type="hidden" name="nama" value="<?= $data_produk['nama_terasi'] ?>">
                                                <input type="hidden" name="harga" value="<?= $data_produk['harga_terasi'] ?>">
                                                <input type="hidden" name="gambar" value="<?= $data_produk['foto_terasi'] ?>">
                                            </div>
                                            <div class="col-md-9">
                                                <p class="card-text text-dark mb-3">tersisa <?= $data_produk['jumlah_ketersediaan'] ?> Pcs. <?php if ($data_produk['jumlah_ketersediaan'] <= 5) { ?><i class="fas fa-info-circle text-danger" title="Stok Terbatas"></i> <?php } ?></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Masukkan Keranjang</button>&nbsp;<?php if ($data_produk['status_pembuatan'] != 8) { ?><a href="<?= base_url('landing/proses_pembuatan/') . $data_produk['kode_produk'] ?>" class="btn btn-outline-primary">Cek Proses Pembuatan</a><?php } ?>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer class="main-footer">
    <div class="footer-left">
        Copyright &copy; 2022 <div class="bullet"></div> Design By Tera-C</a>
    </div>
</footer>
</div>
</div>
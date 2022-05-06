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
            <h1>Daftar Produk</h1>
        </div>

        <div class="section-body">
            <?php if (count($data_produk) > 0) { ?>
                <div class="row">
                    <?php foreach ($data_produk as $dp) { ?>
                        <div class="col-md-4">
                            <div class="card" style="width: 18rem;">
                                <img src="<?= base_url('assets/images/foto_produk/') . $dp['foto_terasi'] ?>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><?= $dp['nama_terasi'] ?></h5>
                                    <p class="card-text">Terasi ini memiliki ukuran <?= $dp['ukuran_terasi'] ?> Cm.</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <?php $rupiah = "Rp " . number_format($dp['harga_terasi'], 0, ',', '.'); ?>
                                    <li class="list-group-item">Harga : <?= $rupiah ?></li>
                                    <li class="list-group-item">Stok : <?= $dp['jumlah_ketersediaan'] ?> Pcs.</li>
                                    <li class="list-group-item">Tanggal Produksi : <?= $dp['tgl_produksi'] ?></li>
                                </ul>
                                <div class="card-body">
                                    <a href="<?= base_url('landing/detail_produk/') . $dp['kode_produk'] ?>" class="btn btn-primary stretched-link">Beli Sekarang</a>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } else { ?>
                <h5 align="center">Tidak Ada Produk.</h5>
            <?php } ?>
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
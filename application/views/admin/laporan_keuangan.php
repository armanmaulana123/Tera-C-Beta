<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>Laporan Keuangan</h1>
        </div>
        <div class="card">
            <div class="card-header">
                <h4>Tabel Laporan Keuangan</h4>
                <!-- <div class="card-header-action">
                    <a href="#" class="btn btn-danger">View More <i class="fas fa-chevron-right"></i></a>
                </div> -->
            </div>
            <div class="card-body p-0">
                <div class="table-responsive table-invoice">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Nominal</th>
                                <th>Jenis</th>
                                <th>Tanggal</th>
                                <th>Saldo</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1; ?>
                            <?php if (count($keuangan) > 0) : ?>
                                <?php foreach ($keuangan as $p) { ?>
                                    <tr>
                                        <td><?= $no++; ?></td>

                                        <td><?= $p['nominal']; ?></td>

                                        <td><?= $p['jenis']; ?></td>

                                        <td><?= date_indo($p['tanggal']); ?></td>

                                        <td><?= $p['saldo_terakhir']; ?></td>

                                        <td><?= $p['keterangan']; ?></td>
                                    </tr>
                                <?php } ?>
                            <?php else : ?>
                                <tr>
                                    <td colspan="6" align="center">
                                        Belum Ada Data
                                    </td>
                                </tr>
                            <?php endif ?>
                        </tbody>
                    </table>
                    <div class="text-center mb-3">
                        <div>
                            <a href="<?= base_url('admin') ?>" class="btn btn-primary">Kembali</a>
                        </div>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Untuk sunting
        $('#tambahQty').on('show.bs.modal', function(event) {
            var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
            var modal = $(this)

            // Isi nilai pada field
            modal.find('#kode_produk').attr("value", div.data('id'));
            modal.find('#nama_terasi').attr("value", div.data('nama'));
        });
    });
</script>
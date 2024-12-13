<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <!-- Bootstrap CSS -->
    <link
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        rel="stylesheet"
    />
    <script
        type="text/javascript"
        src="https://app.sandbox.midtrans.com/snap/snap.js"
        data-client-key="{{ config('midtrans.client_key') }}"
    ></script>
</head>
<body class="bg-white">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h6>Pembayaran untuk Order <br> <small>#{{ $order_id }}</small></h6>
                    </div>
                    <div class="card-body text-center">
                        <p class="lead mb-4">Silakan lakukan pembayaran untuk melanjutkan proses pemesanan Anda.</p>

                        <div class="btn">
                            <!-- Tombol Bayar -->
                            <button id="pay-button" class="btn btn-success btn-sm">
                                <i class="fas fa-credit-card"></i> Bayar Sekarang
                            </button>
                            <!-- Tombol Back -->
                            <button
                                id="back-button"
                                class="btn btn-secondary btn-sm"
                                onclick="window.location.href='http://localhost:8080/cart-view'"
                            >
                                <i class="fas fa-arrow-left"></i> Kembali ke Keranjang
                            </button>
                        </div>
                    </div>
                    <div class="card-footer text-center text-muted">
                        <small>Jika ada masalah, hubungi layanan pelanggan kami.</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"
        integrity="sha384-OERcA2pmKOFLB0Bj3vUUIs1peMJDZ1N6b6kK5wDz5Zj9UnLt4SBG66jMELY3zsO7"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4Ag1FXnLv3fU8bVhjt9Sp0BoNiPbmK71mB03Bc76z0H7McuKUjt+"
        crossorigin="anonymous"
    ></script>

    <script type="text/javascript">
        // Tombol Bayar diklik
        document.getElementById('pay-button').onclick = function () {
            var snapToken = "{{ $snapToken }}"; // snap_token yang diterima dari backend

            // Panggil Midtrans Snap API untuk memulai pembayaran
            snap.pay(snapToken, {
                onSuccess: function(result) {
                    alert("Pembayaran berhasil!");
                    console.log(result);
                    // Setelah pembayaran berhasil, arahkan ke halaman utama
                    window.location.href = "http://localhost:8080/home";
                },
                onPending: function(result) {
                    alert("Pembayaran tertunda, harap tunggu.");
                    console.log(result);
                },
                onError: function(result) {
                    alert("Pembayaran gagal!");
                    console.log(result);
                }
            });
        };
    </script>
</body>
</html>

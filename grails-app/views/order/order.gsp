<%--
  Created by IntelliJ IDEA.
  User: wilson
  Date: 29/10/24
  Time: 17.23
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'pesan.css')}">
        <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'bootstrap.min.css')}">
        <title>Form Pemesanan</title>
    </head>
    <body>
        <div class="order-form">
            <h2>Form Pemesanan Laundry</h2>
            <g:form controller="order" action="saveOrder" method="post">
                <!-- Nama -->
                <div class="form-group">
                    <label for="name">Nama Lengkap</label>
                    <g:textField type="text" id="name" name="name" placeholder="Masukkan nama pelanggan"/>
                </div>

                <!-- Jenis Pesanan -->
                <div class="form-group">
                    <label for="orderType">Jenis Pesanan</label>
                    <select id="orderType" name="orderType" >
                        <option value="">Pilih Layanan</option>
                        <option value="laundry_kiloan">Kiloan Cuci Setrika</option>
                        <option value="laundry_express_24">Laundry Ekspres - 24 Jam</option>
                        <option value="laundry_express_3">Laundry Ekspres - 3 Jam</option>
                        <option value="bed_cover">Bed Cover</option>
                        <option value="setelan">Setelan</option>
                        <option value="sepatu_tas">Sepatu & Tas</option>
                    </select>
                </div>

                <!-- Jumlah Pesanan -->
                <div class="form-group">
                    <label for="quantity">Jumlah Pesanan (kg atau item)</label>
                    <g:textField type="number" id="quantity" name="quantity" min="1" placeholder="Masukkan jumlah pesanan"/>
                </div>

                <!-- Alamat -->
                <div class="form-group">
                    <label for="address">Alamat</label>
                    <g:textArea id="address" name="address" placeholder="Masukkan alamat pelanggan"></g:textArea>
                </div>

                <!-- Nomor Telepon -->
                <div class="form-group">
                    <label for="phoneNumber">Nomor Telepon</label>
                    <g:textField type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]+" placeholder="Masukkan No Telp"/>
                </div>

                <!-- Tombol Submit -->
                <g:submitButton name="submit" class="submit-btn" value="Submit Order">Submit Pesanan</g:submitButton>
            </g:form>
        </div>
        <a href="admin">Kembali</a>
        <g:if test="${flash.message}">
            <div class="alert alert-warning" style="margin-top: 20px">${flash.message}</div>
        </g:if>

    </body>
</html>
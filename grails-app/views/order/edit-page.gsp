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
        <title>Form Pemesanan</title>
    </head>
    <body>
        <div class="order-form">
            <h2>Edit Pemesanan Laundry</h2>
            <g:form controller="order" action="updateData" method="post">
                <g:hiddenField name="orderId" value="${orders.id}"/>
                <div class="form-group">
                    <label for="name">Nama Lengkap</label>
                    <g:textField type="text" id="name" name="name" value="${orders.name}"/>
                </div>
                <div class="form-group">
                    <label for="orderType">Jenis Pesanan</label>
                    <select id="orderType" name="orderType">
                        <option value="laundry_kiloan" ${orders.orderType == 'laundry_kiloan' ? 'selected' : ''}>Kiloan Cuci Setrika</option>
                        <option value="laundry_express_24" ${orders.orderType == 'laundry_express_24' ? 'selected' : ''}>Laundry Ekspres - 24 Jam</option>
                        <option value="laundry_express_3" ${orders.orderType == 'laundry_express_3' ? 'selected' : ''}>Laundry Ekspres - 3 Jam</option>
                        <option value="bed_cover" ${orders.orderType == 'bed_cover' ? 'selected' : ''}>Bed Cover</option>
                        <option value="setelan" ${orders.orderType == 'setelan' ? 'selected' : ''}>Setelan</option>
                        <option value="sepatu_tas" ${orders.orderType == 'sepatu_tas' ? 'selected' : ''}>Sepatu & Tas</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="quantity">Jumlah Pesanan (kg atau item)</label>
                    <g:textField type="number" id="quantity" name="quantity" min="1" value="${orders.quantity}"/>
                </div>
                <div class="form-group">
                    <label for="address">Alamat</label>
                    <g:textArea id="address" name="address" value="${orders.address}" ></g:textArea>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Nomor Telepon</label>
                    <g:textField type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]+" value="${orders.phoneNumber}"/>
                </div>
                <g:submitButton name="submit" class="submit-btn" value="Submit Order">Submit Pesanan</g:submitButton>
            </g:form>
        </div>
        <a href="admin">Kembali</a>
        ${flash.message}
    </body>
</html>
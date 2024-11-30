<%--
  Created by IntelliJ IDEA.
  User: wilson
  Date: 29/10/24
  Time: 17.43
--%>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Admin - Washaholic Laundry</title>
        <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'bootstrap.min.css')}">
        <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'admin.css')}">
    </head>
    <body>
        <div class="order">
            <a href="order">Buat Pesanan</a>
            <g:if test="${complaints}">
                <a href="/complaint/showComplaint">Keluhan</a>
            </g:if>
            <g:form controller="login" action="logout" method="post">
                <g:submitButton name="logout" value="Log out" class="logout"/>
            </g:form>
        </div>
        <h2>Dashboard Admin - Pesanan Customer</h2>

        <div class="dropdown">
            <span class="span">Cari berdasarkan: <symbol>&#9660;</symbol></span>
            <div class="dropdown-content">
                <div class="submenu">
                    <a>Pembayaran <span style="float: right; font-size: 12px;">▶</span></a>
                    <div class="submenu-content">
                        <g:form action="filterPayment" method="post">
                            <g:submitButton name="payment" value="Lunas" class="payment"/>
                            <g:submitButton name="payment" value="Belum Lunas" class="payment"/>
                        </g:form>
                    </div>
                </div>
                <div class="submenu">
                    <a>Status <span style="float: right; font-size: 12px;">▶</span></a>
                    <div class="submenu-content">
                        <g:form action="filterStatus" method="post">
                            <label for="Diambil" class="container">&nbsp; &nbsp; Diambil
                                <input type="checkbox" id="Diambil" name="status" value="Diambil">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Dicuci" class="container">&nbsp; &nbsp; Dicuci
                                <input type="checkbox" id="Dicuci" name="status" value="Dicuci">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Disetrika" class="container">&nbsp; &nbsp; Disetrika
                                <input type="checkbox" id="Disetrika" name="status" value="Disetrika">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Diantar" class="container">&nbsp; &nbsp; Diantar
                                <input type="checkbox" id="Diantar" name="status" value="Diantar">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Selesai" class="container">&nbsp; &nbsp; Selesai
                                <input type="checkbox" id="Selesai" name="status" value="Selesai">
                                <span class="checkmark"></span><br>
                            </label>
                            <div class="cari-button">
                                <g:submitButton name="status-filter" value="Cari" class="btn btn-outline-secondary"/>
                            </div>
                        </g:form>
                    </div>
                </div>
                <div class="submenu">
                    <a>No Telp</a>
                    <div class="submenu-content input">
                        <g:form action="filterPhoneNumber" method="post">
                            <g:textField class="text" type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]+" placeholder="Masukkan No Telp" />
                            <div class="cari-button">
                                <g:submitButton name="phone-number-filter" value="Cari" class="btn btn-outline-secondary"/>
                            </div>

                        </g:form>
                    </div>
                </div>
                <div class="submenu">
                    <a>Nama</a>
                    <div class="submenu-content input">
                        <g:form action="filterName" method="post">
                            <g:textField class="text" type="text" id="name" name="name" placeholder="Masukkan nama pelanggan"/>
                            <div class="cari-button">
                                <g:submitButton name="name-filter" value="Cari" class="btn btn-outline-secondary"/>
                            </div>
                        </g:form>
                    </div>
                </div>
                <div class="submenu">
                    <a>Jenis Pesanan <span style="float: right; font-size: 12px;">▶</span></a>
                    <div class="submenu-content" style="min-width: 200px;">
                        <g:form action="filterOrderType" method="post">
                            <label for="Kiloan" class="container">&nbsp; &nbsp; Kiloan Cuci Setrika
                                <input type="checkbox" id="Kiloan" name="orderType" value="laundry_kiloan">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Ekspres24" class="container">&nbsp; &nbsp; Ekspres 24 Jam
                                <input type="checkbox" id="Ekspres24" name="orderType" value="laundry_express_24">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Ekspres3" class="container">&nbsp; &nbsp; Ekspres 3 jam
                                <input type="checkbox" id="Ekspres3" name="orderType" value="laundry_express_3">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Bed" class="container">&nbsp; &nbsp; Bed Cover
                                <input type="checkbox" id="Bed" name="orderType" value="bed_cover">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Setelan" class="container">&nbsp; &nbsp; Setelan
                                <input type="checkbox" id="Setelan" name="orderType" value="setelan">
                                <span class="checkmark"></span><br>
                            </label>

                            <label for="Sepatu" class="container">&nbsp; &nbsp; Sepatu & Tas
                                <input type="checkbox" id="Sepatu" name="orderType" value="sepatu_tas">
                                <span class="checkmark"></span><br>
                            </label>
                            <div class="cari-button">
                                <g:submitButton name="order-type-filter" value="Cari" class="btn btn-outline-secondary"/>
                            </div>
                        </g:form>
                    </div>
                </div>
                <g:if test="${actionName != 'admin'}">
                    <div class="submenu" style="background-color: #bbb" ><a href="admin">Tampilan Awal</a></div>
                </g:if>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Jenis Pesanan</th>
                        <th>Jumlah</th>
                        <th>Alamat</th>
                        <th>Nomor Telepon</th>
                        <th>Tanggal Pemesanan</th>
                        <th>Pembayaran</th>
                        <th>Total</th>
                        <th>Status Pesanan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody id="order-table-body">
                    <g:each in="${orders}" var="order">
                        <tr>
                            <td>${order.name}</td>
                            <td>${order.orderType}</td>
                            <td>${order.quantity}</td>
                            <td>${order.address}</td>
                            <td>${order.phoneNumber}</td>
                            <td>${order.formattedDate}</td>
                            <td class="${order.payment == 'Belum Lunas' ? 'belum' : 'lunas'}">${order.payment}</td>
                            <td>Rp<g:formatNumber number="${order.total}" format="###,###" locale="in_ID"/></td>
                            <td class=${order.status}>${order.status}</td>
                            <td>
                                <div class="tombol-grup">
                                    <g:form action="detailOrder" method="post">
                                        <g:hiddenField name="orderId" value="${order.id}"/>
                                        <g:hiddenField name="from" value="admin"/>
                                        <g:submitButton name="detail-name" value="Detail" class="btn btn-primary w-100 tombol"/>
                                    </g:form>
                                    <g:form action="editData" method="post">
                                        <g:hiddenField name="orderId" value="${order.id}"/>
                                        <g:submitButton name="edit-name" value="Edit" class="btn btn-secondary w-100 tombol"/>
                                    </g:form>
                                    <button type="button" data-id="${order.id}" class="btn btn-danger w-100 tombol openModalButton">Hapus</button>
                                </div>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                ${flash.message}
            </div>
        </g:if>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <h2 style="text-align: center; color: black; font-weight: bold">Hapus Pesanan</h2>
                <p>Apakah anda yakin pesanan akan dihapus? (Pesanan yang sudah dihapus tidak dapat dikembalikan)</p>
                <div class="modal-button">
                    <button id="closeModalButton" class="btn btn-danger">Tidak</button>
                    <g:form action="deleteData" method="post">
                        <g:hiddenField id="hiddenField" name="orderId" value=""/>
                        <g:submitButton name="delete-name" value="Hapus" class="btn btn-danger hapus"/>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
    <asset:javascript src="admin.js"/>
</html>
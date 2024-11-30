<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Pesanan Pelanggan</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'detail.css')}">
    </head>
    <body>
        <h1 id="name">${order.name}</h1>

        <g:if test="${order}">
            <table id="status-table">
                <tbody>
                <tr>
                    <td id="order_title"><h3>${order.orderType}</h3></td>
                </tr>

                <tr>
                    <td>Jumlah</td>
                    <td>${order.quantity}</td>
                </tr>

                <tr>
                    <td>Alamat</td>
                    <td>${order.address}</td>
                </tr>

                <tr>
                    <td>Nomor Telepon</td>
                    <td>${order.phoneNumber}</td>
                </tr>

                <tr>
                    <td>Masuk</td>
                    <td>${order.formattedDate}</td>
                </tr>

                <tr>
                    <td>Ambil</td>
                    <td><g:if test="${order.orderType == 'laundry_express_3'}">
                        ${order.finishDate3}
                    </g:if>
                    <g:elseif test="${order.orderType == 'laundry_express_24'}">
                        ${order.finishDate24}
                    </g:elseif>
                    <g:else>
                        ${order.finishDate}
                    </g:else>
                    </td>
                </tr>

                <tr>
                    <td>Pembayaran</td>
                    <td class="tombol">
                        <span class="${order.payment == 'Belum Lunas' ? 'belum' : 'lunas'}">${order.payment}</span>
                        <g:form action="changePayment" method="post" >
                            <g:hiddenField name="orderId" value="${order.id}"/>
                            <g:if test="${order.payment == 'Belum Lunas'}">
                                <button type="button" id="openModalButton" class="btn btn-success">Lunas</button>
                            </g:if>
                            <g:else>
                                <g:submitButton name="payment" value="Belum Lunas" class="btn btn-danger"/>
                            </g:else>
                        </g:form>
                    </td>
                </tr>

                <tr>
                    <td>Total</td>
                    <td>Rp<g:formatNumber number="${order.total}" format="###,###" locale="in_ID"/></td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td class="tombol">
                        <span class="${order.status}">${order.status}</span>
                        <g:form action="changeStatus" method="post" >
                            <g:hiddenField name="orderId" value="${order.id}"/>
                            <g:hiddenField name="status" value="${order.status}"/>
                            <g:if test="${order.status == 'Diambil'}">
                                <g:submitButton name="statusButton" value="Update" class="btn btn-success"/>
                            </g:if>
                            <g:elseif test="${order.status == 'Diantar'}">
                                <g:submitButton name="statusButton" value="Downgrade" class="btn btn-danger"/>
                                <button type="button" id="openModalButton" class="btn btn-success">Update</button>
                            </g:elseif>
                            <g:elseif test="${order.status == 'Selesai'}">
                                <g:submitButton name="statusButton" value="Downgrade" class="btn btn-danger"/>
                            </g:elseif>
                            <g:else>
                                <g:submitButton name="statusButton" value="Downgrade" class="btn btn-danger"/>
                                <g:submitButton name="statusButton" value="Update" class="btn btn-success"/>
                            </g:else>
                        </g:form>
                    </td>
                </tr>
                </tbody>
            </table>

            <table id="progress-table">
                <tr>
                    <td colspan="2">Progress</td>
                </tr>
                <tr>
                    <td class="Diambil">Diambil</td>
                    <td>${order.formattedDate}</td>
                </tr>
                <g:if test="${order.washedDate != order.formattedDate}">
                    <tr>
                        <td class="Dicuci">Dicuci</td>
                        <td>${order.washedDate}</td>
                    </tr>
                </g:if>

                <g:if test="${order.ironedDate != order.formattedDate}">
                    <tr>
                        <td class="Disetrika">Disetrika</td>
                        <td>${order.ironedDate}</td>
                    </tr>
                </g:if>

                <g:if test="${order.deliveredDate != order.formattedDate}">
                    <tr>
                        <td class="Diantar">Diantar</td>
                        <td>${order.deliveredDate}</td>
                    </tr>
                </g:if>

                <g:if test="${order.finishedDate != order.formattedDate}">
                    <tr>
                        <td class="Selesai">Selesai</td>
                        <td>${order.finishedDate}</td>
                    </tr>
                </g:if>

                <g:if test="${order.paidDate != order.formattedDate}">
                    <tr>
                        <td class="lunas">Lunas</td>
                        <td>${order.paidDate}</td>
                    </tr>
                </g:if>
            </table>
        </g:if>

        <g:if test="${!order}">
            <p>Tidak ada pesanan</p>
        </g:if>

        <g:if test="${from == 'admin'}">
            <p><a href="admin">Kembali</a></p>
        </g:if>
        <g:else>
            <p><a href="../complaint/showComplaint">Kembali</a></p>
        </g:else>

        <g:if test="${flash.message == 'Lunas' || flash.message == 'Selesai'}">
            <p class="alert alert-success">${flash.message}</p>
        </g:if>
        <g:elseif test="${flash.message == 'Diantar'}">
            <p class="alert alert-primary">${flash.message}</p>
        </g:elseif>
        <g:elseif test="${flash.message == null}"></g:elseif>
        <g:else>
            <p class="alert alert-warning">${flash.message}</p>
        </g:else>


%{--        Pop-Up--}%
        <div id="myModal" class="modal">
            <div class="modal-content">
                <g:if test="${order.payment == 'Belum Lunas'}">
                    <h2 style="text-align: center">Pembayaran Lunas</h2>
                    <p>Apakah pembayaran sudah lunas? (Status pembayaran yang sudah lunas tidak dapat diubah)</p>
                    <div class="modal-button">
                        <button id="closeModalButton" class="btn btn-danger">Tidak</button>
                        <g:form action="changePayment" method="post">
                            <g:hiddenField name="orderId" value="${order.id}"/>
                            <g:submitButton name="payment" value="Lunas" class="btn btn-success update"/>
                        </g:form>
                    </div>
                </g:if>

                <g:else>
                    <h2 style="text-align: center">Selesaikan Pesanan</h2>
                    <p>Apakah pesanan sudah selesai? (Status pesanan yang sudah selesai tidak dapat diubah)</p>
                    <div class="modal-button">
                        <button id="closeModalButton" class="btn btn-danger">Tidak</button>
                        <g:form action="changeStatus" method="post">
                            <g:hiddenField name="orderId" value="${order.id}"/>
                            <g:hiddenField name="status" value="${order.status}"/>
                            <g:submitButton name="statusButton" value="Update" class="btn btn-success update"/>
                        </g:form>
                    </div>
                </g:else>
            </div>
        </div>
    </body>
    <script>
        // Mendapatkan elemen modal dan tombol
        const modal = document.getElementById("myModal");
        const openModalButton = document.getElementById("openModalButton");
        const closeModalButton = document.getElementById("closeModalButton");

        // Menampilkan modal saat tombol ditekan
        openModalButton.addEventListener("click", function() {
            event.preventDefault();
            modal.style.display = "block"; // Menampilkan modal
            // Memuat konten dinamis, misalnya dengan menggunakan fetch
        });

        // Menutup modal saat tombol close ditekan
        closeModalButton.addEventListener("click", function() {
            modal.style.display = "none"; // Menyembunyikan modal
        });

        window.addEventListener("click", function(event) {
            if (event.target === modal) {
                modal.style.display = "none"; // Menyembunyikan modal jika klik di luar modal
            }
        });

    </script>
</html>
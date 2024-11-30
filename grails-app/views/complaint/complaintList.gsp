<%--
  Created by IntelliJ IDEA.
  User: wilson
  Date: 08/11/24
  Time: 10.17
--%>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Daftar Keluhan</title>
        <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'bootstrap.min.css')}">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 20px;
            }

            h2 {
                text-align: center;
                color: #0072ce;
            }

            .table-container {
                margin: 20px auto;
                width: 90%;
                max-width: 1500px;
                overflow-x: auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px 8px;
                text-align: center;
                border: 1px solid #ddd;
            }

            th {
                background-color: #0072ce;
                color: white;
                font-weight: bold;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .tombol{
                font-size: 10px;
                margin: 0 auto 4px auto;
                padding: 2px;
                display:inline;
            }

            a{
                color: rebeccapurple;
                text-decoration: underline;
            }

            .belum {
                color: #f44336;
                font-weight: bold;
            }

            .Selesai{
                color: #4caf50;
                font-weight: bold;
            }

            .modal {
                display: none;                     /* Modal disembunyikan secara default */
                position: fixed;                   /* Posisi tetap */
                z-index: 1;                        /* Menampilkan di atas konten lainnya */
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;                    /* Mengizinkan scroll jika konten lebih panjang */
                background-color: rgba(0, 0, 0, 0.5); /* Latar belakang semi-transparan */
                transition: all 0.3s ease;         /* Transisi halus saat muncul dan hilang */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Bisa disesuaikan */
                max-width: 500px; /* Ukuran maksimum */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 5px;
            }

            .modal-button{
                display: flex;
                justify-content: center;
                gap: 20px;
            }

            .modal-button button, .modal-button .hapus{
                font-size: 16px;
                padding: 6px 12px;
            }
        </style>
    </head>
    <body>
        <h2>Daftar Keluhan</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th style="width: 220px">Nama</th>
                        <th style="width: 150px">Nomor Telepon</th>
                        <th style="width: 150px">Jenis Pesanan</th>
                        <th>Keluhan</th>
                        <th style="width: 70px">Status</th>
                        <th style="width: 140px">Aksi</th>
                    </tr>
                </thead>
                <tbody id="order-table-body">
                    <g:each in="${complaints}" var="complaint">
                        <tr>
                            <td style="width: 220px">${complaint.name}</td>
                            <td style="width: 150px">${complaint.phoneNumber}</td>
                            <td style="width: 150px">${complaint.orderType}</td>
                            <td>${complaint.message}</td>
                            <td style="width: 70px" class="${complaint.status == 'Selesai' ? 'Selesai' : 'belum'}">${complaint.status}</td>
                            <td style="width: 140px">
                                <g:form controller="order" action="detailOrder" method="post" style="display: inline;">
                                    <g:hiddenField name="orderId" value="${complaint.orderId}"/>
                                    <g:hiddenField name="from" value="complaint"/>
                                    <g:submitButton name="detail-complaint" value="Detail" class="btn btn-primary tombol"/>
                                </g:form>
                                <g:if test="${complaint.status == 'Belum ditangani'}">
                                    <button type="button" complaint-id="${complaint.id}" click="selesai" class="btn btn-success tombol openModalButton">Selesai</button>
%{--                                    <g:form action="complaintStatus" method="post" style="display: inline;">--}%
%{--                                        <g:hiddenField name="complaintId" value="${complaint.id}"/>--}%
%{--                                        <g:submitButton name="status" value="Selesai" class="btn btn-success tombol"/>--}%
%{--                                    </g:form>--}%
                                </g:if>

                                <button type="button" complaint-id="${complaint.id}" click="hapus" class="btn btn-danger tombol openModalButton">Hapus</button>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <h2 style="text-align: center; color: black; font-weight: bold">Hapus Keluhan</h2>
                <p>Apakah anda yakin keluhan akan dihapus? (Keluhan yang sudah dihapus tidak dapat dikembalikan)</p>
                <div class="modal-button">
                    <button id="closeModalButton" class="btn btn-danger">Tidak</button>
                    <g:form action="deleteComplaint" method="post">
                        <g:hiddenField id="hiddenField" name="orderId" value=""/>
                        <g:submitButton name="delete-name" value="Hapus" class="btn btn-danger hapus"/>
                    </g:form>
                </div>
            </div>
        </div>

        <div id="myModal1" class="modal">
            <div class="modal-content">
                <h2 style="text-align: center; color: black; font-weight: bold">Selesaikan Keluhan</h2>
                <p>Apakah keluhan telah ditangani? (Keluhan yang sudah diselesaikan tidak dapat diubah)</p>
                <div class="modal-button">
                    <button id="closeModalButton1" class="btn btn-danger">Tidak</button>
                    <g:form action="complaintStatus" method="post" style="display: inline;">
                        <g:hiddenField id="hiddenField1" name="complaintId" value=""/>
                        <g:submitButton name="status" value="Selesai" class="btn btn-success tombol hapus"/>
                    </g:form>
                </div>
            </div>
        </div>
        <p style="text-align: center"><a href="../../order/admin">Kembali</a></p>
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                ${flash.message}
            </div>
        </g:if>
    </body>
    <script>
        const modal = document.getElementById("myModal");
        const openModalButton = document.querySelectorAll('.openModalButton');
        const closeModalButton = document.getElementById("closeModalButton");
        const hiddenField = document.getElementById('hiddenField');

        const modal1 = document.getElementById("myModal1");
        const closeModalButton1 = document.getElementById("closeModalButton1");
        const hiddenField1 = document.getElementById('hiddenField1');

        openModalButton.forEach(function(button){
            button.addEventListener("click", function(){
                event.preventDefault();
                const click = event.target.getAttribute('click');
                if(click === 'hapus'){
                    modal.style.display = "block";
                    const complaintid = event.target.getAttribute('complaint-id');
                    hiddenField.value = complaintid;
                }
                else if(click === 'selesai'){
                    modal1.style.display = "block";
                    const complaintid = event.target.getAttribute('complaint-id');
                    hiddenField1.value = complaintid;
                }

            })
        })

        closeModalButton.addEventListener("click", function() {
            modal.style.display = "none"; // Menyembunyikan modal
        });

        closeModalButton1.addEventListener("click", function() {
            modal1.style.display = "none"; // Menyembunyikan modal
        });

        window.addEventListener("click", function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
            else if(event.target === modal1){
                modal1.style.display = "none";
            }
        });
    </script>
</html>

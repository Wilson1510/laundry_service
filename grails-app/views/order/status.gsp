%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: wilson--}%
%{--  Date: 31/10/24--}%
%{--  Time: 17.13--}%
%{----%>--}%

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Status Pesanan Saya</title>
        <style>
            *{
                font-family: Arial, sans-serif;
            }

            h1{
                text-align: center;
            }

            table {
                border-collapse: collapse;
                width: 90%;
                max-width: 768px;
                margin: auto;
                margin-bottom: 16px;
            }

            #status-table td {
                border-bottom: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            #status-table td:first-child{
                background-color: #0072ce;
                color: white;
                font-weight: bold;
                width: 40%;
            }

            #status-table #order_title{
                background-color: white;
                color: black;
                text-transform: capitalize;
                border: none;
            }

            #progress-table td{
                border: 1px solid #ddd;
                padding: 8px;
            }

            #progress-table tr:first-child{
                background-color: #2e8b57;
                color: white;
                font-weight: bold;
                text-align: center;
            }

            .Diambil, .Dicuci, .Disetrika {
                color: #ff9800;
                font-weight: bold;
            }

            .Selesai, .lunas{
                color: #4caf50;
                font-weight: bold;
            }

            .Diantar{
                color: #007cff;
                font-weight: bold;
            }

            .belum {
                color: #f44336;
                font-weight: bold;
            }

            p{
                text-align: center;
            }

            .tombol{
                padding: 8px 12px;
                border-radius: 3px;
                border: none;
                background-color: #0072ce;
                color: white;
                text-decoration: none;
            }

            .tombol:hover{
                background-color: #005999;
                color: #cdc7c7;
                text-decoration: none;
                cursor: pointer;
            }

            .alert {
                padding: 15px;
                margin: 10px 0;
                border-radius: 4px;
                font-family: Arial, sans-serif;
                font-size: 14px;
                border: 1px solid;
                display: flex;
                align-items: center;
            }

            .alert-success {
                background-color: #d4edda;
                border-color: #c3e6cb;
                color: #155724;
            }
        </style>
    </head>
    <body>
        <h1>Pesanan Saya</h1>
        <table>
            <tbody>
                <tr>
                    <td id="name"><h2>${orders.name[0]}</h2></td>
                </tr>
            </tbody>
        </table>
        <g:if test="${orders}">
            <g:each in="${orders}" var="order">
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
                            <td class="${order.payment == 'Belum Lunas' ? 'belum' : 'lunas'}">${order.payment}</td>
                        </tr>

                        <tr>
                            <td>Total</td>
                            <td>Rp<g:formatNumber number="${order.total}" format="###,###" locale="in_ID"/></td>
                        </tr>

                        <tr>
                            <td>Status</td>
                            <td class="${order.status}">${order.status}</td>
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
                <g:set var="isSelesai" value=""/>
                <g:if test="${order.status == 'Selesai'}">
                    <g:set var="isSelesai" value="true" />
                </g:if>
                <g:if test="${isSelesai}">
                    <p>Merasa ada yang kurang?
                        <a href="../complaint?orderId=${order.id}&name=${order.name}&orderType=${order.orderType}">Ajukan keluhan</a><br> (Maksimal 24 jam setelah barang diterima)
                    </p>
                </g:if>
            </g:each>
        </g:if>

        <g:if test="${!orders}">
            <p>Belum ada pesanan yang terdaftar atas nama Anda.</p>
            <p>${flash.message}</p>
        </g:if>



        <p><a href="../../login/changePassword">Ubah password</a></p>
        <div style="text-align: center"><g:form controller="login" action="logout" method="post">
            <g:submitButton name="logout" value="Log Out" class="tombol"/>
        </g:form></div>
        <g:if test="${flash.message}">
            <p class="alert alert-success">${flash.message}</p>
        </g:if>
    </body>
</html>
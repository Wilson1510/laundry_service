<%--
  Created by IntelliJ IDEA.
  User: wilson
  Date: 08/11/24
  Time: 11.57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'pesan.css')}">
        <title>Ubah Password</title>
    </head>
    <body>
        <div class="order-form">
            <h2>Ubah Password</h2>
            <g:form controller="login" action="updatePassword" method="post">
                <div class="form-group">
                    <label for="newPassword">Masukkan password baru</label>
                    <g:passwordField name="newPassword"></g:passwordField>
                </div>
                <g:submitButton name="submit" class="submit-btn" value="Kirim"></g:submitButton>
            </g:form>
            <p style="color: red; text-align: center">${flash.message}</p>
        </div>
        <a href="../../order/orderStatus">Kembali</a>
    </body>
</html>
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
            <h2>Ajukan Keluhan</h2>
            <g:form controller="complaint" action="sendComplaint" method="post">
                <div class="form-group">
                    <g:hiddenField name="name" value="${complaints.name}"/>
                    <g:hiddenField name="orderType" value="${complaints.orderType}"/>
                    <g:hiddenField name="orderId" value="${complaints.orderId}"/>
                    <label for="complaintMessage">Keluhan</label>
                    <g:textArea id="complaintMessage" name="complaintMessage" ></g:textArea>
                </div>
                <g:submitButton name="submit" class="submit-btn" value="Kirim"></g:submitButton>
            </g:form>
            <p style="color: red; text-align: center">${flash.message}</p>
        </div>
        <a href="../order/orderStatus">Kembali</a>
    </body>
</html>
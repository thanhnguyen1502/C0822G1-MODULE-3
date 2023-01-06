<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/1/2023
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <form action="/CustomerFurama?action=create">
                <div class="text-center">
                    <h1>Add New Customer</h1>
                </div>

                <div class="mt-3">
                    <label for="nameCustomer" class="form-label fw-bold">Name Customer:</label>
                    <input type="text" class="form-control" name="nameCustomer" id="nameCustomer" required>
                </div>
                <div class="mt-3">
                    <label for="birthdayCustomer" class="form-label fw-bold">BirthDay:</label>
                    <input name="birthdayCustomer" id="birthdayCustomer" type="text" required>
                </div>
                <div class="mt-3">
                    <label for="genderCustomer" class="form-label fw-bold">Gender: </label>
                    <select name="genderCustomer" id="genderCustomer">
                        <option value="false">Nữ</option>
                        <option value="true">Nam</option>
                    </select>
                </div>
                <div class="mt-3">
                    <label for="idCard" class="form-label fw-bold">Id Card:</label>
                    <input type="text" name="idCard" id="idCard">
                </div>
                <div class="mt-3">
                    <label for="phoneCustomer" class="form-label fw-bold">Phone Customer</label>
                    <input type="text" name="phoneCustomer" id="phoneCustomer">
                </div>
                <div class="mt-3">
                    <label for="emailCustomer" class="form-label fw-bold">Email Customer:</label>
                    <input type="text" name="emailCustomer" id="emailCustomer">
                </div>
                <div class="mt-3">
                    <label for="customerType" class="form-label fw-bold">Customer Type</label>
                    <select name="customerType" id="customerType">
                        <option value="5">Member</option>
                        <option value="4">Silver</option>
                        <option value="3">Gold</option>
                        <option value="2">Platinium</option>
                        <option value="1">Diamond</option>
                    </select>
                </div>
                <div class="mt-3">
                    <label for="addressCustomer" class="form-label fw-bold">Address:</label>
                    <input type="text" name="addressCustomer" id="addressCustomer">
                </div>
            </form>
        </div>
        <div class="col-lg-3"></div>
    </div>

</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/11/2022
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <%@ include file="/include/backgroud.jsp" %>
</head>
<body>
<%@ include file="/include/header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-lg-3"></div>
        <div style="background: #e9f2ef" class="col-lg-6 shadow-lg">
            <form action="/CustomerFurama?action=updateCustomer&id=${customer.customerID}" method="post">
                <div class="mb-5 mt-3 text-center">
                    <h1>Edit Customer Form</h1>
                </div>

                <c:if test="${message != null}">
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </symbol>
                        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                        </symbol>
                        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </symbol>
                    </svg>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                        <div>
                                ${message}
                        </div>
                    </div>
                </c:if>

                <div class="mb-3">
                    <label for="nameCustomer" class="form-label fw-bold">Name Customer:</label>
                    <input required type="text" value="${customer.name}" class="form-control" name="nameCustomer" id="nameCustomer" aria-describedby="emailHelp">
                </div>

                <div class="mb-3">
                    <label for="birthDayCustomer" class="form-label fw-bold">Birth Day:</label>
                    <input required type="date" value="${customer.birthday}" class="form-control" name="birthDayCustomer" id="birthDayCustomer">
                </div>

                <div class="mb-3">
                    <label for="genderCustomer" class="form-label fw-bold">Gender:</label>
                    <select name="genderCustomer" id="genderCustomer" class="form-select" aria-label="Default select example">
                        <c:if test="${customer.gender == false}">
                            <option value="false">Nữ</option>
                        </c:if>
                        <c:if test="${customer.gender == true}">
                            <option value="true">Nam</option>
                        </c:if>
                        <option value="false">Nữ</option>
                        <option value="true">Nam</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="idCard" class="form-label fw-bold">Id Card:</label>
                    <input required type="text" value="${customer.id}" class="form-control" name="idCard" id="idCard">
                </div>

                <div class="mb-3">
                    <label for="phoneCustomer" class="form-label fw-bold">Phone:</label>
                    <input required type="text" value="${customer.phoneNumber}" class="form-control" name="phoneCustomer" id="phoneCustomer">
                </div>

                <div class="mb-3">
                    <label for="emailCustomer" class="form-label fw-bold">Email:</label>
                    <input required type="email" value="${customer.email}" class="form-control" name="emailCustomer" id="emailCustomer">
                </div>

                <div class="mb-3">
                    <label for="customerType" class="form-label fw-bold">Customer Type:</label>
                    <select name="customerType" id="customerType" value="" class="form-select" aria-label="Default select example">
                        <option value="${customer.getCustomerTypeId(customer.customerType)}">${customer.customerType}</option>
                        <option value="1">Member</option>
                        <option value="2">Silver</option>
                        <option value="3">Gold</option>
                        <option value="4">Platinum</option>
                        <option value="5">Diamond</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label fw-bold">Address:</label>
                    <input required type="text" value="${customer.address}" class="form-control" name="customerAddress" id="address">
                </div>
                <button type="submit" class="btn btn-primary">Update Now</button>
            </form>
        </div>
        <div class="col-lg-3"></div>
    </div>
</div>

<%@ include file="/include/footer.jsp" %>
<script src="/common/popper.min.js"></script>
<script src="/common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
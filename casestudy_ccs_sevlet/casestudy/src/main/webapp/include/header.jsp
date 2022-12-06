<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/11/2022
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="common/bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>

<nav class="navbar navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="http://localhost:8080/">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" alt="" width="90" height="100">
        </a>
        <b class="text-end">
            Nguyễn Văn Thành
        </b>
    </div>
</nav>

<div class="row bg-success sticky-top">
    <div class="col-lg-3"></div>
    <div class="col-lg-6 d-flex justify-content-center">
        <nav class="navbar navbar-expand-lg navbar-light bg-success sticky-top">
            <div class="container">
                <div class="collapse navbar-collapse" id="navbarSupportedContent1">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item navbar-brand">
                            <a class="nav-link active text-light" aria-current="page" href="/HomeFurama">Home</a>
                        </li>
                        <li class="nav-item navbar-brand">
                            <a class="nav-link active text-light" aria-current="page" href="/CustomerFurama">Customer</a>
                        </li>
                        <li class="nav-item navbar-brand">
                            <a class="nav-link active text-light" aria-current="page" href="/EmployeeFurama">Employee</a>
                        </li>
                        <li class="nav-item navbar-brand">
                            <a class="nav-link active text-light" aria-current="page" href="/ServiceFurama">Service</a>
                        </li>
                        <li class="nav-item navbar-brand">
                            <a class="nav-link active text-light" aria-current="page" href="/view/contract/list.jsp">Contract</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="col-lg-3"></div>
</div>

<script src="common/popper.min.js"></script>
<script src="common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>

</html>

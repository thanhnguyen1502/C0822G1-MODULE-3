<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/1/2023
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <%--Link Phân Trang--%>
    <link rel="stylesheet" href="/common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Product Management</h1>
<form action="/Products?action=findByName" method="post"  class="d-flex">
    <input type="text" name="name" id="name" class="form-control me-2" placeholder="Search" aria-label="Search">
    <button class="btn btn-secondary" type="submit">Search</button>
</form>
<div>
    <table id="tableCustomer" class="table">
        <tr class="table-success">
            <th>No.</th>
            <th>Name</th>
            <th>Price</th>
            <th>Status</th>
            <th>Producer</th>
            <th></th>
            <th>
                <button onclick="location.href='/Products?action=create'" type="button" class="btn btn-warning">Add</button>
            </th>
        </tr>
        <c:forEach items="${productList}" var="product" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.status}</td>
                <td>${product.producer}</td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-success" onclick="location.href='/Products?action=update'">Edit</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you delete ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" onclick="location.href='Products?action=delete&id=${product.id}'" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2022
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <%@ include file="/include/backgroud.jsp" %>

</head>
<body>
<%@ include file="/include/header.jsp" %>
<div>
    <div class="row mt-5">
        <div class="col-lg-12 text-center">
            <h1 style="color: #13653f">Customer Management</h1>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-lg-12 d-flex justify-content-center align-items-center">
            <form action="/CustomerFurama?action=searchCustomer" method="post" class="d-flex">
                <input class="form-control me-2" type="search" name="keySearch" placeholder="nhập tên"
                       aria-label="Search">
                <input class="form-control me-2" type="search" name="keySearch" placeholder="nhập id"
                       aria-label="Search">
                <input class="form-control me-2" type="search" name="keySearch" placeholder="nhập address"
                       aria-label="Search">
                <button class="btn btn-success" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"
                         class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>

            </form>
        </div>
    </div>
    <table class="table" id="tableRent">
        <thead>
        <tr class="btn-light">
            <th>#</th>
            <th>Customer Type</th>
            <th>Name</th>
            <th>Birth</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Number Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th scope="col">
                <button onclick="location.href='/CustomerFurama?action=addNewCustomer'" type="button"
                        class="btn btn-success me-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                         class="bi bi-cloud-plus" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
                        <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
                    </svg>
                </button>
            </th>
        </tr>
        </thead>
        <c:forEach items="${customerList}" varStatus="status" var="customer">
        <tr class="btn-light">
            <td>${status.count}</td>
            <td>${customer.customerTypeId}</td>
            <td>${customer.name}</td>
            <td>${customer.birth}</td>
            <td>${customer.gender}</td>
            <td>${customer.idCard}</td>
            <td>${customer.numberPhone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <button type="button"
<%--                        onclick="location.href='/CustomerFurama?action=editCustomer&id=${customer.customerID}'"--%>
                        class="btn btn-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                         class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                    </svg>
                </button>
            </td>
            <td>
                <button type="button"
<%--                        onclick="deleteCustomer('${customer.name}', '${customer.customerID}')"--%>
                        class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                         class="bi bi-trash" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd"
                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                    </svg>
                </button>
            </td>
        </tr>
        </tr>
        </c:forEach>
    </table>
</div>

<%@ include file="/include/footer.jsp" %>
</body>
</html>

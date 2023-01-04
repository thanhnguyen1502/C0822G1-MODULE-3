<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/1/2023
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

</head>
<body>
<div>
    <table class="table table-dark table-hover">
        <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Address</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr class="table-light">
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                <td>
                    <a href="/UserServlet?action=edit&id=${user.id}">Edit</a>
                    <a href="/UserServlet?action=delete&id=${user.id}">Delete</a>
                </td>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

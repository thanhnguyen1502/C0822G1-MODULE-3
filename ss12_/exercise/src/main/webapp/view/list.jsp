<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/11/2022
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="text-center">User Manager</h1>
    <h2>
        <a href="/user?action=create">Add New User</a>
    </h2>

    <form action="/user?action=search" method="post">
        Enter country want to find <input type="text" name="country">
    </form>
</div>
<div class="container">
    <div class="table">
        <h2>List Of User</h2>
        <tr>
            <th>ID</th>
            <th>Name <button class="btn btn-light" onclick="location.href='/user?action=sortbyname';">^</button>
            <button class="btn btn-light" onclick="location.href='/user?action=user';">v</button></th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/> </td>
                <td><c:out value="${user.name}"/> </td>
                <td><c:out value="${user.email}"/> </td>
                <td><c:out value="${user.country}"/> </td>
                <td>
                    <a href="/user?action=edit&id=${user.id}" class="btn btn-info">Edit</a>
                    <button type="button" class="btn btn-danger" data-bs-toggle="model" data-bs-target="#idModal-${user.id}">Delete</button>
                    <div class="modal fade" id="idModal-${user.id}" tabindex="-1"
                         aria-labelledby="exampleModaLabel" area-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">CONFIRM</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure to delete: ${user.name}
                                </div>
                                <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <a href="/users?action=delete&id=${user.id}" class="btn btn-danger">
                                        Confirm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>

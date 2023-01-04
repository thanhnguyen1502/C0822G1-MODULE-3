<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/1/2023
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Management</h1>
<h2>
    <a href="UserServlet?action=users">List All Users</a>
</h2>
<div>
    <form method="post">
        <table>
            <caption>
                <h2 style="background-color: #0c4128">Add New User</h2>
            </caption>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" id="name">
                </td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                    <input type="text" name="email" id="email">
                </td>
            </tr>
            <tr>
                <th>Country: </th>
                <td>
                    <input type="text" name="country" id="country">
                </td>
            </tr>
            <tr>
                <input type="submit" value="save">
            </tr>
        </table>
    </form>
    <c:if test="${message != null}">
        <p>${message}</p>
    </c:if>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2022
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        th {
            background-color: blanchedalmond
        }
    </style>
</head>
<body><h1>danh sách khách hàng</h1>
<table style="border: black">
    <tr>
        <th colspan="10px">Tên</th>
        <th colspan="20px">Ngày sinh</th>
        <th colspan="20px">Địa chỉ</th>
        <th colspan="20px">Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td colspan="10px">${customer.getName()}</td>
            <td colspan="20px">${customer.getBirthday()}</td>
            <td colspan="20px">${customer.getAddress()}</td>
            <td colspan="20px"><img src="${customer.avatar}" alt="avatar" width="60px" height="60px"></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>

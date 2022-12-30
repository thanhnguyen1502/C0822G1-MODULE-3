<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/12/2022
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calculator</title>
</head>
<body>
<div>
    <form action="/calculator" method="get">
        <input type="number" name="firstOperand">
        <select name="operand">
            <option>+</option>
            <option>-</option>
            <option>*</option>
            <option>/</option>
        </select>
        <input type="number" name="secoundOperand">
        <button type="submit">Calculator</button>
    </form>
</div>
</body>
</html>

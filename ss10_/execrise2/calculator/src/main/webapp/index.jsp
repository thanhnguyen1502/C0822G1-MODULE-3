<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2022
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        #calculator{
            background: pink;
            border-radius: 5px;
            width: 35%;
            color: black;
            box-shadow: #484848 5px 5px;
            padding: 10px;
        }
        input,button,select{
            height: 50px;
            background: white;
            border-radius: 5px;
            border: none;
        }
        form{
            margin: 10px;
            width: 100%;
        }
    </style>
</head>
<body>
<div id="calculator">
    <h2>Simple Calculator</h2>
    <div>
        <form action="/calculator" method="get">
            <input type="number" name="firstOperand">
            <select name="operator">
                <option>+</option>
                <option>-</option>
                <option>*</option>
                <option>/</option>
            </select>
            <input type="number" name="secondOperand">
            <button type="submit">Calculate</button>
        </form>
        <h3>Result: ${result} </h3>
    </div>
</div>
</body>
</html>

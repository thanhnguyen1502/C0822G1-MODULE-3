<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/11/2022
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div>
    <form action="/discount" method="post">
      <p>Enter product description</p>
      <input type="text" name="description" placeholder="product description">
      <p>Enter list price</p>
      <input type="text" name="price" placeholder="list price">
      <p>Enter discount percent</p>
      <input type="text" name="percent" placeholder="discount percent">
      <button type="submit" style="display: block">calculate</button>
    </form>
    <h4>Discount amount: ${discountAmount}</h4>
    <h4>Discount price: ${discountPrice}</h4>
  </div>
  </body>
</html>

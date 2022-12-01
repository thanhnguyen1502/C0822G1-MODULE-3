<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2022
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calcutation</title>
    <link rel="stylesheet" href="common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class="row align-items-center " >
    <div class="col-4"></div>
    <div class="table" style="background-color: pink">
        <div>
            <h1 class="btn-info">Product Discription Culcatitor</h1>
            <form action="/discount" method="post">
                <p class="btn-primary">Enter product description</p>
                <input type="text" name="description" placeholder="product description">
                <p class="btn-danger">Enter list price</p>
                <input type="text" name="price" placeholder="list price">
                <p class="btn-info">Enter discount percent</p>
                <input type="text" name="percent" placeholder="discount percent">
                <br>
                <button type="submit" style="display: block" class="btn btn-outline-primary">calculate</button>
            </form>
            <h4>Discount amount: ${discountAmount}</h4>
            <h4>Discount price: ${discountPrice}</h4>
        </div>
    </div>
    <div class="col-4"></div>
</div>

</body>
</html>

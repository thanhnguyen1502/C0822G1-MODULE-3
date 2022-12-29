<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/12/2022
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="table table-dark table-hover">
    <div class="row">
        <div class="btn btn-dark position-relative">
            <h1>Product Discount Calculator</h1>
        </div>
    </div>
    <form action="/discount" method="post">
        <div class="row">
            <div class="col-4" style="background-color: white"></div>
            <div class="col-2"><p>Product Description:</p></div>
            <div class="col-2"><input type="text" name="description"></div>
        </div>
        <div class="row">
            <div class="col-4" style="background-color: white"></div>
            <div class="col-2"><p>List Price:</p></div>
            <div class="col-2"><input type="text" name="price"></div>
        </div>
        <div class="row">
            <div class="col-4" style="background-color: white"></div>
            <div class="col-2"><p>Discount Percent:</p></div>
            <div class="col-2"><input type="text" name="percent"></div>
        </div>
        <div class="row">
            <div class="col-4" style="background-color: white"></div>
            <div class="col-2"></div>
            <div class="col-2">
                <button type="submit">calculate</button>
            </div>
        </div>
    </form>
</div>

<div class="text-center">
    <h4>Discount Amount: ${discountAmount}</h4>
    <h4>Discount Price: ${discountPrice}</h4>
</div>


</body>
</html>

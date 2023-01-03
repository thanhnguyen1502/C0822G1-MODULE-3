<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/1/2023
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<a class="navbar-brand" href="/Products">Navbar</a>
<div class="container bg-light">
    <h1>Edit product</h1>
    <form method="post">
        <h5>Product information</h5>
        <div class="mb-3">
            <label for="name" class="form-label">Name: </label>
            <input type="text" name="name" id="name" value="${product.name}" class="form-control"
                   aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="producer" class="form-label">Producer: </label>
            <input type="text" name="producer" id="producer" value="${product.producer}" class="form-control"
                   aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price: </label>
            <input type="text" name="price" id="price" value="${product.price}" class="form-control"
                   aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status: </label>
            <input type="text" name="status" id="status" value="${product.status}" class="form-control"
                   aria-describedby="emailHelp">
        </div>
        <button type="submit" class="btn btn-primary" value="Create">Submit</button>
        <button onclick="location.href='/Products'" type="button" class="btn btn-primary" value="back">
            Back to product list
        </button>
    </form>
    <h2>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </h2>
</div>
<script src="common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>

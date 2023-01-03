<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/1/2023
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
  </head>
  <body>
  <div>
<ul>
  <li>
    <a href="/Products" class="btn btn-danger">Home</a>
  </li>
   <li>
    <a href="/Products?action=list">List</a>
  </li>
   <li>
    <a href="/Products?action=create">Add</a>
  </li>
   <li>
    <a href="/Products?action=edit">Edit</a>
  </li>

</ul>
  </div>
<%--  <ul>--%>
<%--  <li type="button" class="btn btn-success">List</li>--%>
<%--  <button type="button" class="btn btn-danger">Add</button>--%>
<%--  <button type="button" class="btn btn-warning">Create</button>--%>
<%--  <button type="button" class="btn btn-info">Home</button>--%>
<%--  </ul>--%>
  </body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/11/2022
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div style="position:relative ">
    <div>
        <video autoplay muted loop width="100%">
            <source src="https://assets.mixkit.co/videos/preview/mixkit-very-close-shot-of-the-leaves-of-a-tree-wet-18310-large.mp4"
                    type="video/mp4">
        </video>
    </div>
    <div style="width: 60%;position: absolute;left: 20%;right: 20%;top: 10%">
        <h3 class="text-light">Product List</h3>
        <table class="table text-light">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Producer</th>
                <th colspan="5">Description</th>
            </tr>
            <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.producer}</td>
                <td width="40%"><c:if test="${id == product.id}">
                    ${detail}
                </c:if></td>
                <td><a href="/product?action=detail&id=${product.id}">
                    <button type="button" class="btn btn-outline-light">Detail</button>
                </a></td>
                <td><a href="/product?action=edit&id=${product.id}">
                    <button type="button" class="btn btn-outline-light">Edit</button>
                </a></td>
                <td>
                    <button type="button"
                            onclick="callDeleteModal('${product.id}','${product.name}','${product.price}','${product.producer}')"
                            class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#delete-modal">
                        Delete
                    </button>
                </td>
                </c:forEach>
        </table>
        <form action="/product" method="get">
            <div>
                <div class="modal fade text-dark" id="delete-modal" tabindex="-1"
                     aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Delete product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <span id="product-id"></span>
                                <p id="product-name"></p>
                                <p id="product-price"></p>
                                <p id="product-producer"></p>
                                <h5>Are you sure that you want to delete this product ?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                </button>
                                <button type="submit" name="action" value="remove" class="btn btn-danger">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <a class="btn btn-outline-light" href="/" role="button">Back to product management page</a>
    </div>
</div>
<script>
    function callDeleteModal(id, name, price, producer) {
        console.log('kkkkkkkkkkkkkkkkkk')
        document.getElementById("product-id").innerHTML = '<input readonly type="text" name="id" value="' + id + '">';
        document.getElementById("product-name").innerText = name;
        document.getElementById("product-price").innerText = price;
        document.getElementById("product-producer").innerText = producer;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

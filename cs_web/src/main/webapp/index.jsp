<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/1/2023
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <%@ include file="include/backgroud.jsp" %>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="card bg-dark text-white">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img height="700px"
                                 src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg"
                                 class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img height="700px"
                                 src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard.jpg"
                                 class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img height="700px"
                                 src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/371614943.jpg?k=27e679e152cb3fe872840ec8052d75b8a0d97f6fb69ce482bb5e86093ed42623&o=&hp=1"
                                 class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>
                <div class="card-img-overlay">
                    <div class="row mt-5">
                        <div class="col-lg-6 mt-5 d-flex">
                            <div class="col-lg-6">
                                <img width="300" height="250" src="https://www.hoteljob.vn/uploads/images/18-01-17-09/Logo-FURAMA-RESORT.jpg" alt="">
                            </div>
                            <div class="col-lg-6">
                                <span style="font-size: 50px; font-family: 'Times New Roman'">Furama Resort</span>
                                <h5 style="font-family: 'Times New Roman'">A CULINARY RESORT ON ONE OF THE SIX MOST LUXURIOUS BEACHES IN THE WORLD</h5>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row mt-5">
                                <div class="col-lg-12 d-flex justify-content-end">
                                    <div class="btn-group dropstart w-25 h-100">
                                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                                <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                            </svg>
                                            <p class="mt-3">Support</p>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">0372864453</a></li>
                                            <li><a class="dropdown-item" href="#">Mr. Thanh</a></li>
                                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="include/footer.jsp" %>
<script src="common/popper.min.js"></script>
<script src="common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>

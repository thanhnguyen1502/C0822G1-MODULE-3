<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/11/2022
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>$Title$</title>
  <link rel="stylesheet" href="common/bootstrap-5.0.2-dist/css/bootstrap.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
              <img height="700px" src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img height="700px" src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img height="700px" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/371614943.jpg?k=27e679e152cb3fe872840ec8052d75b8a0d97f6fb69ce482bb5e86093ed42623&o=&hp=1" class="d-block w-100" alt="...">
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
              <div class="row mt-5">
                <div class="col-lg-12 d-flex justify-content-end">
                  <div class="btn-group dropstart w-25 h-100">
                    <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-image" viewBox="0 0 16 16">
                        <path d="M6.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
                        <path d="M14 14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5V14zM4 1a1 1 0 0 0-1 1v10l2.224-2.224a.5.5 0 0 1 .61-.075L8 11l2.157-3.02a.5.5 0 0 1 .76-.063L13 10V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4z"/>
                      </svg>
                      <p class="mt-3">Galleries</p>
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Another action</a></li>
                      <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-lg-12 d-flex justify-content-end">
                  <div class="btn-group dropstart w-25 h-100">
                    <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                        <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                        <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                      </svg>
                      <p class="mt-3">Excursions</p>
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Another action</a></li>
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

  <div class="row mt-5">
    <div class="col-lg-5">
      <iframe width="100%" height="315" src="https://www.youtube.com/embed/Pa8tN0u0Rr0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <div class="col-lg-7">
      <h5 class="text-warning" style="font-family: 'Times New Roman'">
        THIS WORLD CLASS RESORT, FURAMA DANANG, REPUTABLE FOR BEING A CULINARY RESORT IN VIETNAM
      </h5>
      <p>
        Overlooking the long stretch of wide white sand on Danang Beach, Furama Resort Danang is a gateway to three World Heritage
        Sites of Hoi An (20 minutes), My Son (90 minutes) and Hue (2 hours). The 198 rooms and suites plus 70 two to four bedroom pool
        villas feature tasteful décor, designed with traditional Vietnamese style and a touch of French colonial architecture and
        guarantee the Vietnam’s the most prestigious resort -counting royalty, presidents, movie stars and international business leaders
        among its celebrity guests.
      </p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12 mt-5 text-center bg-light">
      <div class="row">
        <div class="col-lg-12">
          <h1 style="font-family: 'Times New Roman'" class="text-warning">ROOMS & SUITES</h1>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-4"></div>
        <div class="col-4">
          <p class="fw-light">All 198 rooms & suites have polished timber floors,
            natural fabrics, comfortable cane furniture, plantation style shutters
            and ceiling fans. Each room also has its own balcony or spacious terrace
            providing complete privacy and with a superb view of the ocean, the tropical
            garden or the freshwater swimming lagoon pool.</p>
          <a href="#" class="fw-bold text-decoration-none text-success">
            VIEW ALL ROOMS
          </a>
        </div>
        <div class="col-4"></div>
      </div>
    </div>
  </div>

  <div class="row align-items-start mt-3">

    <div class="col">
      <div class="card">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/08/Vietnam_Danang_Furama_Villas_Beach_Pool_Villas-_Exterior-1-F-370x239.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Villa</h5>
          <p class="card-text">The villa has 4 bedrooms, two on each floor, all own a broad view of the ocean.
            Large private swimming pool by the grass garden on the beach where you can gather with friends and family
            members for a cocktail reception or a BBQ.</p>
          <a href="#" class="btn btn-success">View</a>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/08/Vietnam_Danang_Furama_Garden-Deluxe-twin-bed-F-370x239.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Houes</h5>
          <p class="card-text">You will like this deluxe and spacious room!
            The sitting area with an elegant sofa, coffee table, and comfortable
            armchair will help you relax. The large bathroom decorated with honey-colored marble
            offers a separate shower and bathtub.</p>
          <a href="#" class="btn btn-success">View</a>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card" >
        <img src="https://furamavietnam.com/wp-content/uploads/2018/03/Vietnam_Danang_Furama_Lagoon-Superior-twin-bed-F-370x239.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Rooms</h5>
          <p class="card-text">This charming room overlooks our beautiful tropical garden and the landscaped lagoon pool.
            Enjoy the view over palm trees, plants, and flowers in all kinds of shapes and colors.
            At night, the pool and garden are romantically illuminated.</p>
          <a href="#" class="btn btn-success">View</a>
        </div>
      </div>
    </div>
  </div>


  <div class="row mt-5">
    <div class="col-lg-12 text-center mt-5">
      <h2 class="text-warning" style="font-family: 'Times New Roman'">JOINING OUR CULINARY & RECREATIONAL EXPERIENCE</h2>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-3"></div>
    <div class="col-lg-12 text-center">
      <p>
        The Furama Resort aims to make your stay in Vietnam a unique and unforgettable experience.
        Whether you prefer to be active or just to relax, we offer a wide range of activities and services to suit your needs.
      </p>
    </div>
    <div class="col-lg-3"></div>
  </div>

  <div class="row mt-5">
    <div class="col-lg-6">
      <img width="600px" src="https://furamavietnam.com/wp-content/uploads/2018/07/CULIRARY.jpg" alt="">
    </div>
    <div class="col-lg-6">
      <div class="card mt-5">
        <div class="card-body">
          <h3 class="card-title text-warning" style="font-family: 'Times New Roman'">CULINARY</h3>
          <p class="card-text mt-5">The resort’s culinary experience features a mixture of the authentic and locally inspired
            Vietnamese, Asian, Italian and other European cuisines plus the best imported steaks. The resort presents
            guests with varied gastronomic venues – the hip and breezy bar overlooking the beach,
            the exclusive Lagoon pool surrounded by a tropical garden, the true Italian flare offered at the Don Cipriani’s,
            the refined Asian touch at Café Indochine or the authentic central Vietnam cuisine at the Danaksara.
          </p>
          <a href="#" class="btn btn-success">READ MORE</a>
        </div>
      </div>
    </div>
  </div>

  <div class="row mt-5">
    <div class="col-lg-6">
      <div class="card mt-5">
        <div class="card-body">
          <h3 class="card-title text-warning" style="font-family: 'Times New Roman'">MEETING & EVENT</h3>
          <p class="card-text mt-5">
            A well-appointed International Convention Palace with ballrooms can accommodate up to 1,000 people in style,
            with another ten function rooms for 50 to 300 people each. A variety of cultural-themed parties on the
            beach or around the lagoon, in the ballrooms or outside the resort, with the surprising arrivals of
            VIPs from Helicopter landing on the resort’s own Helipad…
          </p>
          <a href="#" class="btn btn-success">READ MORE</a>
        </div>
      </div>
    </div>
    <div class="col-lg-6">
      <img width="600px" src="https://furamavietnam.com/wp-content/uploads/2018/10/02.-ICP-ICP_Furama_Danang_-Ball-Room-4.jpg" alt="">
    </div>
  </div>

  <div class="row mt-5">
    <div class="col-lg-6">
      <img width="600px" src="https://furamavietnam.com/wp-content/uploads/2018/07/RECREATION.jpg" alt="">
    </div>
    <div class="col-lg-6">
      <div class="card mt-5">
        <div class="card-body">
          <h3 class="card-title text-warning" style="font-family: 'Times New Roman'">RECREATION</h3>
          <p class="card-text mt-5">
            A full range of Water Sports will keep you busy.
            Stop by the Water Sport House where our experienced staff are
            waiting to assist or train you in the use of any of our equipment.
          </p>
          <a href="#" class="btn btn-success">READ MORE</a>
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

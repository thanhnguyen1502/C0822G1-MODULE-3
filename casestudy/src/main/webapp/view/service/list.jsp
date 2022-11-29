<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <%@ include file="/include/backgroud.jsp" %>
</head>
<body>
<%@ include file="/include/header.jsp" %>

<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-lg-12 text-center">
            <h1>Contract List</h1>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-lg-12">
            <table class="table">
                <thead>
                <tr class="table-success">
                    <th scope="col">#</th>
                    <th scope="col">Service</th>
                    <th scope="col">Customer</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date</th>
                    <th scope="col">Deposit</th>
                    <th scope="col">Total Mony</th>
                    <th scope="col" colspan="2">Attach Service</th>
                </tr>
                </thead>
                <tbody>
                <tr class="btn-info">
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td></td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                <tr class="btn-info">
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td></td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@fat</td>
                    <td>@fat</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                <tr class="btn-info">
                    <th scope="row">3</th>
                    <td>Larry the Bird</td>
                    <td></td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                 <tr class="btn-info">
                    <th scope="row">3</th>
                    <td>Larry the Bird</td>
                    <td></td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                 <tr class="btn-info">
                    <th scope="row">3</th>
                    <td>Larry the Bird</td>
                    <td></td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                 <tr class="btn-info">
                    <th scope="row">3</th>
                    <td>Larry the Bird</td>
                    <td></td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>
                 <tr class="btn-info">
                    <th scope="row">3</th>
                    <td>Larry the Bird</td>
                    <td></td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>
                        <!-- Button Create Contract Detail modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#createModal">
                            +
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalDelete">
                            Attach Service List
                        </button>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal delete -->
<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Attach Service List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name of Attach Service</th>
                        <th scope="col">Unit</th>
                        <th scope="col">Price</th>
                        <th scope="col">Amount</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td>@twitter</td>
                        <td>@twitter</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Create -->
<div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelCreate">Contract Detail Form</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="startDate" class="form-label fw-bold">Start Date:</label>
                        <input type="date" class="form-control" id="startDate" aria-describedby="emailHelp">
                    </div>

                    <div class="mb-3">
                        <label for="endDate" class="form-label fw-bold">End Date:</label>
                        <input type="date" class="form-control" id="endDate" aria-describedby="emailHelp">
                    </div>

                    <div class="mb-3">
                        <label for="deposit" class="form-label fw-bold">Deposit:</label>
                        <input type="text" class="form-control" id="deposit" aria-describedby="emailHelp">
                    </div>

                    <div class="mb-3">
                        <label for="totalMoney" class="form-label fw-bold">Total Money:</label>
                        <input type="text" class="form-control" id="totalMoney" aria-describedby="emailHelp">
                    </div>

                    <div class="mb-3">
                        <label for="customer" class="form-label fw-bold">Customer:</label>
                        <select id="customer" class="form-select" aria-label="Default select example">
                            <option value="">select customer</option>
                            <option value="1">Nguyễn Văn A</option>
                            <option value="2">Nguyễn Văn B</option>
                            <option value="3">Nguyễn Văn C</option>
                            <option value="4">Nguyễn VĂn D</option>
                            <option value="4">Nguyễn Văn E</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="serviceType" class="form-label fw-bold">Customer Type:</label>
                        <select id="serviceType" class="form-select" aria-label="Default select example">
                            <option value="">select service</option>
                            <option value="1">Villa</option>
                            <option value="2">House</option>
                            <option value="3">Room</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="attachService" class="form-label fw-bold">Attach Service:</label>
                        <select id="attachService" class="form-select" aria-label="Default select example">
                            <option value="">select service</option>
                            <option value="1">Karaoke</option>
                            <option value="2">Xe Đạp</option>
                            <option value="3">Xe Máy</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/include/footer.jsp" %>
<script src="/common/popper.min.js"></script>
<script src="/common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>

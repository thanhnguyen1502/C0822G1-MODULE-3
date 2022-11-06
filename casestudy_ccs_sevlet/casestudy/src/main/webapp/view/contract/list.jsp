<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/11/2022
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body>
<%@include file="/view/include/header.jsp" %>
<div class="container">
    <button style="position: fixed;right: 0" type="button" class="btn btn-success mt-1" data-bs-toggle="modal"
            data-bs-target="#addContact" onclick="">
        THÊM MỚI HỢP ĐỒNG
    </button>
    <h2 CLASS="text-center">DANH SÁCH HỢP ĐỒNG</h2>
    <div class="row main mt-2 ">
        <table class="table table-striped">
            <tr>

                <th>STT</th>
                <th>Dịch vụ</th>
                <th>Khách hàng</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Tiền đặt cọc</th>
                <th>Tổng tiền</th>
                <th>Các dịch vụ đi kèm</th>

            </tr>
            <tr>
                <td>1</td>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td class="d-flex justify-content-center">

                    <button type="button" class="btn btn-primary me-3" data-bs-toggle="modal"
                            data-bs-target="#addContactDetail" onclick="">
                        +
                    </button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#attachFacility" onclick="showModalDeleteControl('a','b','c')">
                        Danh sách các dịch vụ miễn phí đi kèm
                    </button>
                </td>

            </tr>
        </table>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="addContact" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">TẠO HỢP ĐỒNG</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body container-fluid">

                <div class="container  mt-2 p-2 mb-2" style="border: 1px solid grey; border-radius: 15px">
                    <form class="row" action="" method="post">
                        <div class="col-md-12">
                            <label for="startday" class="form-label">Ngày bắt đầu </label>
                            <input type="date" class="form-control" id="startday" name="startday">
                        </div>
                        <div class="col-md-12">
                            <label for="endday" class="form-label">Ngày kết thúc </label>
                            <input type="date" class="form-control" id="endday" name="endday">
                        </div>

                        <div class="col-md-12">
                            <label for="deposit" class="form-label">Tiền đặt cọc</label>
                            <input type="number" class="form-control" id="deposit" name="deposit">
                        </div>
                        <div class="col-md-12">
                            <label for="total" class="form-label">Tổng tiền</label>
                            <input type="number" readonly class="form-control" id="total" name="total">
                        </div>

                        <div class="col-md-12">
                            <label class="form-label">Khách hàng</label>
                            <select name="customerName" class="form-select">
                                <option value="None">Chọn khách hàng</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>

                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Dịch vụ</label>
                            <select name="serviceName" class="form-select">
                                <option value="None">Chọn dịch vụ</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>

                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Dịch vụ đi kèm</label>
                            <button type="button" class="btn btn-primary mt-2 mb-2" data-bs-toggle="modal"
                                    data-bs-target="#" onclick="displayAttachFacility()">
                                +
                            </button>

                            <table class="table table-striped" id="tableFacilityContract" style="display: none;">
                                <tr>
                                    <th>Tên dịch vụ đi kèm</th>
                                    <th>Đơn vị</th>
                                    <th>Giá tiền</th>
                                    <th>Số lượng</th>
                                    <th>
                                        <button style="display: none" type="button" class="btn btn-danger"
                                                data-bs-toggle="modal" data-bs-target="#" id="buttonHide"
                                                onclick="hideAttachFacility()">
                                            x
                                        </button>
                                    </th>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Karaoke</td>
                                    <td>Giờ</td>
                                    <td>100000</td>
                                    <td><input style="width: 70px" type="number"></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Thuê xe máy</td>
                                    <td>Giờ</td>
                                    <td>100000</td>
                                    <td><input style="width: 70px" type="number"></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Thuê xe đạp</td>
                                    <td>Giờ</td>
                                    <td>100000</td>
                                    <td><input style="width: 70px" type="number"></td>
                                </tr>

                            </table>

                        </div>
                        <div class="col-12  mt-2 d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary me-3" data-bs-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-warning">Tạo hợp đồng</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="attachFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditLable">DANH SÁCH DỊCH VỤ MIỄN PHÍ ĐI KÈM</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body container-fluid">
                <table class="table table-striped">
                    <tr>
                        <th>Tên dịch vụ đi kèm</th>
                        <th>Đơn vị</th>
                        <th>Giá tiền</th>
                        <th>Số lượng</th>
                    </tr>
                    <tr>
                        <td>Karaoke</td>
                        <td>Giờ</td>
                        <td>100000</td>
                        <td>1</td>
                    </tr>

                </table>

            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="addContactDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">THÊM DỊCH VỤ ĐI KÈM</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="">
                    <table class="table table-striped">
                        <tr>
                            <th>Tên dịch vụ đi kèm</th>
                            <th>Đơn vị</th>
                            <th>Giá tiền</th>
                            <th>Số lượng</th>

                        </tr>
                        <tr>
                            <td><input type="checkbox"> Karaoke</td>
                            <td>Giờ</td>
                            <td>100000</td>
                            <td><input style="width: 70px" type="number"></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"> Thuê xe máy</td>
                            <td>Giờ</td>
                            <td>100000</td>
                            <td><input style="width: 70px" type="number"></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"> Thuê xe đạp</td>
                            <td>Giờ</td>
                            <td>100000</td>
                            <td><input style="width: 70px" type="number"></td>
                        </tr>

                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <button type="button" class="btn btn-primary">Thêm</button>
            </div>
        </div>
    </div>
</div>

<script>
    function displayAttachFacility() {
        document.getElementById("tableFacilityContract").style.display = 'block'
        document.getElementById("buttonHide").style.display = 'block'
    }
    function hideAttachFacility() {
        document.getElementById("tableFacilityContract").style.display = 'none'
        document.getElementById("buttonHide").style.display = 'none'
    }
</script>
<%@include file="/view/include/footer.jsp" %>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>

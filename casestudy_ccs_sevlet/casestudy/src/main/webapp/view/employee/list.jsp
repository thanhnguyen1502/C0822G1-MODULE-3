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
    <style>
        .main {
            background-image: url(https://furamavietnam.com/wp-content/uploads/2018/08/BG2.jpg) ;
            background-position: right bottom;
            background-size: contain;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<%@include file="/view/include/header.jsp"%>
<div class="container-fluid">
    <button style="position: fixed;right: 0" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addEmployeeModal" onclick="showModalAddControl('a','b','c')">
        Thêm mới nhân viên
    </button>
    <h2 CLASS="text-center">DANH SÁCH NHÂN VIÊN</h2>

    <div class="row main mt-2 ">
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Số CMND </th>
                <th>Số Điện Thoại</th>
                <th>Email </th>
                <th>Trình độ</th>
                <th>Bộ phận</th>
                <th>Vị trí</th>
                <th>Lương</th>
                <th>Hoạt động</th>

            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editEmployeeModal" onclick="showModalEditControl('a','b','c')">
                        Sửa
                    </button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteEmployeeModal" onclick="showModalDeleteControl('a','b','c')">
                        Xóa
                    </button>
                </td>

            </tr>
        </table>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="" method="">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">THÊM MỚI NHÂN VIÊN</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">

                    <div class="container  mt-4 p-2 mb-4" style="border: 1px solid grey; border-radius: 15px">
                        <form class="row g-3" action="" method="post">


                            <div class="col-md-12">
                                <label for="name" class="form-label">Họ tên</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="col-md-12">
                                <label for="birhtday" class="form-label">Ngày sinh </label>
                                <input type="date" class="form-control" id="birhtday" name="birhtday">
                            </div>
                            <div class="col-md-12">
                                <label for="id_card" class="form-label">Số CMND</label>
                                <input type="text" class="form-control" id="id_card"  name="id_card" >
                            </div>
                            <div class="col-md-12">
                                <label for="phone" class="form-label">Số Điện Thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone">
                            </div>
                            <div class="col-md-12 "  >
                                <label for="email" class="form-label">Email </label>
                                <input type="text" class="form-control" id="email" name="email">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Trình độ  </label>
                                <select name="education_degree_id"  class="form-select" >
                                    <option value="None" >Chọn loại trình độ</option>
                                    <option value="1" >Trung cấp</option>
                                    <option value="2" >Cao đẳng</option>
                                    <option value="3" >Đại học </option>
                                    <option value="4" >Sau đại học</option>

                                </select>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Bộ phận</label>
                                <select name="education_degree_id"  class="form-select" >
                                    <option value="None" >Chọn bộ phận làm việc</option>
                                    <option value="1" >Sale – Marketing</option>
                                    <option value="2" >Hành Chính</option>
                                    <option value="3" >Phục vụ </option>
                                    <option value="4" >Quản lý</option>

                                </select>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Vị trí </label>
                                <select name="position_id"  class="form-select" >
                                    <option value="None" >Chọn vị trí</option>
                                    <option value="1" >Lễ tân</option>
                                    <option value="2" >Phục vụ</option>
                                    <option value="3" >Chuyên viên </option>
                                    <option value="4" >Giám sát</option>
                                    <option value="4" >Quản lý</option>
                                    <option value="4" >Giám đốc</option>
                                </select>
                            </div>

                            <div class="col-md-12 "  >
                                <label for="salary" class="form-label">Lương </label>
                                <input type="text" class="form-control" id="salary" name="salary">
                            </div>
                            <div class="col-12  mt-2">
                                <button type="submit" class="btn btn-primary">Gửi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="" method="">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditLable">SỬA THÔNG TIN NHÂN VIÊN</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">

                    <div class="container  mt-4 p-2 mb-4" style="border: 1px solid grey; border-radius: 15px">
                        <form class="row g-3" action="" method="post">


                            <div class="col-md-12">
                                <label for="name" class="form-label">Họ tên</label>
                                <input type="text" class="form-control" id="nameEdit" name="name">
                            </div>
                            <div class="col-md-12">
                                <label for="birhtday" class="form-label">Ngày sinh </label>
                                <input type="date" class="form-control" id="birhtdayEdit" name="birhtday">
                            </div>

                            <div class="col-md-12">
                                <label for="id_card" class="form-label">Số CMND</label>
                                <input type="text" class="form-control" id="id_cardEdit"  name="id_card" >
                            </div>
                            <div class="col-md-12">
                                <label for="phone" class="form-label">Số Điện Thoại</label>
                                <input type="text" class="form-control" id="phoneEdit" name="phone">
                            </div>
                            <div class="col-md-12 " id="s1" >
                                <label for="email" class="form-label">Email </label>
                                <input type="text" class="form-control" id="emailEdit" name="email">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Trình độ  </label>
                                <select name="education_degree_id"  class="form-select" >
                                    <option value="None" >Chọn loại trình độ</option>
                                    <option value="1" >Trung cấp</option>
                                    <option value="2" >Cao đẳng</option>
                                    <option value="3" >Đại học </option>
                                    <option value="4" >Sau đại học</option>

                                </select>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Bộ phận</label>
                                <select name="education_degree_id"  class="form-select" >
                                    <option value="None" >Chọn bộ phận làm việc</option>
                                    <option value="1" >Sale – Marketing</option>
                                    <option value="2" >Hành Chính</option>
                                    <option value="3" >Phục vụ </option>
                                    <option value="4" >Quản lý</option>

                                </select>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Vị trí </label>
                                <select name="position_id"  class="form-select" >
                                    <option value="None" >Chọn vị trí</option>
                                    <option value="1" >Lễ tân</option>
                                    <option value="2" >Phục vụ</option>
                                    <option value="3" >Chuyên viên </option>
                                    <option value="4" >Giám sát</option>
                                    <option value="4" >Quản lý</option>
                                    <option value="4" >Giám đốc</option>
                                </select>
                            </div>

                            <div class="col-md-12 " id="s2" >
                                <label for="salary" class="form-label">Lương </label>
                                <input type="text" class="form-control" id="salaryEdit" name="salary">
                            </div>
                            <div class="col-12  mt-2">
                                <button type="submit" class="btn btn-primary">Gửi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="deleteEmployeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="" method="">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLable">XÁC NHẬN XÓA</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    <span> </span>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function showModalAddControl(a,b,c) {
    }
    function showModalAddControl(a,b,c) {
    }
    function showModalAddControl(a,b,c) {
    }
</script>


<%@include file="/view/include/footer.jsp"%>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>

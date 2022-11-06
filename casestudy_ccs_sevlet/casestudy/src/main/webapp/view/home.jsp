<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/11/2022
  Time: 12:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <div class="row main mt-2 ">
        <div class="row ">
            <div class="col-lg-12  d-flex justify-content-center" style="height: 700px">
                <img src="https://phulong.com/UploadFiles/image_contents/1200-x-700-furama-01-c46207.png">
            </div>
        </div>
        <div class="row mt-4 mb-4">
            <div class="col-lg-2"></div>
            <div class="col-lg-3 d-flex align-items-center">
                <p style="color: gray;font-weight: bolder">KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI,
                    FURAMA ĐÀ NẴNG, NỔI TIẾNG LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM.
                </p>
            </div>
            <div class="col-lg-2">
                <div class="card" style="width: 18rem;">
                    <img src="https://phulong.com/UploadFiles/Images/FURAMA%2020%20NAM.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">CÁC LOẠI PHÒNG
                            Khu nghỉ dưỡng có 196 phòng được thiết kế theo phong cách truyền thống Việt Nam kết hợp với phong cách Pháp, 2 tòa nhà 4 tầng có hướng nhìn ra biển, nhìn ra hồ bơi trong xanh và những khu vườn nhiệt đới xanh tươi mát.
                            Ngoài ra, khu nghỉ dưỡng Furama còn cung cấp các liệu pháp spa, phòng xông hơi ướt, phòng xông hơi khô, dịch vụ mát-xa cạnh hồ bơi, các dịch vụ thể thao dưới nước và các lớp tập yoga và Thái Cực Quyền trên bãi biển.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 d-flex align-items-center">
                <p style="color: goldenrod;font-weight: bolder">Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế
                    (2 tiếng. 196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam
                    và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia,
                    chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
                </p>
            </div>
            <div class="col-lg-2"></div>
        </div>

    </div>

    <div class="row footer ">
        <div class="col-lg-12 bg-success d-flex justify-content-center" style="height: 100px">
            <p class="mt-2 fw-bold text-white"> © 2018 Furama Resort Danang.</p>
        </div>
    </div>
</div>


<!--Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body container-fluid">
                <span id="edit_modal"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <span id="modal-custom-button"></span>
            </div>
        </div>
    </div>
</div>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>

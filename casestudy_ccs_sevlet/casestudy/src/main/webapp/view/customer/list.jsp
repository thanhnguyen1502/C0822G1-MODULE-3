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
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap5.min.css" />
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
    <%--    <c:if test="${message!=null}">--%>
    <%--        <p>${message}</p>--%>
    <%--    </c:if>--%>
    <input value="${message}" id="message" hidden>
    <h2 CLASS="text-center">DANH SÁCH KHÁCH HÀNG</h2>
    <div class="row main mt-2 ">
        <table class="table table-striped"  id="tableCustomer">
            <thead>
            <tr>
                <th>STT</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính  </th>
                <th>Số CMND </th>
                <th>Số Điện Thoại</th>
                <th>Email </th>
                <th>Loại khách</th>
                <th>Địa chỉ </th>
                <th>Hành động</th>
            </tr>
            </thead>
            <%--            Customer(String ID, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {--%>
            <tbody>
            <c:forEach var="customerList" items="${customerList}"  varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${customerList.name}</td>
                    <td>${customerList.dayOfBirth}</td>
                    <td>${customerList.gender}</td>
                    <td>${customerList.personalCode}</td>
                    <td>${customerList.phoneNumber}</td>
                    <td>${customerList.email}</td>

                    <c:forEach items="${guestTypeList}" var="guestTypeList">
                        <c:if test="${guestTypeList.guestTypeId==customerList.typeOfGuest}">
                            <td>${guestTypeList.guestTypeName} </td>
                        </c:if>
                    </c:forEach>


                    <td>${customerList.address}</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="/customer?action=displayEditCustomer&id=${customerList.pId}">
                            Sửa
                        </a>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showModalDelete('${customerList.pId}','${customerList.name}')">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer?action=deleteCustomer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    Bạn xác nhận muốn xóa khách hàng: <span id="delete_modal"></span>
                    <input type="hidden" id="sendId" name="personid">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>

                </div>
            </div>
        </form>
    </div>
</div>


<div class="modal fade" id="modalAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer?action=deleteCustomer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    <p id="modalAlertMes"></p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function showModalDelete(a,b) {
        document.getElementById("delete_modal").innerText=b;
        document.getElementById("sendId").value=a;
    }
</script>

<%@include file="/view/include/footer.jsp"%>

<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap5.min.js"></script>
<%--<script src="/bootstrap/js/bootstrap.min.js"></script>--%>

<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
    window.onload=function (){
        var message = document.getElementById("message").value;
        document.getElementById("modalAlertMes").innerText=message;
        if (message!="" && message!=null ){
            $(document).ready(function(){
                $('#modalAlert').modal("show")}
            )
        }
    }
</script>
</body>
</html>

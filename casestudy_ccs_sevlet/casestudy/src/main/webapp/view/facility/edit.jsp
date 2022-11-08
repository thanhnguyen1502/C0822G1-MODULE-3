<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/11/2022
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/common/bootstrap-5.0.2-dist/css/bootstrap.css">
    <%@ include file="/include/backgroud.jsp" %>
</head>
<body>
<%@ include file="/include/header.jsp" %>

<div class="row mt-5">

    <div class="col-lg-3"></div>

    <div style="background: #e9f2ef" class="col-lg-6 shadow-lg">
        <h1 class="text-center">Create Facility Form</h1>
        <form class="mt-5">
            <div class="mb-3" id="facilityType">
                <div class="form-check-inline">
                    <b>Choice Facility Type:</b>
                </div>

                <input type="text" hidden id="facilityTypeValue" value="${facility.facilityType}">

                <div class="form-check form-check-inline " onclick="displayForm(villa.value)">
                    <input class="form-check-input" type="radio" name="facility" id="villa" value="1">
                    <label class="form-check-label" for="villa">Villa</label>
                </div>
                <div class="form-check form-check-inline" onclick="displayForm(house.value)">
                    <input class="form-check-input" type="radio" name="facility" id="house" value="2">
                    <label class="form-check-label" for="house">House</label>
                </div>
                <div class="form-check form-check-inline" onclick="displayForm(room.value)">
                    <input class="form-check-input" type="radio" name="facility" id="room" value="3">
                    <label class="form-check-label" for="room">Room</label>
                </div>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label"><b>Name:</b></label>
                <input type="text" value="${facility.name}" class="form-control" id="name">
            </div>

            <div class="mb-3">
                <label for="area" class="form-label"><b>Area:</b></label>
                <input type="number" value="${facility.area}" class="form-control" id="area">
            </div>

            <div class="mb-3">
                <label for="cost" class="form-label"><b>Cost:</b></label>
                <input type="number" value="${facility.cost}" class="form-control" id="cost">
            </div>

            <div class="mb-3">
                <label for="maxPeople" class="form-label"><b>Max People:</b></label>
                <input type="number" value="${facility.maxPeople}" class="form-control" id="maxPeople">
            </div>

            <div class="mb-3">
                <label for="rentType" class="form-label"><b>Rent Type:</b></label>
                <select id="rentType" class="form-select" aria-label="Default select example">
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <c:if test="${facilityType.name == facility.facilityType}">
                            <option value="${facilityType.id}">${facilityType.name}</option>
                        </c:if>
                    </c:forEach>

                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </select>
            </div>

            <div class="mb-3" id="opt1" style="display: none">
                <label for="roomStandard" class="form-label"><b>Room Standard:</b></label>
                <select id="roomStandard" class="form-select" aria-label="Default select example">
                    <option selected>select room standard</option>
                    <option value="1">Vip</option>
                    <option value="2">Normal</option>
                </select>
            </div>
            <div class="mb-3" id="opt2" style="display: none">
                <label for="poolArea" class="form-label"><b>Pool Area:</b></label>
                <input type="number" value="0" class="form-control" id="poolArea">
            </div>
            <div class="mb-3" id="opt3" style="display: none">
                <label for="numberOfFloors" class="form-label"><b>Number Of Floors:</b></label>
                <input type="number" value="0" class="form-control" id="numberOfFloors">
            </div>
            <div class="mb-3" id="opt4" style="display: none">
                <label for="descriptionOtherConvenience" class="form-label"><b>Description Other Convenience:</b></label>
                <input type="number" class="form-control" id="descriptionOtherConvenience">
            </div>
            <div class="mb-3" id="opt5" style="display: none">
                <label for="freeServiceIncluded" class="form-label"><b>Free Service Included:</b></label>
                <input type="number" class="form-control" id="freeServiceIncluded">
            </div>

            <button type="submit" class="btn btn-primary mb-3">Submit</button>
        </form>
    </div>
    <div class="col-lg-3"></div>
</div>

<%@ include file="/include/footer.jsp" %>
<script>
    window.onload = getFacilityType();
    function getFacilityType(){
        let a = document.getElementById("facilityTypeValue").value
        console.log(a)
        switch (a){
            case "villa":
                document.getElementById("villa").checked
                break;
            case "house":
                document.getElementById("house").checked
                break;
            case "room":
                document.getElementById("room").checked
                break;
        }
    }
    function displayForm(value) {
        switch (value) {
            case "1":
                document.getElementById("opt1").style.display = "block";
                document.getElementById("opt2").style.display = "block";
                document.getElementById("opt3").style.display = "block";
                document.getElementById("opt4").style.display = "block";
                document.getElementById("opt5").style.display = "none";
                break;
            case "2":
                document.getElementById("opt1").style.display = "block";
                document.getElementById("opt2").style.display = "none";
                document.getElementById("opt3").style.display = "block";
                document.getElementById("opt4").style.display = "block";
                document.getElementById("opt5").style.display = "none";
                break;
            case "3":
                document.getElementById("opt1").style.display = "none";
                document.getElementById("opt2").style.display = "none";
                document.getElementById("opt3").style.display = "none";
                document.getElementById("opt4").style.display = "none";
                document.getElementById("opt5").style.display = "block";
                break;
        }
    }
</script>
<script src="/common/popper.min.js"></script>
<script src="/common/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
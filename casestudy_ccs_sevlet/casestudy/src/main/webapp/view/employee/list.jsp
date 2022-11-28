<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/11/2022
  Time: 11:31 PM
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

<div class="row mt-5">
    <div class="col-lg-3"></div>
    <div style="background: #e9f2ef" class="col-lg-6 shadow-lg">
        <h1 class="text-center">Create Facility Form</h1>

        <form action="/ServiceFurama?action=addNewFacility" method="post" class="mt-5">

            <div class="mb-3" id="facilityType">
                <div class="form-check-inline">
                    <b>Choice Facility Type:</b>
                </div>
                <c:if test="${message != null}">
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </symbol>
                        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                        </symbol>
                        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </symbol>
                    </svg>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                        <div>
                                ${message}
                        </div>
                    </div>
                </c:if>
                <div class="form-check form-check-inline " onclick="displayForm(villa.value)">
                    <input required class="form-check-input" type="radio" name="facilityType" id="villa" value="1">
                    <label class="form-check-label" for="villa">Villa</label>
                </div>
                <div class="form-check form-check-inline" onclick="displayForm(house.value)">
                    <input required class="form-check-input" type="radio" name="facilityType" id="house" value="2">
                    <label class="form-check-label" for="house">House</label>
                </div>
                <div class="form-check form-check-inline" onclick="displayForm(room.value)">
                    <input required class="form-check-input" type="radio" name="facilityType" id="room" value="3">
                    <label class="form-check-label" for="room">Room</label>
                </div>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label"><b>Name:</b></label>
                <input  type="text" name="name" id="name" class="form-control" >
            </div>

            <div class="mb-3">
                <label for="area" class="form-label"><b>Area:</b></label>
                <input  type="number" name="area" class="form-control" id="area">
            </div>

            <div class="mb-3">
                <label for="cost" class="form-label"><b>Cost:</b></label>
                <input  type="number" name="cost" class="form-control" id="cost">
            </div>

            <div class="mb-3">
                <label for="maxPeople" class="form-label"><b>Max People:</b></label>
                <input  type="number" name="people" class="form-control" id="maxPeople">
            </div>

            <div class="mb-3">
                <label for="rentType" class="form-label"><b>Rent Type:</b></label>
                <select id="rentType" name="rentType" class="form-select" aria-label="Default select example">
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </select>
            </div>

            <div class="mb-3" id="opt1" style="display: none">
                <label for="roomStandard" class="form-label"><b>Room Standard:</b></label>
                <select id="roomStandard" name="standard" class="form-select" aria-label="Default select example">
                    <option value="Normal">normal</option>
                    <option value="Vip">vip</option>
                </select>
            </div>
            <div class="mb-3" id="opt2" style="display: none">
                <label for="poolArea" class="form-label"><b>Pool Area:</b></label>
                <input  type="number" value="0" name="Pool" class="form-control" id="poolArea">
            </div>
            <div class="mb-3" id="opt3" style="display: none">
                <label for="numberOfFloors" class="form-label"><b>Number Of Floors:</b></label>
                <input  type="number" value="0" name="floors" class="form-control" id="numberOfFloors">
            </div>
            <div class="mb-3" id="opt4" style="display: none">
                <label for="descriptionOtherConvenience" class="form-label"><b>Description Other Convenience:</b></label>
                <input  type="text" name="convenience" class="form-control" id="descriptionOtherConvenience">
            </div>

            <div class="mb-3" id="opt5" style="display: none">
                <label for="freeServiceIncluded" class="form-label"><b>Free Service Included:</b></label>
                <input  type="text" name="free" class="form-control" id="freeServiceIncluded">
            </div>
            <div>
                <button type="submit" class="btn btn-primary mb-3">Add New</button>
            </div>


        </form>

    </div>
    <div class="col-lg-3"></div>
</div>

<%@ include file="/include/footer.jsp" %>
<script>
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
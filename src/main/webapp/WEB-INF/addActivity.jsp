<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.15.2/css/all.css">
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${not empty currentUser}">
	 	<jsp:include page="navLogged.jsp"/>
	 </c:if>
	 <c:if test="${empty currentUser}">
	 	<jsp:include page="navNotLogged.jsp"/>
	 </c:if>
 <div class="container bg-white">
 		<div class="row">
          <div class="col-md-4 trip-container">
           <div class="col-lg-10 col-xl-10 mx-auto">
            <h5 class=" ">Create an activity for trip <a href="/trip/${currentTrip.id}" class="main-color">${currentTrip.country}</a>:</h5>
			<form:form action="/trip/${trip_id}/activity" method="post" modelAttribute="newActivity">
	                <div class="form-group">
	                <label class="col-form-label">City:</label>
						<form:input path="city" class="form-control"/>
						<form:errors path="city" class="text-danger" />
					</div>
					<div class="form-group">
	                <label class="col-form-label">Place:</label>
						<form:input path="place" class="form-control"/>
						<form:errors path="place" class="text-danger" />
					</div>
					<div class="form-group">
	                <label class="col-form-label">Description:</label>
						<form:input path="description" class="form-control"/>
						<form:errors path="description" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">From:</label>
						<form:input type="date" path="start" class="form-control" />
						<form:errors path="start" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">To:</label>
						<form:input type="date" path="end" class="form-control" />
						<form:errors path="end" class="text-danger" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-block main-bg-color shadow-sm mt-5"  value="Add Activity"/>
					</div>
						<p>OR <a href="#" class="link-text muted-color">join</a> an already created trip!</p>
		   </form:form>
		   </div>
          </div>
           <div class="col-md-8 d-none d-md-flex bg-image-road"></div>
      </div>
   </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.15.2/css/all.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda&family=Kaushan+Script&display=swap" rel="stylesheet"> 
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
 <div class="container bg-white box-shadow mt-3">
 		<div class="row">
          <div class="col-md-6 activity-container">
	         <div class="col-lg-10 col-xl-10 mx-auto text-center mb-3">
	 			<h4>Create an activity for trip <a href="/trip/${currentTrip.id}" class="main-color hover-brown">${currentTrip.country}</a>:</h4>
	 			<p class="lead mb-0">From <span class="main-color"><fmt:formatDate value="${currentTrip.start}" pattern="E, dd MMM yyyy" /></span></p>
	 			<p class="lead">To <span class="main-color"><fmt:formatDate value="${currentTrip.end}" pattern="E, dd MMM yyyy" /></span></p>
	 		</div>
           <div class="col-lg-10 col-xl-10 mx-auto">
			<form:form action="/trip/${trip_id}/activity" method="post" modelAttribute="newActivity">
				<div class="row">
	                <div class="form-group col-6">
	                <label class="col-form-label">City:</label>
						<form:input path="city" class="form-control"/>
						<form:errors path="city" class="text-danger" />
					</div>
					<div class="form-group col-6">
	                <label class="col-form-label">Place:</label>
						<form:input path="place" class="form-control"/>
						<form:errors path="place" class="text-danger" />
					</div>
				</div>
					<div class="form-group">
	                <label class="col-form-label">Description:</label>
						<form:textarea path="description" class="form-control"/>
						<form:errors path="description" class="text-danger" />
					</div>
					<div class="row">
						<div class="form-group col-6">
							<label class="col-form-label">From:</label>
							<form:input type="date" path="start" class="form-control"/>
							<form:errors path="start" class="text-danger" />
						</div>
						<div class="form-group col-6">
							<label class="col-form-label">To:</label>
							<form:input type="date" path="end" class="form-control" />
							<form:errors path="end" class="text-danger" />
						</div>
					</div>
					<span class="text-danger">${errOverlap }</span>
					<div class="form-group">
						<input type="submit" class="btn btn-block main-bg-color shadow-sm mt-5"  value="Add Activity"/>
					</div>
						<p>Back to trip <a href="/trip/${trip_id}" class="link-text muted-color">${currentTrip.country}</a></p>
		   </form:form>
		   </div>
          </div>
           <div class="col-md-6 d-none d-md-flex bg-image-hike"></div>
      </div>
   </div>
</body>
</html>
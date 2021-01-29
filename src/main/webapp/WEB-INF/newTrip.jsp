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
 <div class="container bg-white box-shadow">
 		<div class="row">
          <div class="col-md-4 trip-container">
           <div class="col-lg-10 col-xl-10 mx-auto">
            <h2 class="text-center mb-4">CREATE TRIP</h2>
			<form:form action="/trips" method="post" modelAttribute="newTrip">
	                <div class="form-group">
	                <label class="col-form-label">Country:</label>
						<form:input path="country" class="form-control shadow-sm" list="countries"/>
						<form:errors path="country" class="text-danger" />
		                <datalist id="countries">
			    			<c:forEach items="${allTrips}" var="t">
			    				<option value="${t.country}" />
			    			</c:forEach>
			    		</datalist>
					</div>
					<div class="form-group">
						<label class="col-form-label">From:</label>
						<form:input type="date" path="start" class="form-control shadow-sm" />
						<form:errors path="start" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">To:</label>
						<form:input type="date" path="end" class="form-control shadow-sm" />
						<form:errors path="end" class="text-danger" />
						<span class="text-danger">${errOverlap }</span>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-block main-bg-color shadow-sm mt-5"  value="Add Trip"/>
					</div>
						<p>OR <a href="/trips" class="link-text muted-color">join</a> an already created trip!</p>
		   </form:form>
		   </div>
          </div>
           <div class="col-md-8 d-none d-md-flex bg-image-road"></div>
      </div>
   </div>
</body>
</html>
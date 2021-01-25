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
	<nav class="navbar navbar-expand-lg main-color px-5">
	  <a class="main-color navbar-brand mb-0 h1" href="/"><i class="fas fa-home"></i></a>
	  <c:if test="${not empty currentUser}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link main-color" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link main-color" href="/logout">Logout</a>
		      </li>
	      </ul>
      </c:if>
	</nav>
 <div class="container bg-white">
 		<div class="row">
          <div class="col-md-4 trip-container">
           <div class="col-lg-10 col-xl-10 mx-auto">
            <h5 class=" ">Create a new trip:</h5>
			<form:form action="/trips" method="post" modelAttribute="newTrip">
	                <div class="form-group">
	                <label class="col-form-label">Country:</label>
						<form:input path="country" class="form-control" list="countries"/>
						<form:errors path="country" class="text-danger" />
		                <datalist id="countries">
			    			<c:forEach items="${allTrips}" var="t">
			    				<option value="${t.country}" />
			    			</c:forEach>
			    		</datalist>
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
						<input type="submit" class="btn btn-block main-bg-color shadow-sm mt-5"  value="Add Trip"/>
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
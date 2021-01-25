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
 <div class="container bg-white py-4">
 		<div class="row">
          <div class="col-md-4 avatar">
               <img src="https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1093&q=80" alt="Avatar"/>
             <p class="text-center mb-1 mt-3">${currentUser.tagLine}</p>
             <p class="aboutme">${currentUser.description}</p>
          </div>
          <div class="col-md-8">
              <div class="dashboard-header mb-3">
               <h5>${ currentUser.username }</h5>
               <h6>${ currentUser.firstName } ${ currentUser.lastName }</h6>
              </div>
            <h5>Update:</h5>
			<form:form action="/dashboard/${currentUser.id}/edit" method="post" modelAttribute="currentUser">
				<div class="row">
	                <div class="form-group col-6">
						<label class="col-form-label">First Name:</label>
						<form:input path="firstName" class="form-control" />
						<form:errors path="firstName" class="text-danger" />
					</div>
					<div class="form-group col-6">
						<label class="col-form-label">Last Name:</label>
						<form:input path="lastName" class="form-control" />
						<form:errors path="lastName" class="text-danger" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-6">
						<label class="col-form-label">Birthday:</label>
						<form:input type="date" path="birthday" class="form-control" />
						<form:errors path="birthday" class="text-danger" />
					</div>
					<div class="form-group col-6">
						<label class="col-form-label">Avatar:</label>
						<form:input type="file" path="profileImg" class="form-control"/>
						<form:errors path="profileImg" class="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-form-label">Tagline:</label>
					<form:input path="tagLine" class="form-control" />
					<form:errors path="tagLine" class="text-danger" />
				</div>
				<div class="form-group">
					<label class="col-form-label">About Me:</label>
					<form:textarea path="description" class="form-control" />
					<form:errors path="description" class="text-danger" />
				</div>
				<input type="submit" class="btn main-bg-color float-right"  value="Edit Profile"/>
		   </form:form>
          </div>
      </div>
   </div>
</body>
</html>
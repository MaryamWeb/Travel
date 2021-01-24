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
	  <span class="navbar-brand mb-0 h1"><i class="fas fa-home"></i></span>
	  <c:if test="${not empty user}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link main-color" href="/ideas">${user.name}</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link main-color" href="/logout">Logout</a>
		      </li>
	      </ul>
      </c:if>
	</nav>
	<div class="container mt-5">
		<div class="row d-flex justify-content-between">
			<div class="col-6">
				<form:form action="/register" method="post" modelAttribute="newUser">
					<h3 class="main-color text-center">Register</h3>
					<div class="form-group">
						<label class="col-form-label">First Name:</label>
						<form:input path="firstName" class="form-control" />
						<form:errors path="firstName" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">Username:</label>
						<form:input path="username" class="form-control" />
						<form:errors path="username" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">Password:</label>
						<form:password path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<div class="form-group">
						<label class="col-form-label">Confirm:</label>
						<form:password path="confirm" class="form-control" />
						<form:errors path="confirm" class="text-danger" />
					</div>
					<input type='submit' value='Register'
						class="btn main-bg-color btn-block text-white mt-4">
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
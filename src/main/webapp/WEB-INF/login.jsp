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
	<div class="container bg-white mt-5">
	    <div class="row no-gutter">
	       <div class="col-md-8 d-none d-md-flex bg-image"></div>
	       <div class="login-right-container col-md-4 d-flex align-items-center">
	            <div class="col-lg-8 col-xl-8 mx-auto">
	                <h3 class="display-4 text-center">LOGIN</h3> <br>
	                <form:form action="/login" method="post" modelAttribute="newLogin">
	                    <div class="form-group mb-4"> 
	                    	<form:input path="username" placeholder="Username" class="form-control input-field shadow-sm px-4"/> 
	                    	<form:errors path="username" class="text-danger" />
	                    </div>
	                    <div class="form-group mb-4"> 
	                    	<form:password path="password" placeholder="Password" class="form-control input-field shadow-sm px-4"/>  
	                    	<form:errors path="password" class="text-danger" />
	                    </div>
	                    <input type='submit' value='Login' class="btn btn-block main-bg-color mb-3 input-field shadow-sm"/> 
	                    <p>OR <a href="/register" class="link-text muted-color">Create An Account</a></p>
	                </form:form>
	            </div>
	       </div>
	    </div>
	</div> 
</body>
</html>
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
	<div class="container bg-white mt-5">
	    <div class="row no-gutter">
	       <div class="col-md-8 d-none d-md-flex bg-image"></div>
	       <div class="register-right-container col-md-4 d-flex align-items-center">
	            <div class="col-lg-8 col-xl-8 mx-auto">
	                <h3 class="display-4 text-center">REGISTER</h3> <br>
	               <form:form action="/register" method="post" modelAttribute="newUser">
	                    <div class="form-group mb-4"> 
	                    	<form:input path="firstName" placeholder="First Name" class="form-control input-field shadow-sm px-4"/> 
	                    	<form:errors path="firstName" class="text-danger" />
	                    </div>
	                    <div class="form-group mb-4"> 
	                    	<form:input path="username" placeholder="Username" class="form-control input-field shadow-sm px-4"/> 
	                    	<form:errors path="username" class="text-danger" />
	                    </div>
	                    <div class="form-group mb-4"> 
	                    	<form:password path="password" placeholder="Password" class="form-control input-field shadow-sm px-4"/>  
	                    	<form:errors path="password" class="text-danger" />
	                    </div>
	                    <div class="form-group mb-4"> 
	                    	<form:password path="confirm" placeholder="Password" class="form-control input-field shadow-sm px-4"/>  
	                    	<form:errors path="confirm" class="text-danger"/>
	                    </div>
	                    <input type='submit' value='Register' class="btn btn-block main-bg-color mb-3 input-field shadow-sm"/> 
	                    <p>Already have an account? <a href="/login" class="link-text muted-color">Login</a></p>
	                </form:form>
	            </div>
	       </div>
	    </div>
	</div> 

</body>
</html>
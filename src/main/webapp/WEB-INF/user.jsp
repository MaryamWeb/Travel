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
			  	<a class="nav-link main-color" href="/ideas">${user.username}</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link main-color" href="/logout">Logout</a>
		      </li>
	      </ul>
      </c:if>
	</nav>
 <div class="container emp-profile bg-white pt-4">
      <div class="row">
          <div class="col-md-4 avatar">
               <img src="https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1093&q=80" alt="Avatar"/>
          </div>
          <div class="col-md-8">
              <input type="submit" class="btn main-bg-color float-right"  value="Edit Profile"/>
              <div class="dashboard-header">
               <h5>Username</h5>
               <h6>firstName lastName</h5>
               <p class="mt-3">Trips : <span>3</span></p>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-4 mt-3">
          	<p class="text-center mb-1">Lorem ipsum dolor sit amet</p>
              <p class="aboutme">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
          </div>
          <div class="col-md-8">
			<p>CONTENT</p>
          </div>
      </div>
  </div>
</body>
</html>
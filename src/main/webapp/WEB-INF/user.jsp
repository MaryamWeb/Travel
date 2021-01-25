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
          	  <p class="text-center mb-1 mt-3">${theUser.tagLine}</p>
              <p class="aboutme">${theUser.description}</p>
          </div>
          <div class="col-md-8">
	          <c:if test="${currentUser.id == theUser.id}">
				<a href="/dashboard/user/edit" class="btn main-bg-color float-right">Edit Profile</a> 
			 </c:if>
              <div class="dashboard-header">
	               <h5>${theUser.username}</h5>
	               <h6>${theUser.firstName} ${theUser.lastName}</h6>
	               <p class="mt-3">Trips : <span>..</span></p>
              </div>
			<div class="border-bottom pb-4 mt-3">
				<h6>Upcoming trips:</h6>
				<div class="row">
				  <div class="col-sm-4">
				    <div class="card user-trip-card">
				      <div class="card-body p-2">
				        <h5 class="card-title main-color">Spain</h5>
				        <p class="card-text m-0"><span class="muted-color">Jan 12</span> - <span class="muted-color">Jan 30</span></p>
				        <small class="muted-color">in 9 days</small> 
				        <a href="#" class="link-text second-color float-right">Details</a>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<div class="pt-4">
				<h6>Past trips:</h6>
				<div class="row">
				  <div class="col-sm-4">
				    <div class="card user-trip-card">
				      <div class="card-body p-2">
				        <h5 class="card-title main-color">Spain</h5>
				        <p class="card-text m-0"><span class="muted-color">Jan 12</span> - <span class="muted-color">Jan 30</span></p>
				        <a href="#" class="link-text second-color float-right">Details</a>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
      </div>
 </div>
</div>
</body>
</html>
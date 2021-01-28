<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda&family=Kaushan+Script&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg font-cursive fixed-top home-nav mt-2px-5">     
	  <a class="wh-color hover-brown navbar-brand mb-0 h1" href="/"><i class="fas fa-home"></i></a>
	  <c:if test="${not empty currentUser}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link wh-color hover-brown" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link wh-color hover-brown" href="/logout">Logout</a>
		      </li>
	      </ul>
	   </c:if>
	   <c:if test="${empty currentUser}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link wh-color hover-brown" href="/register">Signup</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link wh-color hover-brown" href="/login">Login</a>
		      </li>
	      </ul>
	     </c:if>
	</nav> 
	<div>
	<div class="overlay"></div>
    <section class="img-banner d-flex align-items-center justify-content-center">
      <h1 class="display-3 font-cursive text-white">Trips</h1> 
    </section>
	</div>
	
    <div class="container mt-5">
      <div class="row">
        <div class="col-md-8">
          <c:forEach items="${allTrips}" var="t">
	          <div class="card mb-4 box-shadow">
	            <div class="card-body">
	              <h4 class="card-title text-center pb-2 main-color">${t.country}</h4>
	              <ul class="card-text list-no-bullets">
		              <li>Trip starts on  <span class="main-color"><fmt:formatDate value="${t.start}" pattern="E, dd MMM yyyy" /></span></li>
		              <li>Ends on <span class="main-color"><fmt:formatDate value="${t.end}" pattern="E, dd MMM yyyy" /></span></li>
		              <li>People joined the trip: <span class="main-color">${t.users.size()}</span></li>
		              <li>Days till trip starts:<span class="main-color">..</span></li>
	              </ul>
	            </div>
	            <div class="card-footer text-muted">
	               Trip created on ${t.createdAt } 
	               <a href="/trip/${t.id}" class="main-color float-right ml-2 hover-brown">More Information <i class="fas fa-arrow-right"></i></a>
	            </div>
	          </div>
			</c:forEach>
        </div>
 
 
        <div class="col-md-4">
	  	    <form action="/search" method="post" class="my-3">
		  	    <div class="input-group mb-2 box-shadow">
		           <input type="text" class="form-control" placeholder="Search by country" name="q">
		           <span class="input-group-btn">
		             <button type="submit" class="btn main-bg-color btn-search">
					    <i class="fas fa-search text-white"></i>
					</button>
		           </span>
		         </div>
		         <a href="/trips" class="main-color hover-brown">Get all trips</a>
	        </form>
  		</div>
 	</div>
    </div>
</html>
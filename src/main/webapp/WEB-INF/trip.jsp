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
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top px-5">
	  <a class="text-white navbar-brand mb-0 h1" href="/"><i class="fas fa-home"></i></a>
	  <c:if test="${not empty currentUser}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link text-white" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link text-white" href="/logout">Logout</a>
		      </li>
	      </ul>
	     </c:if>
	</nav> 
    <section class="img-banner d-flex align-items-center justify-content-center">
      <h1>${currentTrip.country }</h1> 
    </section>
    <div class="container mt-5">
      <div class="row">
        <div class="col-md-8">
           
        </div>
 
 
        <div class="col-md-4">
	  	    <form action="/search" method="post" class="my-3">
		  	    <div class="input-group mb-2">
		           <input type="text" class="form-control" placeholder="Search by country" name="q">
		           <span class="input-group-btn">
		             <input type="submit" value="Search" class="btn main-bg-color btn-search"/> 
		           </span>
		         </div>
		         <a href="/trips" class="main-color">Get all trips</a>
	        </form>
  		</div>
 	</div>
    </div>
</html>
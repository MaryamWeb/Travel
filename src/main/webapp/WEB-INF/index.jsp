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
	<nav class="navbar navbar-expand-lg fixed-top home-nav">
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
      <c:if test="${empty currentUser}">
		   <ul class="navbar-nav  ml-auto">
			  <li class="nav-item">
			  	<a class="nav-link text-white" href="/signup">Signup</a>
			  </li>
		      <li class="nav-item">
		        <a class="nav-link text-white" href="/login">Login</a>
		      </li>
	      </ul>
      </c:if>
	</nav>
	
<header>
  <div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
     <source src="https://storage.coverr.co/videos/gTxafiqZVVZKJtToYDfla15agQPbhTw4?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjExNjQ0NzU5fQ.pyDJa24GBfOx_klbxM8scEEU-Q8O8WX0iOj7UvShdIw">
  </video>
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100 text-white">
        <h3 class="display-3">Welcome to trip planner</h3>
        <p class="lead mb-0">Search for a trip by country</p>
  	    <form action="/search" class="my-3">
	  	    <div class="input-group  col-4 mx-auto ">
	           <input type="text" class="form-control" placeholder="Search" name="q">
	           <span class="input-group-btn">
	             <input type="submit" value="Search" class="btn main-bg-color btn-search"/> 
	           </span>
	         </div>
        </form>
      </div>
    </div>
  </div>
</header>
</body>
</html>
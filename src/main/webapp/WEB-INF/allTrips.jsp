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
      <h1>All Trips</h1> 
    </section>
    <div class="container mt-5">
      <div class="row">
        <div class="col-md-8">
          <c:forEach items="${allTrips}" var="t">
	          <div class="card mb-4">
	            <div class="card-body">
	              <h5 class="card-title text-center main-color pb-2">${t.country}</h5>
	              <ul class="card-text list-no-bullets">
		              <li>Trip starts on  <span class="main-color"><fmt:formatDate value="${t.start}" pattern="E, dd MMM yyyy" /></span></li>
		              <li>Ends on <span class="main-color"><fmt:formatDate value="${t.end}" pattern="E, dd MMM yyyy" /></span></li>
		              <li>People joined the trip: <span class="main-color">${t.users.size()}</span></li>
		              <li>Activities in the trip:<span class="main-color"> ... </span></li> 
		              <li>Days till trip starts:<span class="main-color">..</span></li>
	              </ul>
	            </div>
	            <div class="card-footer text-muted">
	               Trip created on ${t.createdAt } 
	               <a href="#" class="main-color float-right ml-2">More</a> 
						<c:if test="${!t.isOnTrip(currentUser.id)}">
							<a href="/trip/${t.id}/join" class="main-color float-right">Join Trip</a>
						</c:if>
						<c:if test="${t.isOnTrip(currentUser.id)}">
							<a href="/trip/${t.id}/unjoin" class="main-color float-right">UnJoin</a>
						</c:if>
	            </div>
	          </div>
			</c:forEach>
        </div>
 
 
        <div class="col-md-4">
          <div class="card  ">
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search by country">
                <span class="input-group-btn">
                  <button class="btn btn main-bg-color" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>
  		</div>
 	</div>
    </div>
</html>
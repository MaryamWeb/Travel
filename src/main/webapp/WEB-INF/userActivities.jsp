<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>
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
	               <p class="mt-3">Activites : <span>..</span></p>
              </div>
			<div class="border-bottom pb-4 mt-3">
			<h6 class="text-center mb-3">joined activities for trip <a href="/trip/${currentTrip.id}" class="main-color">${currentTrip.country }</a>:</h6>
				<c:forEach items="${activities}" var="a">
				<c:if test="${a.isOnActivity(theUser.id)}">
					 <div class="border-bottom mt-3">
						 <div class="row">
						 	<p class="col-6 main-color">City:<span class="muted-color"> ${a.city}</span></p>
		                    <p class="col-6 main-color">Place:<span class="muted-color"> ${a.place}</span></p>
						 </div>
						 <div class="row">
						 	<p class="col-6 main-color">Start:<span class="muted-color"> ${a.start}</span></p>
	                      	<p class="col-6 main-color">End:<span class="muted-color"> ${a.end}</span></p>
						 </div>
	                      <p class="main-color">Description:<span class="muted-color"> ${a.description}</span></p>
	                  </div>
	            </c:if>
				</c:forEach>
		  </div>
      </div>
 </div>
</div>
</body>
</html>
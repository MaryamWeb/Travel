<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="./common/header.jsp"/>
<nav class="navbar navbar-expand-lg font-cursive fixed-top home-nav mt-2px-5">     
	  <a class="wh-color hover-brown navbar-brand mb-0 h1" href="/"><i class="fas fa-home"></i></a>
	   <ul class="navbar-nav  ml-auto">
		  <li class="nav-item">
		  	<a class="nav-link wh-color hover-brown" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
		  </li>
	      <li class="nav-item">
	        <a class="nav-link wh-color hover-brown" href="/logout">Logout</a>
	      </li>
      </ul>
	</nav> 
    <div>
	<div class="overlay"></div>
    <section class="img-banner d-flex align-items-center justify-content-center">
      <h1 class="display-3 font-cursive text-white">${currentTrip.country}</h1> 
    </section>
	</div>
    <div class="container acticvity-container mt-5">
      <div class="row mb-4">
		<div class="col-md-8">
		<ul class="card-text list-no-bullets">
			<c:if test="${!currentTrip.isOnTrip(currentUser.id)}">
				<li>Click <a href="/trip/${currentTrip.id}/join" class="main-color hover-brown" data-toggle="modal" data-target="#joinTrip">here</a> if you want to join the trip!!</li>
			</c:if>
			<c:if test="${currentTrip.isOnTrip(currentUser.id)}">
				<li>Click <a href="/trip/${currentTrip.id}/unjoin" class="main-color hover-brown" data-toggle="modal" data-target="#leaveTrip">here</a> if you want to unjoin the trip!!</li>
			</c:if>
             <li>Trip starts on  <span class="main-color"><fmt:formatDate value="${currentTrip.start}" pattern="E, dd MMM yyyy" /></span></li>
             <li>Ends on <span class="main-color"><fmt:formatDate value="${currentTrip.end}" pattern="E, dd MMM yyyy" /></span></li>
             <li>People joined the trip: <span class="main-color">${currentTrip.users.size()}</span></li>
             <li>Activities on the trip:<span class="main-color"> ${activities.size()} </span></li> 
             <li>Days till trip starts:<span class="main-color">..</span></li>
            </ul>
		</div>
        <jsp:include page="./includes/searchField.jsp"/>
 	</div>
 	<jsp:include page="./common/modals.jsp"/>
 	 <div>
        <h5>Activities on trip to ${currentTrip.country }:</h5>
           <table class="table text-center table-bordered box-shadow">
		       <thead class="main-bg-color"> 
		          <tr>
		            <th>City</th>
		            <th>Place</th>
		            <th>Start at</th>
		            <th>End at</th>
		            <th>Description</th>
		            <th>Joined</th>
		            <th>#people joined</th>
		        </tr>
		    </thead>
			    <tbody>
			        <c:forEach items="${activities}" var="a">
					<tr>
						<td>${ a.city }</td>
						<td>${ a.place }</td>
						<td><fmt:formatDate type="date" value="${ a.start }" /></td>
						<td><fmt:formatDate type="date" value="${ a.end }" /></td>
						 <c:choose>
						   <c:when test="${fn:length(a.description) >= 50}"><td class="hover-show2">${fn:substring(a.description, 0, 30)}...<div class="show2">${a.description }</div></td></c:when>
						   <c:otherwise><td>${a.description}</td></c:otherwise>    
						</c:choose>
						<c:choose>
						   <c:when test="${!currentTrip.isOnTrip(currentUser.id)}"><td>...</td></c:when>
						   <c:when test="${a.isOnActivity(currentUser.id)}"><td><a class="main-color hover-brown" href="/trip/${currentTrip.id}/activity/${a.id}/unjoin">Unjoin</a></td></c:when>
						    <c:when test="${!a.isOnActivity(currentUser.id)}"><td><a class="main-color hover-brown" href="/trip/${currentTrip.id}/activity/${a.id}/join">join</a></td></c:when>  
						   <c:otherwise><td>...</td></c:otherwise>    
						</c:choose>
						<td>${a.users.size()}</td>
					<tr>
					</c:forEach>
			    </tbody>
			</table>
			 <p>Did not find the activity you were looking for? You can <a href="/trip/${currentTrip.id}/activity" class="main-color hover-brown">create it</a></p>
        </div>
    </div>
</html>
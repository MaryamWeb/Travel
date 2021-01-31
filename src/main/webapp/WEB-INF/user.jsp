<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>

<jsp:include page="./common/header.jsp"/>
	<c:if test="${not empty currentUser}">
	 	<jsp:include page="navLogged.jsp"/>
	 </c:if>
 <div class="container bg-white py-4 mt-3 box-shadow">
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
	               <h5 class="main-color">${theUser.username}</h5>
	               <h6>${theUser.firstName} ${theUser.lastName}</h6>
              </div>
			<div class="border-bottom pb-4 mt-3">
				<h6>Upcoming trips:</h6>
				<div class="row">
				<c:forEach items="${allTrips}" var="t">
				<c:if test="${t.start gt now}">
					<c:if test="${t.isOnTrip(theUser.id)}">
			          <div class="col-sm-4">
					    <div class="card user-trip-card">
					      <div class="card-body p-2">
					        <h5 class="card-title main-color">${t.country}</h5>
					        <p class="card-text m-0">
					        <p class="muted-color my-0">From: <fmt:formatDate value="${t.start}" pattern="MM/dd/yyyy" /></p>
					        <p class="muted-color">To: <fmt:formatDate value="${t.end}" pattern="MM/dd/yyyy" /></p>
					        <small class="muted-color">in ... days</small> 
					        <a href="/dashboard/${theUser.id}/${t.id}" class="link-text second-color float-right">Details</a>
					      </div>
					    </div>
					  </div>
		          </c:if>
		          </c:if>
				</c:forEach>
			   </div>
		  </div>
			<div class="pt-4">
				<h6>Past trips:</h6>
				<div class="row">
				   <c:forEach items="${allTrips}" var="t">
				<c:if test="${t.start lt now}">
					<c:if test="${t.isOnTrip(theUser.id)}">
			          <div class="col-sm-4">
					    <div class="card user-trip-card">
					      <div class="card-body p-2">
					        <h5 class="card-title main-color">${t.country}</h5>
					        <p class="card-text m-0">
					        <p class="muted-color my-0">From: <fmt:formatDate value="${t.start}" pattern="MM/dd/yyyy" /></p>
					        <p class="muted-color">To: <fmt:formatDate value="${t.end}" pattern="MM/dd/yyyy" /></p>
					        <small class="muted-color">in ... days</small> 
					        <a href="#" class="link-text second-color float-right">Details</a>
					      </div>
					    </div>
					  </div>
		          </c:if>
		          </c:if>
				</c:forEach>
				</div>
			</div>
      </div>
 </div>
</div>
</body>
</html>
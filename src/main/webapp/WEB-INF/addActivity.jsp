<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./common/header.jsp"/>
	<c:if test="${not empty currentUser}">
	 	<jsp:include page="navLogged.jsp"/>
	 </c:if>
	 <c:if test="${empty currentUser}">
	 	<jsp:include page="navNotLogged.jsp"/>
	 </c:if>
 <div class="container bg-white box-shadow mt-3">
 		<div class="row">
 		${serverTime }
          <div class="col-md-6 activity-container">
	         <div class="col-lg-10 col-xl-10 mx-auto text-center mb-3">
	 			<h4>Create an activity for trip <a href="/trip/${currentTrip.id}" class="main-color hover-brown">${currentTrip.country}</a>:</h4>
	 			<p class="lead mb-0">From <span class="main-color"><fmt:formatDate value="${currentTrip.start}" pattern="E, dd MMM yyyy" /></span></p>
	 			<p class="lead">To <span class="main-color"><fmt:formatDate value="${currentTrip.end}" pattern="E, dd MMM yyyy" /></span></p>
	 		</div>
           <div class="col-lg-10 col-xl-10 mx-auto">
			<form:form action="/trip/${trip_id}/activity" method="post" modelAttribute="newActivity">
				<div class="row">
	                <div class="form-group col-6">
	                <label class="col-form-label">City:</label>
						<form:input path="city" class="form-control"/>
						<form:errors path="city" class="text-danger" />
					</div>
					<div class="form-group col-6">
	                <label class="col-form-label">Place:</label>
						<form:input path="place" class="form-control"/>
						<form:errors path="place" class="text-danger" />
					</div>
				</div>
					<div class="form-group">
	                <label class="col-form-label">Description:</label>
						<form:textarea path="description" class="form-control"/>
						<form:errors path="description" class="text-danger" />
					</div>
					<div class="row">
						<div class="form-group col-6">
							<label class="col-form-label">From:</label>
							<form:input type="date" path="start" min="${tripStart}" max="${tripEnd}" class="form-control"/>
							<form:errors path="start" class="text-danger" />
						</div>
						<div class="form-group col-6">
							<label class="col-form-label">To:</label>
							<form:input type="date" path="end" min="${tripStart}" max="${tripEnd}" class="form-control" />
							<form:errors path="end" class="text-danger" />
						</div>
					</div>
					<span class="text-danger">${errOverlap }</span>
					<div class="form-group">
						<input type="submit" class="btn btn-block main-bg-color shadow-sm mt-5"  value="Add Activity"/>
					</div>
						<p>Back to trip <a href="/trip/${trip_id}" class="link-text muted-color">${currentTrip.country}</a></p>
		   </form:form>
		   </div>
          </div>
           <div class="col-md-6 d-none d-md-flex bg-image-hike"></div>
      </div>
   </div>
</body>
</html>
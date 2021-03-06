<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


 <jsp:include page="./common/header.jsp"/>
	<nav class="navbar navbar-expand-lg fixed-top home-nav font-cursive mt-2">
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
			  	<a class="nav-link text-white" href="/register">Signup</a>
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
        <h3 class="display-3 font-cursive">Welcome to trip planner</h3>
        <p class="lead mb-0">Search for a trip by country or <a href="/trips" class="link-text main-color">view all trips</a></p>
  	    <form action="/search" method="post" class="my-3">
	  	    <div class="input-group  col-4 mx-auto ">
	           <input type="text" class="form-control" placeholder="Search" name="q">
	           <span class="input-group-btn">
	             <button type="submit" class="btn main-bg-color btn-search">
				    <i class="fas fa-search text-white"></i>
				</button>
	           </span>
	         </div>
        </form>
      </div>
    </div>
  </div>
</header>
</body>
</html>
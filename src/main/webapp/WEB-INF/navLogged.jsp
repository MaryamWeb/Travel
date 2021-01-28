<nav class="navbar navbar-expand-lg main-color font-cursive mt-2 home-nav">
  <a class="main-color navbar-brand mb-0 h1 hover-brown" href="/"><i class="fas fa-home"></i></a>
	   <ul class="navbar-nav  ml-auto">
		  <li class="nav-item">
		  	<a class="nav-link main-color hover-brown" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
		  </li>
	      <li class="nav-item">
	        <a class="nav-link main-color hover-brown" href="/logout">Logout</a>
	      </li>
      </ul>
</nav>
<nav class="navbar navbar-expand-lg main-color px-5">
  <a class="main-color navbar-brand mb-0 h1" href="/"><i class="fas fa-home"></i></a>
	   <ul class="navbar-nav  ml-auto">
		  <li class="nav-item">
		  	<a class="nav-link main-color" href="/dashboard/${currentUser.id}">${currentUser.username}</a>
		  </li>
	      <li class="nav-item">
	        <a class="nav-link main-color" href="/logout">Logout</a>
	      </li>
      </ul>
</nav>
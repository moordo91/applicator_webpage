<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Applicators</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="jquery.fullPage.css">
    <link rel="stylesheet" href="main.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" 
    	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="jquery.fullPage.js"></script>
    <script src="main.js"></script>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<header>
		<nav class="pb-3 mb-4 navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Applicator</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="main.jsp">Main</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="bbs.jsp">Board</a>
			        </li>
			        <%
			        	if (userID == null) {
			        %>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
			          data-bs-toggle="dropdown" aria-expanded="false">
			            Connect
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			          	<li><a class="dropdown-item" href="login.jsp">Login</a></li>
			            <li><a class="dropdown-item" href="join.jsp">Join</a></li>
			          </ul>
			        </li>
			        <%
			        	} else {
			        %>
	   		        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            My Account
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="logoutAction.jsp">Logout</a></li>
			          </ul>
			        </li>
			        <%		
			        	}
			        %>
			      </ul>
				</div>
			</div>
		</nav>
	</header>
	
	<main id="fullpage">
		<section id="title" class="section">
	        <div class="position-absolute top-50 start-50 translate-middle" style="text-align: center">
	            <h1 style="font-size: 10vw;">Dive Into</h1>
	            <h2 style="font-size: 10vw;">Programming</h2>
	        </div>
		</section>
		
		<section class="section">
			<figure>
	     		<h3 class="ms-5 sub__title">Study ????</h3>
				<div class="container">
	       		 	<div class="content__text">
					?????? ????????? ????????????? ?????? ???????????? ??????<br>
					????????? ???????????? ?????? ????????? ???????????? ???????<br>
					????????? ????????? ?????? ????????? ???????????? ???????????? ???????<br>
	       		 	</div>
	            </div>
        	</figure>
		</section>
		
		<section class="section">
			<figure>
	     		<h3 class="ms-5 sub__title">Project ???????</h3>
				<div class="container">
	       		 	<div class="content__text">
						??????! ?????? ??????????????? ???????????? ???????????????<br>
						TroubleShooting ?????????, ????????? ??????<br>
						?????? ???????????? ??????????????? ???????????????, ?????? ??????<br>
	       		 	</div>
	            </div>
        	</figure>
		</section>
		<section class="section">
			<figure>
	     		<h3 class="ms-5 sub__title">What is Next? ??????</h3>
				<div class="container">
	       		 	<div class="content__text">
					?????? ??????, ????????? ??????<br>
					AI??? ??????, Python<br>
					????????? ??????, Git & Github<br>
					Docker, Kubernetes ????????????<br>
					Database ?????????<br>
					MLOps with Bentoml???? + Yatai????<br>
	       		 	</div>
	            </div>
        	</figure>
		</section>
		<section class="section">
			<figure>
			<div style="text-align : center;">
			     <img src="images/poster_v2.png" style="max-width: 30vw; max-height: 80vw;">
			</div>
			</figure>
		</section>
			
		<footer class="section fp-auto-height">
			Copyright ??? Applicator
		</footer>
		
		<script>
			let observer = new IntersectionObserver((e)=>{
				e.forEach((f)=>{
					if (f.isIntersecting) {
						f.target.style.opacity = 1;
						f.target.style.transform = 'translateX(0%)';
					} else {
						f.target.style.opacity = 0;
					}
				})
			})
			
			let fig = document.querySelectorAll('figure')
			observer.observe(fig[0])
			observer.observe(fig[1])
			observer.observe(fig[2])
			observer.observe(fig[3])
		
		</script>
	</main>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
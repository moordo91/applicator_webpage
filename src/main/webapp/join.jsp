<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Applicators</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
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
						<a class="nav-link" aria-current="page" href="main.jsp">Main</a>
					</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="bbs.jsp">Board</a>
		        	</li>
		        	<li class="nav-item active dropdown">
		          		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
		          		data-bs-toggle="dropdown" aria-expanded="false">
		            		Connect
		          		</a>
			          	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">Login</a></li>
			            	<li><a class="dropdown-item" href="join.jsp">Join</a></li>
			          	</ul>
		        	</li>
		      	</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
			<div class="p-4 mb-2 border bg-secondary rounded-3 text-white">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">Join Applicator</h3>
					<div class="mb-4">
						<label for="inputEmail" class="form-label">E-mail Address</label>
						<input type="email" class="form-control" name="userEmail" maxlength="40">
					</div>
					<div class="mb-4">
						<label for="inputPassword" class="form-label">Password</label>
						<input type="password" class="form-control" name="userPassword" maxlength="20">
					</div>
					<div class="mb-4">
						<label for="inputID" class="form-label">Student ID</label>
						<input type="text" class="form-control" name="userID" maxlength="8">
					</div>
					<div class="mb-4">
						<label for="inputName" class="form-label">Name</label>
						<input type="text" class="form-control" name="userName" maxlength="20">
					</div>
					<div class="mb-4">
						<label for="inputPhone" class="form-label">Phone Number</label>
						<input type="text" class="form-control" name="userPhone" maxlength="11">
					</div>
					<div class="mb-4">
						<label for="inputGender" class="mb-2 form-label">Gender</label><br>
						<div class="form-check form-check-inline">
							<input type="radio" name="userGender" value="M">
							<label for="male">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="userGender" value="F">
							<label for="female">Female</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="userGender" value="E">
							<label for="etc">etc</label>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="Join">
				</form>
			</div>
		<div class="col-lg-4"></div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
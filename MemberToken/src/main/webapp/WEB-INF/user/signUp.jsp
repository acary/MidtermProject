<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - Sign Up</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<main class="container">

			<div class="form-signin">
			  <form action="signUp.do" method="post">
			  	<input type="hidden" name="role" value="user"> 
			    <h1 class="h3 mb-3 fw-normal">Sign Up</h1>
			
			    <div class="form-floating">
			      <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
			      <label for="floatingInput">Email address</label>
			    </div>
			    <div class="form-floating">
			      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
			      <label for="floatingPassword">Password</label>
			    </div>
			    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
			  </form>
			  
			  <p class="p-2">Already have an account? <a href="login.do">Login here</a>.</p>
			</div>
			
	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
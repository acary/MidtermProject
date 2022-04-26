<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - Login</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<main class="container">

			<div class="form-signin">
			  <form action="login.do" method="post">
			    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
			
			    <div class="form-floating">
			      <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
			      <label for="floatingInput">Email address</label>
			    </div>
			    <div class="form-floating">
			      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
			      <label for="floatingPassword">Password</label>
			    </div>
			    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
			  </form>
			</div>
			
	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
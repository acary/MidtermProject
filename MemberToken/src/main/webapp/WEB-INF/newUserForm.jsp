<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Actual Items</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="nav.jsp" />
	</div>

	<main class="container">
		<h1>New User Sign Up</h1>
		<div class="form-group">
			<form action="addUser.do" method="POST" class="container-sm">
			<input type="text" name="firstName" class="form-control" id="firstName"
				placeholder="First Name"> 
				<input type="text" name="lastName" class="form-control" id="lastName"
				placeholder="Last Name"> 
				<input type="text" name="email" class="form-control" id="email"
				placeholder="Email"> 
				<input type="password" name="password" class="form-control" id="password"
				placeholder="Password"> 
				<input type="username" name="username" class="form-control" id="username"
				placeholder="Username"> 
				<input type="submit" value="Create User"
					class="btn btn-outline-primary">
			</form>
		</div>

	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>
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
		<h1>Login</h1>
		<div class="form-group">
			<form action="login.do" method="post" class="container-sm">
				<input type="text" name="email" class="form-control m-1" id="exampleInputEmail1"
				placeholder="Email"> 
				<input type="password" name="password" class="form-control m-1" id="exampleInputPassword1"
				placeholder="Password"> 
				<input type="submit" value="Log In"
					class="btn btn-outline-primary">
			</form>
		</div>

	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create User</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Create User</h1>

		<div>
			<form action="createUser.do" method="post">
				<input type="hidden" name="active" value="1">
				<label
					for="email" class="form-label">Email</label> <input
					type="text" name="email" class="form-control form-control-lg" />
				
				<br>
				<input type="submit" class="btn btn-primary m-2"
					value="Add User" />
			</form>
		</div>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
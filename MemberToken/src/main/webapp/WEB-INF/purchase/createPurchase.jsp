<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Purchase</h1>

		<div>
			<form action="createPurchase.do" method="post">
				<input type="hidden" name="customer.id" value="${user.id}">
				
				<label
					for="memberToken.id" class="form-label">Member Token ID</label> <input
					type="text" name="memberToken.id" class="form-control form-control-lg" />
					
				<label
					for="ratingComment" class="form-label">Rating Comment</label> <input
					type="text" name="ratingComment" class="form-control form-control-lg" /> <br>
				<input type="submit" class="btn btn-primary m-2"
					value="Add Purchase" />
			</form>
		</div>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
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
		<h1>Purchase Details</h1>

		<div>
			<h5>ID: ${purchase.id}</h5>
			<p>Date & time: ${purchase.dateTimePurchased}</p>
			<br>

			<h5>${purchase.rating}</h5>
			<p>${purchase.ratingComment}
			<p>
			<hr>

			<form action="editRatingAndComment.do" method="post" class="ratingForm">
				<input type="hidden" name="pid" value="${purchase.id}">
<%-- 				<input type="hidden" name="dateTimePurchased" value="${purchase.dateTimePurchased}">
				<input type="hidden" name="customer" value="${purchase.customer}">
				<input type="hidden" name="memberToken" value="${purchase.memberToken}"> --%>
				<input type="number" name="rating" placeholder="Rating(1-5)"> <input type="text"
					name="ratingComment" placeholder="Rating Review"> 
					<c:choose>
					<c:when test="${empty purchase.rating}">
					<input type="submit" value="Leave Rating" >
					</c:when>
					<c:otherwise>
					<input type="submit" value="Edit Rating">
					</c:otherwise>
					</c:choose>
			</form>

		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
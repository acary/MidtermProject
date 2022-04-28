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
			<h5>ID ${purchase.id}</h5>
			<p>${purchase.dateTimePurchased}</p>
			<h5>Review: </h5>


			<c:choose>
			<c:when test="${purchase.rating == 1 }">
						<span class="fa fa-star checked"></span> <span
				class="fa fa-star"></span> <span class="fa fa-star"></span>
			<span class="fa fa-star"></span> <span class="fa fa-star"></span>
			</c:when>
			
			<c:when test="${purchase.rating == 2 }">
						<span class="fa fa-star checked"></span> <span
				class="fa fa-star checked"></span> <span class="fa fa-star"></span>
			<span class="fa fa-star"></span> <span class="fa fa-star"></span>
			</c:when>
			
			<c:when test="${purchase.rating == 3 }">
				<span class="fa fa-star checked"></span> 
				<span class="fa fa-star checked"></span> 
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"></span>
			</c:when>
			
			<c:when test="${purchase.rating == 4 }">
				<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span> <span class="fa fa-star"></span>
			</c:when>
			
			<c:when test="${purchase.rating == 5 }">
				<span class="fa fa-star checked"></span> <span
					class="fa fa-star checked"></span> <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span> <span class="fa fa-star checked"></span>
			</c:when>
			<c:otherwise>
				<h5>No rating found</h5>
			</c:otherwise>
			
			</c:choose>

			<p>${purchase.ratingComment}</p>
			
			<hr>
			
			<h5>Leave a rating</h5>

			<form action="editRatingAndComment.do" method="post"
				class="ratingForm form-floating">
				<input type="hidden" name="pid" value="${purchase.id}"> 
				<label for="rating">Rating</label>
				<input type="number" name="rating" max="5" min="1" class="form-control my-1" placeholder="5">
				<br>
				<input type="text" name="ratingComment" class="form-control" placeholder="Review">
				<c:choose>
					<c:when test="${empty purchase.rating}">
						<input type="submit" value="Leave Rating" class="w-100 btn btn-lg btn-primary my-1">
					</c:when>
					<c:otherwise>
						<input type="submit" value="Edit Rating" class="w-100 btn btn-lg btn-primary my-1">
					</c:otherwise>
				</c:choose>
			</form>

		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
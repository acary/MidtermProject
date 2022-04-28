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
		<p class="display-6">${purchase.memberToken.tokenName}</p>

	  	<div class="row">
		    <div class="col">
		    	<h5>Purchase Details</h5>
		    	<span class="badge rounded-pill bg-primary">ID ${purchase.id}</span>
				<p class="font-monospace my-2">${purchase.dateTimePurchased}</p>
		    </div>
		    <div class="col-6">
		    	<h5 class="display-6">Leave a rating!</h5>
				<form action="editRatingAndComment.do" method="post"
					class="ratingForm">
					<input type="hidden" name="pid" value="${purchase.id}"> 
					<label for="rating">Rating</label>
					<input type="number" name="rating" max="5" min="1" class="form-control my-1" placeholder="5">
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
		    <div class="col">
		    	<h5>My Review</h5>
				<hr>
				<p class="display-6 fst-italic">${purchase.ratingComment}</p>
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
		    </div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
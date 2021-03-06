<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Token Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Token Details</h1>
		
		<div class="col-4">
			<img src="${token.tokenImgUrl}" class="img-fluid">
		</div>

		<div>
			<h5>${token.tokenName}</h5>
			
			<br>
			<p>${token.description}</p>
			
			<hr>
			
			
			<a href="updateToken.do?tid=${token.id}"><button type="button" class="btn btn-primary">Update</button></a>
			<a href="createUserPurchase.do"><button type="button" class="btn btn-primary">Purchase</button></a>
			<a href=""><button type="button" class="btn btn-danger">Delete</button></a>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
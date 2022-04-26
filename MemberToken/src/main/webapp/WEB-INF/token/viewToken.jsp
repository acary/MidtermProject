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
		<div class="p-5 mb-4 bg-light rounded-3"
			style="background-image: url(${token.tokenImgUrl});">
			<div class="container-fluid py-5">
				<p class="display-1 fw-bold brandText text-wrap"
					style="width: 20rem;">${token.tokenName}</p>
				<p class="col-md-8 fs-4 brandText">${token.description}</p>






				<form action="createUserPurchase.do" method="post">
					<input type="hidden" value="${token.id}" name="tid"> <input
						type="hidden" value="${user.id}" name="uid">
					<button type="submit" class="btn btn-primary">Purchase</button>
				</form>


			</div>
		</div>

		<div class="row align-items-md-stretch">
			<div class="col-md-6">
				<div class="h-100 p-5 text-white bg-dark rounded-3">
					<h2>${token.tokenName}</h2>
					<p>${token.description}</p>
					<a href="viewToken.do?tid=${token.id}"><button
							class="btn btn-outline-light" type="button">Purchase</button></a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="h-100 p-5 bg-light border rounded-3">
					<h2>${token.tokenName}</h2>
					<p>${token.description}</p>
					<a href="viewToken.do?tid=${token.id}"><button
							class="btn btn-outline-secondary" type="button">Purchase</button></a>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- TOKEN -->
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="background-image: url(${token.tokenImgUrl});">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<p class="display-3 fw-normal brandText text-wrap"
					style="width: 20rem;">${token.tokenName}</p>
				<p class="lead fw-normal brandText text-wrap">${token.description}</p>
				<a class="btn btn-primary" href="#">Purchase</a>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>

		<!-- TOKENS -->
		<a id="collectionTokens"></a>
		<c:forEach var="token" items="${tokens}">
			<div class="p-5 m-1 bg-light rounded-3"
				style="background-image: url(${token.tokenImgUrl});">
				<div class="container-fluid py-5">
					<p class="display-6 fw-bold brandText text-wrap"
						style="width: 20rem;">${token.tokenName}</p>
					<p class="col-md-8 fs-4 brandText">${token.description}</p>
					<a href="viewToken.do?tid=${token.id}"><button
							class="btn btn-primary btn-lg" type="button">View Token</button></a>
				</div>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
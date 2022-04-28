<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${content.title}</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<div class="container">
		<div class="p-5 mb-4 bg-light rounded-3"
			style="background-image: url(${content.imageUrl});">
			<div class="container-fluid py-5">
				<p class="display-1 fw-bold brandText text-wrap"
					style="width: 20rem;">${content.title}</p>
				<p class="col-md-8 fs-4 brandText" style="width: 20rem;">${content.textContent}</p>
			</div>
		</div>

		<div class="row align-items-md-stretch">
			<div class="col-md-3">
				<div class="h-100 p-5 text-white bg-dark rounded-3">
					<p>${content.description}</p>
				</div>
			</div>
			<div class="col-md-9">
				<div class="h-100 p-5 bg-light border rounded-3">
					<c:forEach var="resource" items="${content.contentResources}">
						<h3 class="display-4">${resource.title}</h3>
						<p>${resource.description}</p>
						<small><span class="d-inline-block text-truncate" style="max-width: 250px;"><a href="${resource.resourceUrl}" target="_blank">${resource.resourceUrl}</a></span></small>
					</c:forEach>
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
				<a href="viewToken.do?tid=${token.id}"><button class="btn btn-primary btn-lg" type="button">View Token</button></a>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collection Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	
	<div class="container">
	  <!-- COLLECTION -->
	  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" style="background-image: url(${collection.imageUrl});">
	    <div class="col-md-5 p-lg-5 mx-auto my-5">
	      <h1 class="display-4 fw-normal">${collection.name}</h1>
	      <p class="lead fw-normal">${collection.description}</p>
	      <a class="btn btn-outline-secondary" href="#">View Tokens</a>
	    </div>
	    <div class="product-device shadow-sm d-none d-md-block"></div>
		<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	  </div>
	  
	  	<!-- TOKENS -->
		<c:forEach var="token" items="${tokens}">
			<div class="p-5 m-1 bg-light rounded-3" style="background-image: url(${token.tokenImgUrl});">
		      <div class="container-fluid py-5">
		        <h1 class="display-5 fw-bold">${token.tokenName}</h1>
		        <p class="col-md-8 fs-4">${token.description}</p>
		        <a href="getToken.do?tid=${token.id}"><button class="btn btn-primary btn-lg" type="button">View Token</button></a>
		      </div>
		    </div>
		</c:forEach>
		
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
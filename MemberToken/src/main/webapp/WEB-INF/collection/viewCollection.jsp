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
	  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" style="background-image: url(${collection.imageUrl}); background-size: cover; background-position:center; height: auto; width: auto;">
	    <div class="col-md-5 p-lg-5 mx-auto my-5">
	      <p class="display-3 fw-normal brandText text-wrap" style="width: 20rem;">${collection.name}</p>
	      <p class="lead fw-normal brandText text-wrap">${collection.description}</p>
	      <a class="btn btn-primary" href="#collectionTokens">View Tokens</a>
	    </div>
	    <div class="product-device shadow-sm d-none d-md-block"></div>
		<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	  </div>
	  
	  	<!-- TOKENS -->
	  	<a id="collectionTokens"></a>
		<c:forEach var="token" items="${tokens}">
			<div class="p-5 m-1 bg-light rounded-3" style="background-image: url(${token.tokenImgUrl}); background-size: cover; background-position:center; height: auto; width: auto;">
		      <div class="container-fluid py-5">
		        <p class="display-6 fw-bold brandText text-wrap" style="width: 20rem;">${token.tokenName}</p>
		        <p class="col-md-8 fs-4 brandText">${token.description}</p>
		        <a href="viewToken.do?tid=${token.id}"><button class="btn btn-primary btn-lg" type="button">View Token</button></a>
		      </div>
		    </div>
		</c:forEach>
		
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
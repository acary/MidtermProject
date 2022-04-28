<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Tokens</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	
	<div class="container">
	
		<!-- FEATURED TOKEN -->
		 <div class="p-5 m-1 bg-light rounded-3" style="background-image: url(${featured.tokenImgUrl});">
	      <div class="container-fluid py-5">
	        <p class="display-3 fw-bold brandText text-wrap" style="width: 20rem;">${featured.tokenName}</p>
	        <p class="display-6 fw-bold brandText text-wrap" style="width: 20rem;">${featured.collection.name}</p>
	        <p class="col-md-8 fs-4">${featured.description}</p>
	        <a href="viewToken.do?tid=${featured.id}"><button class="btn btn-primary btn-lg" type="button">View Token</button></a>
	      </div>
	    </div>
	
		<!-- TOKEN -->
		<c:forEach var="token" items="${tokens}">
			<div class="p-5 m-1 bg-light rounded-3" style="background-image: url(${token.tokenImgUrl}); background-size: cover; background-position:center; height: auto; width: auto; ">
		      <div class="container-fluid py-5">
		        <p class="display-3 fw-bold brandText text-wrap" style="width: 20rem;">${token.tokenName}</p>
		        <p class="display-6 fw-bold brandText text-wrap" style="width: 20rem;">${token.collection.name}</p>
		        <p class="col-md-8 fs-4">${token.description}</p>
		        <a href="viewToken.do?tid=${token.id}"><button class="btn btn-primary btn-lg" type="button">View Token</button></a>
		      </div>
		    </div>
		</c:forEach>
	
		<!--  INFORMATION -->
	    <div class="row align-items-md-stretch">
	      <div class="col-md-6">
	        <div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h2>Collect tokens, gain access</h2>
	          <p>Find limited tokens to collect and use to gain access to the hottest upcoming releases.</p>
	          <a href="all.do"><button class="btn btn-outline-light" type="button">Tokens</button></a>
	        </div>
	      </div>
	      <div class="col-md-6">
	        <div class="h-100 p-5 bg-light border rounded-3">
	          <h2>Connect with your audience</h2>
	          <p>Brands, musicians, designers and creators are using MBR TKN as a new way to grow and engage with their audiences.</p>
	          <a href="allBusinesses.do"><button class="btn btn-outline-secondary" type="button">Businesses</button></a>
	        </div>
	      </div>
	    </div>
    </div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN: Collect Unique Assets and Gain Access!</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>

	<div class="container">
		<jsp:include page="nav.jsp" />
	</div>
	
	<div class="container">
	    <div class="p-5 mb-1 bg-light rounded-3" style="background-image: url(${featuredCollection.imageUrl});">
	      <div class="container-fluid py-5">
	        <p class="display-1 fw-bold brandText text-wrap" style="width: 20rem;">MBR TKN</p>
	        <p class="col-md-8 fs-4 brandText">Member tokens are unique digital assets that show support for your favorite brands, musicians, designers and creators. Browse collections to find your new favorites and upcoming launches.</p>
	        <a href="viewCollections.do"><button class="btn btn-primary btn-lg" type="button">Collections</button></a>
	      </div>
	    </div>
	
	    <div class="row align-items-md-stretch">
	      <div class="col-md-6">
	        <div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h2>Collect tokens, gain access</h2>
	          <p>Find limited tokens to collect and use to gain access to the hottest upcoming releases.</p>
	          <a href="viewTokens.do"><button class="btn btn-outline-light" type="button">Tokens</button></a>
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

	<jsp:include page="footer.jsp" />
</body>
</html>
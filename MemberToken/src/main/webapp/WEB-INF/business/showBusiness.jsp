<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Business Details</h1>

		<div>
			<h5>${business.name}</h5>
			
			<br>
			<p>${business.description}</p>
			
			<hr>
			
			<a href="updateBusiness.do?bid=${business.id}"><button type="button" class="btn btn-primary">Update</button></a>
			<a href="deleteBusiness.do?bid=${business.id}"><button type="button" class="btn btn-danger">Delete</button></a>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
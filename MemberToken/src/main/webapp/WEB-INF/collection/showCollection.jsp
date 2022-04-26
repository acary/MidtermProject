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
		<h1>Collection Details</h1>

		<div>
			<h5>${collection.name}</h5>

			<br>
			<p>${collection.description}</p>
			
			<br>
			<div class="col-6">
				<img src="${collection.imageUrl}" class="img-fluid">
			</div>

			<hr>

			<a href="updateCollection.do?cid=${collection.id}"><button type="button" class="btn btn-primary">Update</button></a>
			<a href=""><button type="button" class="btn btn-danger">Delete</button></a>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
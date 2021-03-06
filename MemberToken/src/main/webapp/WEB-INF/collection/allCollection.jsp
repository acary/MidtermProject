<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Collections</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<main class="container">
		<h1>Collections</h1>

		<div class="btn-group" role="group"
			aria-label="Search jobs">
			<a href="allCollection.do"><button type="button" class="btn btn-outline-primary">Show All</button></a>
			<a href="createCollection.do"><button type="button" class="btn btn-outline-primary">Create Collection</button></a>
			<a href=""><button type="button" class="btn btn-outline-primary disabled">Keyword Search</button></a>
		</div>

		<br><br>

		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${user.role == 'admin'}">
				<c:forEach var="col" items="${allCollection}">
					<tr>
						<td>${col.id}</td>
						<td><a href="getCollection.do?cid=${col.id}">${col.name}</a></td>
					</tr>
				</c:forEach>
</c:if>
<c:if test="${businesses != null }">
				<c:forEach var="bus" items="${businesses}">
				<c:forEach var="col" items="${bus.collections}">
					<tr>
						<td>${col.id}</td>
						<td><a href="getCollection.do?cid=${col.id}">${col.name}</a></td>
					</tr>
				</c:forEach>
				</c:forEach>
</c:if>
			</tbody>
		</table>



	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Actual Items</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<main class="container">
		<h1>Actual Items</h1>

		<div class="btn-group" role="group"
			aria-label="Search jobs">
			<a href="allActualItem.do"><button type="button" class="btn btn-outline-primary">Show All</button></a>
			<a href=""><button type="button" class="btn btn-outline-primary disabled">ID Search</button></a>
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
				<c:forEach var="item" items="${allActualItem}">
					<tr>
						<td>${item.id}</td>
						<td><a href="getActualItem.do?actualItemId=${item.id}">${item.name}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
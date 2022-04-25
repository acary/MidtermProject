<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Purchases</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<main class="container">
		<h1>Purchases</h1>

		<div class="btn-group" role="group"
			aria-label="Search jobs">
			<a href="allPurchases.do"><button type="button" class="btn btn-outline-primary">Show All</button></a>
			<a href=""><button type="button" class="btn btn-outline-primary disabled">ID Search</button></a>
			<a href=""><button type="button" class="btn btn-outline-primary disabled">Keyword Search</button></a>
		</div>

		<br><br>

		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="purch" items="${purchases}">
					<tr>
						<td>${purch.id}</td>
						<td><a href="getPurchase.do?pid=${purch.id}">${purch.dateTimePurchased}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
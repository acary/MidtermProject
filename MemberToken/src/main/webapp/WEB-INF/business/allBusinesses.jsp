<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN - All Businesses</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>

	<main class="container">
		<h1>Businesses</h1>
		<c:if test="${not empty user}">
		<div class="btn-group" role="group"
			aria-label="Search jobs">
			<a href="allBusinesses.do"><button type="button" class="btn btn-outline-primary">Show All</button></a>
			<a href="createBusiness.do"><button type="button" class="btn btn-outline-primary ">Create Business</button></a>
			<a href=""><button type="button" class="btn btn-outline-primary disabled">Keyword Search</button></a>
		</div>
		</c:if>
		<br><br>

		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${user.role == 'admin' || empty user}">
				<c:forEach var="business" items="${allBusinesses}">
					<tr>
						<td>${business.id}</td>
						<td><a href="getBusiness.do?bid=${business.id}">${business.name}</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${businesses != null}">
							<c:forEach var="business" items="${businesses}">
					<tr>
						<td>${business.id}</td>
						<td><a href="getBusiness.do?bid=${business.id}">${business.name}</a></td>
					</tr>
				</c:forEach>
			</c:if>	
			</tbody>
		</table>

	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>
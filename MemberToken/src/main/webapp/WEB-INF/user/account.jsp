<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN: Collect Unique Assets and Gain Access!</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>

	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<br>
	<br>


	<div class="container">
		<div class="main-body">
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">

								<c:choose>
									<c:when test="${not empty user.profileImageUrl }">
										<img src="${user.profileImageUrl}" alt="Admin"
											class="rounded-circle p-1" width="160" height="160">
									</c:when>
									<c:otherwise>
										<img
											src="https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg"
											alt="Admin" class="rounded-circle " width="160" height="160">

									</c:otherwise>
								</c:choose>
								<hr class="my-4">
								<div class="mt-3">
									<h4>${user.firstName}${user.lastName}</h4>
									<p class="text-secondary mb-1">${user.username}</p>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<form action="updateUser.do" method="post">
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">First Name</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="hidden" value="${user.id}" name="uid"> <input
											type="text" class="form-control" value="${user.firstName}"
											name="firstName">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Last Name</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${user.lastName}" name="lastName">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" value="${user.email}"
											name="email">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Username</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${user.username}" name="username">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Profile Img URL</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${user.profileImageUrl}" name="profileImageUrl">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9 text-secondary">
										<input type="submit" class="btn btn-primary px-4"
											value="Save Changes">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<c:if test="${businesses == null }">
					<div class="col-lg-8 my-2">
						<p>You have no businesses listed. <a href="createBusiness.do">Create one here.</a></p>
					</div>
				</c:if>
				<c:if test="${businesses != null }">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4>Your Businesses</h4>
								<table class="table table-striped">
									<thead class="table-dark">
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Description</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="bus" items="${businesses}">
											<tr>
												<td>${bus.id}</td>
												<td><a href="getBusiness.do?bid=${bus.id}">${bus.name}</a></td>
												<td>${bus.description}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:if>
				
			</div>
			<div class="row">
				<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4>Your purchases</h4>
								<table class="table table-striped">
									<thead class="table-dark">
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Member Token</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pur" items="${purchases}">
											<tr>
												<td>${pur.id}</td>
												<td><a href="getPurchase.do?pid=${pur.id}">${pur.dateTimePurchased}</a></td>
												<td><a href="viewToken.do?tid=${pur.memberToken.id}">${pur.memberToken.tokenName}</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row">
				<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4>Your Favorites</h4>
								<table class="table table-striped">
									<thead class="table-dark">
										<tr>
											<th>Name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="fav" items="${favorites}">
											<tr>
												
												<td>${fav}</td>
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light mb-1"
	style="background-color: #68C5DB;">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.do">MBR TKN</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse nav-align" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item mx-2"><a class="nav-link"
					href="viewCollections.do"><span class="navbar-text">Collections</span></a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="viewTokens.do"><span class="navbar-text">Tokens</span></a></li>
				<c:if test="${user.role == 'admin' }">
					<li class="nav-item dropdown mx-2"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<button class="btn btn-dark btn-sm" type="button">Admin</button>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="allActualItem.do">Actual
									Items</a></li>
							<li><a class="dropdown-item" href="allBusinesses.do">Businesses</a></li>
							<li><a class="dropdown-item" href="allContent.do">Content</a></li>
							<li><a class="dropdown-item" href="allContentResource.do">Content
									Resources</a></li>
							<li><a class="dropdown-item" href="allCollection.do">Collections</a></li>
							<li><a class="dropdown-item" href="allPurchases.do">Purchases</a></li>
							<li><a class="dropdown-item" href="all.do">Tokens</a></li>
							<li><a class="dropdown-item" href="allUser.do">Users</a></li>
						</ul></li>
				</c:if>
				<c:if test="${businesses != null }">
					<li class="nav-item mx-1">
						<button class="btn btn-primary my-1" type="button"
							data-bs-toggle="offcanvas"
							data-bs-target="#offcanvasWithBothOptions"
							aria-controls="offcanvasWithBothOptions">My Business</button>
					</li>
					<li class="nav-item mx-1">
						<button class="btn btn-secondary my-1" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
							aria-controls="offcanvasRight">My Collections</button>
					</li>
					<li class="nav-item mx-1">
						<button class="btn btn-light my-1" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">My Tokens</button>
					</li>
				</c:if>
				<c:if test="${empty user}">
					<li class="nav-item mx-2"><a class="nav-link" href="login.do"><button
								class="btn btn-dark btn-sm" type="button">Login</button></a></li>
				</c:if>

				<c:if test="${not empty user}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> My Account </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="account.do">Profile</a></li>
							<li><a class="dropdown-item" href="logout.do"><button
										class="btn btn-light btn-sm" type="button">Logout</button></a></li>
						</ul>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<!-- ALERTS: CONTENT -->
<c:if test="${not empty accessCode && not empty user}">
	<div class="container my-2">
		<div class="alert alert-primary alert-dismissible fade show"
			role="alert">
			Use code: ${accessCode} to enter <a
				href="viewContent.do?cid=${contentId}">${contentTitle}</a>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
</c:if>

<!-- ALERTS: SUCCESS -->
<c:if test="${not empty successMessage}">
	<div class="container my-2">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			${successMessage}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
</c:if>
<c:if test="${businesses != null }">
	<!-- BUSINESS: OFF-GRID -->
	<div class="offcanvas offcanvas-start" data-bs-scroll="true"
		tabindex="-1" id="offcanvasWithBothOptions"
		aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">My
				Business</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bus" items="${businesses}">
						<tr>
							<td><a href="getBusiness.do?bid=${bus.id}">${bus.name}</a></td>
							<td><span class="d-inline-block text-truncate"
								style="max-width: 250px;">${bus.description}</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="createBusiness.do"><button class="btn btn-dark btn-sm" type="button">Create a business</button></a>
		</div>
	</div>
	
	<!-- COLLECTION: OFF-GRID -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 id="offcanvasRightLabel">My Collections</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Title</th>
					</tr>
				</thead>
				<tbody>
	
					<c:forEach var="bus" items="${businesses}">
						<c:forEach var="col" items="${bus.collections}">
							<tr>
								<td>${col.id}</td>
								<td><a href="getCollection.do?cid=${col.id}">${col.name}</a></td>
							</tr>
						</c:forEach>
					</c:forEach>
	
				</tbody>
			</table>
			<a href="createCollection.do"><button class="btn btn-dark btn-sm" type="button">Create a Collection</button></a>
		</div>
	</div>
	
	<!-- TOKENS: OFF-GRID -->
	<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
	  <div class="offcanvas-header">
	    <h5 class="offcanvas-title" id="offcanvasBottomLabel">My Tokens</h5>
	    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	  </div>
	  <div class="offcanvas-body small">
	  		<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Member Token</th>
						<th>Collection</th>
					</tr>
				</thead>
				<tbody>
	
					<c:forEach var="bus" items="${businesses}">
						<c:forEach var="col" items="${bus.collections}">
						<c:forEach var="tkn" items="${col.memberTokens}">
							
							<tr>
								<td>${tkn.id}</td>
								<td><a href="viewToken.do?tid=${tkn.id}">${tkn.tokenName}</a></td>
								<td><a href="getCollection.do?cid=${col.id}">${col.name}</a></td>
							</tr>
						</c:forEach>
						</c:forEach>
					</c:forEach>
	
				</tbody>
			</table>
			<a href="createToken.do"><button class="btn btn-dark btn-sm" type="button">Create a token</button></a>
	  </div>
	</div>
	
</c:if>
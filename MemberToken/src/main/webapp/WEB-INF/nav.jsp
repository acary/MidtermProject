<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #68C5DB;">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.do">MBR TKN</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="viewCollections.do">Collections</a></li>
				<li class="nav-item"><a class="nav-link" href="viewTokens.do">Tokens</a></li>
				<c:if test="${user.role == 'admin' }">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							All </a>
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
					<li class="nav-item"><a class="nav-link" href="allBusinesses.do">My Businesses</a>
					</li>
				</c:if>
				<c:if test="${empty user}">
					<li class="nav-item"><a class="nav-link" href="login.do">Login</a>
					</li>
				</c:if>

				<c:if test="${not empty user}">
					<li class="nav-item"><a class="nav-link" href="account.do">Account</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<!-- ALERTS: CONTENT -->
<c:if test="${not empty accessCode}">
	<div class="container my-2"> 
		<div class="alert alert-primary alert-dismissible fade show" role="alert">
			Use code: ${accessCode} to enter <a href="viewContent.do?cid=${contentId}">${contentTitle}</a>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</div>
</c:if>

<!-- ALERTS: SUCCESS -->
<c:if test="${not empty successMessage}">
	<div class="container my-2"> 
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			${successMessage}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</div>
</c:if>
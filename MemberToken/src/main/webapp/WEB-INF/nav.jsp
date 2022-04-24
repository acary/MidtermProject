<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<nav class="navbar navbar-expand-lg navbar-light"
			style="background-color: #68C5DB;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">MBR TKN</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								All </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="allActualItem.do">Actual Items</a></li>
								<li><a class="dropdown-item" href="all.do">Tokens</a></li>
								<li><a class="dropdown-item" href="allBusinesses.do">Businesses</a></li>
								<li><a class="dropdown-item" href="allContent.do">Content</a></li>
								<li><a class="dropdown-item" href="allContentResource.do">Content Resource</a></li>
								<li><a class="dropdown-item" href="allCollection.do">Collection</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Add New</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="">Token</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
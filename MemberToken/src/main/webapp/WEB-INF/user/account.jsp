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


	<div class="container">
		<div class="main-body">
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">

								<c:choose>
									<c:when test="${not empty user.profileImageUrl }">
									<img
										src="${user.profileImageUrl}"
										alt="Admin" class="rounded-circle p-1" width="140">
									</c:when>
									<c:otherwise>
									<img
										src="https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg"
										alt="Admin" class="rounded-circle p-1" width="140">
										
									</c:otherwise>
								</c:choose>	
							<hr class="my-4">
									<div class="mt-3">
										<h4>${user.firstName}${user.lastName}</h4>
										<p class="text-secondary mb-1">${user.username}</p>
										<button class="btn btn-primary">Follow</button>
										<button class="btn btn-outline-primary">Message</button>
									</div>
							</div>
								
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Full Name</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="John Doe">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control"
										value="john@example.com">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Phone</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="(239) 816-9029">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Mobile</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="(320) 380-4539">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Address</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control"
										value="Bay Area, San Francisco, CA">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-9 text-secondary">
									<input type="button" class="btn btn-primary px-4"
										value="Save Changes">
								</div>
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
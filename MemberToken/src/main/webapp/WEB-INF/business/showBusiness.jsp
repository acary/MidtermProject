<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
									<c:when test="${not empty business.logoUrl}">
										<img src="${business.logoUrl }" width="140">
									</c:when>
									<c:otherwise>
										<img
											src="https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg"
											alt="Admin" class="rounded-circle p-1" width="140">

									</c:otherwise>
								</c:choose>
								<hr class="my-4">
								<div class="mt-3">


									<h4>${business.name}</h4>
									<p>${business.description}</p>
									<c:if test="${not empty user  || business.user.id == user.id || user.role == 'admin' }">
										<a href="updateBusiness.do?bid=${business.id}"><button
												type="button" class="btn btn-primary disable">Update</button></a>
										<a href="deleteBusiness.do?bid=${business.id}"><button
												type="button" class="btn btn-primary disable">Delete</button></a>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</div>

				<c:if test="${not empty user || business.user.id == user.id || user.role == 'admin'}">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<form action="updateBusiness.do" method="post">
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Business Name</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="hidden" name="bid" value="${business.id}">
											<input type="text" name="name" class="form-control"
												value="${business.name}">
										</div>
									</div>

									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Description</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" name="description" class="form-control"
												value="${business.description}">
										</div>
									</div>


									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Image Logo</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" name="logoUrl" class="form-control"
												value="${business.logoUrl}">
										</div>
									</div>




									<div class="col-sm-9 text-secondary">
										<input type="submit" class="btn btn-primary m-2"
											value="Update Business" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>





	<jsp:include page="../footer.jsp" />
</body>
</html>



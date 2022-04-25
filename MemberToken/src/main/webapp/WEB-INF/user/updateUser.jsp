<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Update Business</h1>
		<span class="badge rounded-pill bg-primary">ID ${business.id}</span>

		<div>
			<form action="updateUser.do" method="post">

				<input type="hidden" name="bid" value="${user.id}"> <label
					for="firstName" class="form-label">First Name</label> <input type="text"
					name="firstName" class="form-control form-control-lg" />
				<div id="ActualItemNameHelp" class="form-text">${user.firstName}</div>
				<label
					for="lastName" class="form-label">Last Name</label> 
					<input type="text" name="lastName" class="form-control form-control-lg" />
				<div class="form-text">${user.lastName}</div>
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Update Business" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
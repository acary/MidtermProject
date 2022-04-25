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
			<form action="updateBusiness.do" method="post">

				<input type="hidden" name="bid" value="${business.id}"> <label
					for="name" class="form-label">Business Name</label> <input type="text"
					name="name" class="form-control form-control-lg" />
				<div id="ActualItemNameHelp" class="form-text">${business.name}</div>
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Update Business" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
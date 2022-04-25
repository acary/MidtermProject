<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content Resource Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Update Content Resource</h1>
		<span class="badge rounded-pill bg-primary">ID ${contentResource.id}</span>

		<div>
			<form action="updateContentResource.do" method="post">

				<input type="hidden" name="cid" value="${contentResource.id}"> <label
					for="title" class="form-label">Content Resource Title</label> <input type="text"
					name="title" class="form-control form-control-lg" />
				<div id="ContentResourceTitleHelp" class="form-text">${contentResource.title}</div>
				<label
					for="description" class="form-label">Content Resource Description</label> 
					<input type="text" name="description" class="form-control form-control-lg" />
				<div id="DescriptionHelp" class="form-text">${contentResource.description}</div>
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Update Content Resource" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Update Content</h1>
		<span class="badge rounded-pill bg-primary">ID ${content.id}</span>

		<div>
			<form action="updateContent.do" method="post">

				<input type="hidden" name="cid" value="${content.id}"> <label
					for="name" class="form-label">Content Name</label> <input type="text"
					name="name" class="form-control form-control-lg" />
				<div id="ContentNameHelp" class="form-text">${content.name}</div>
				<label
					for="description" class="form-label">Content Description</label> 
					<input type="text" name="description" class="form-control form-control-lg" />
				<div id="DescriptionHelp" class="form-text">${content.description}</div>
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Update Content" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1>Content Resource</h1>

		<div>
			<form action="createContentResource.do" method="post">
				<input type="hidden" name="contentItem.id" value="${contentItem.id}"> <label
					for="title" class="form-label">Content Resource Name</label> <input
					type="text" name="title" class="form-control form-control-lg" /> <br>
				<input type="submit" class="btn btn-primary m-2"
					value="Add Content Resource" />
			</form>
		</div>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
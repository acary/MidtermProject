<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actual Item Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Update Actual Item</h1>
		<span class="badge rounded-pill bg-primary">ID ${actualItem.id}</span>

		<div>
			<form action="updateActualItem.do" method="post">

				<input type="hidden" name="aid" value="${actualItem.id}"> <label
					for="name" class="form-label">Actual Item Name</label> <input type="text"
					name="name" class="form-control form-control-lg" />
				<div id="ActualItemNameHelp" class="form-text">${actualItem.name}</div>
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Update Actual Item" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
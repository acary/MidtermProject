<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1>Actual Item Details</h1>

		<div>
			<form action="createActualItem.do" method="post">

				<label for="name" class="form-label">Actual Item Title</label> <input
					type="text" name="name" class="form-control form-control-lg" />
				<br> <input type="submit" class="btn btn-primary m-2"
					value="Add Actual Item" />
			</form>
		</div>
		
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
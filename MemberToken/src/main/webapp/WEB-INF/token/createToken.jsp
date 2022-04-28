<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Token Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Token</h1>

		<div>
			<form action="createToken.do" method="post">
				<input type="hidden" name="token.id" value="${token.id}"> 
				
				<input type="hidden" name="original" value= "true"> 
				
				<label
					for="tokenName" class="form-label">Token Name</label> <input
					type="text" name="tokenName" class="form-control form-control-lg" /> <br>
					
				<label
					for="collection.id" class="form-label">Collection ID</label> <input
					type="text" name="collection.id" class="form-control form-control-lg" /> <br>
				
				<label
					for="actualItem.id" class="form-label">Actual Item ID</label> <input
					type="text" name="actualItem.id" class="form-control form-control-lg" /> <br>
				
				<input type="submit" class="btn btn-primary m-2"
					value="Add Token" />
			</form>
		</div>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
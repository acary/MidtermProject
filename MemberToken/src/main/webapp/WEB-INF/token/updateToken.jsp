<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<h1>Update Token</h1>
		<span class="badge rounded-pill bg-primary">ID ${token.id}</span>

		<div>
			<form action="updateToken.do" method="post">

				<input type="hidden" name="tid" value="${token.id}"> <label
					for="tokenName" class="form-label">Token Name</label> <input type="text"
					name="tokenName" class="form-control form-control-lg" />
				<div id="TokenNameHelp" class="form-text">${token.tokenName}</div>
				
				<label
					for="description" class="form-label">Token Description</label> 
					<input type="text" name="description" class="form-control form-control-lg" />
				<div id="DescriptionHelp" class="form-text">${token.description}</div>
				
				<label
					for="tokenImgUrl" class="form-label">Image URL</label> 
					<input type="text" name="tokenImgUrl" class="form-control form-control-lg" />
				<div id="ImageUrlHelp" class="form-text">${token.tokenImgUrl}</div>
				
				<br> 
				<input type="submit" class="btn btn-primary m-2"
					value="Update Token" />
			</form>
			
			<div class="col-4">
				<img src="${token.tokenImgUrl}" class="img-fluid">
			</div>
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
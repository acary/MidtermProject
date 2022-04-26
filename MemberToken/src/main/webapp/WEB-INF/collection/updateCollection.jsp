<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collection Details</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	<div class="container">
		<h1>Update Collection</h1>
		<span class="badge rounded-pill bg-primary">ID ${collection.id}</span>

		<div>
			<form action="updateCollection.do" method="post">

				<input type="hidden" name="cid" value="${collection.id}"> <label
					for="name" class="form-label">Collection Name</label> <input type="text"
					name="name" class="form-control form-control-lg" />
				<div id="CollectionNameHelp" class="form-text">${collection.name}</div>
				<label
					for="description" class="form-label">Collection Description</label> 
					<input type="text" name="description" class="form-control form-control-lg" />
				<div id="DescriptionHelp" class="form-text">${collection.description}</div>
				
				<label
					for="imageUrl" class="form-label">Image URL</label> 
					<input type="text" name="imageUrl" class="form-control form-control-lg" />
				<div id="imageUrlHelp" class="form-text">${collection.imageUrl}</div>
				
				<br> 
				
				<input type="submit" class="btn btn-primary m-2"
					value="Update Collection" />
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
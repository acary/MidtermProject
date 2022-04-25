<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBR TKN: Collect Unique Assets and Gain Access!</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>

	<div class="container">
		<jsp:include page="../nav.jsp" />
	</div>
	
	<div class="d-flex flex-row container">
		<div class="container p-2 container">
			<c:choose>
				<c:when test="${not empty user.profileImageUrl }">
					<img src="${user.profileImageUrl}" class="img-circle"
						alt="profile picture">
				</c:when>
				<c:otherwise>
					<img
						src="https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg"
						alt="stock profile picture" width="250px" height="250px">
				</c:otherwise>
			</c:choose>
			<h3>${user.firstName} ${user.lastName}</h3> 
		</div>

		<div class="container p-2">
			<h3>Email: ${user.email}</h3>
			<h3>Username: ${user.username}</h3>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>
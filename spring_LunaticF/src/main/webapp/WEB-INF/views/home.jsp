<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<img src="${pageContext.request.contextPath }/images/mainm.jpg" style="width: 100%; height: 100%; padding: 0; ">
	<h1 style="text-align: center; color: #0080FF;">
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				어서오세요 L Finder 오신것을 환영합니다.
			</c:when>
			<c:otherwise>
				어서오세요   ${sessionScope.id } 님!!
			</c:otherwise>
		</c:choose>
	</h1>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-color: skyblue;
}
</style>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div style="background-color: skyblue;">
		<table style="width: 100%">
			<tr>
				<td>
					<div style="background-color: skyblue; font-style:oblique; color: white; text-align: center; font-size: 80px; font-family: fantasy; ">
						L FINDER
					</div>
				</td>
			</tr>
		</table>
		<nav class="navbar navbar-default" style="background-color: white;">
			<div class="container-fluid" >

				<div class="collapse navbar-collapse" id="myNavbar" >
					<ul class="nav nav-pills" >
						<li class="active"><a href="${pageContext.request.contextPath }/">HOME</a></li>
						<li><a href="${pageContext.request.contextPath }/finder_l/list">FINDER</a></li>
						<li><a href="${pageContext.request.contextPath }/memo_l/list">MEMO</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> BOARD <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${pageContext.request.contextPath }/sharebbs_l/list">Share</a></li>
								<li><a href="${pageContext.request.contextPath }/notice_l/list">Notice</a></li>
								<li><a href="${pageContext.request.contextPath }/reserve_l/list">Reserve</a></li>
							</ul>
						</li>
							<c:choose>
								<c:when test="${empty sessionScope.id }">
									<li><a
										href="${pageContext.request.contextPath }/member_l/create">CREATE</a></li>
								</c:when>
								<c:when
									test="${not empty sessionScope.id && sessionScope.grade == 'H' }">
									<li class="dropdown" ><a class="dropdown-toggle"
										data-toggle="dropdown" href="#" > MyInfo <span class="caret"></span></a>
										<ul class="dropdown-menu" role="menu">
											<li><a
												href="${pageContext.request.contextPath }/member_l/read">Info</a></li>
											<li><a
												href="${pageContext.request.contextPath }/member_l/update">Update</a></li>
											<li><a
												href="${pageContext.request.contextPath }/member_l/delete">ID_DEL</a></li>
										</ul>
									</li>
	
								</c:when>
							</c:choose>
							<c:if
									test="${not empty sessionScope.id && sessionScope.grade=='A' }">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" href="#"> Admin <span class="caret"></span></a>
										<ul class="dropdown-menu" role="menu">
											<li><a
												href="${pageContext.request.contextPath }/admin/list">Member</a></li>
										</ul>
								</c:if>
						
						
							<c:choose>
								<c:when test="${not empty sessionScope.id}">
									<li><a href="${pageContext.request.contextPath }/member_l/logout">
										<span class="glyphicon glyphicon-log-in"></span> LOGOUT
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/member_l/login"> <span
											class="glyphicon glyphicon-log-in"></span> LOGIN
									</a></li>
								</c:otherwise>
							</c:choose>		
						</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div class="container" style="background-color: white; padding: 0;">
	
	
	
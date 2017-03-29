<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function rcreate(){
		var url = "create";
		location.href=url;
	}
	
	function rupdate(){
		var url = "update";
		url += "?reserveno=${dto.reserveno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
	
	function rdelete(){
		var url = "delete";
		url += "?reserveno=${dto.reserveno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
	function rreply(){
		var url = "reply";
		url += "?reserveno=${dto.reserveno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
	
	function rlist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
</script>
</head>
<body>
 
	<h2 style="text-align: center;">예약 내역 조회</h2>
	<div class="container">
		<div class="table-responsive">
			 <table class="table" style=" width: 80%;" >
				  <tr>
				    <th>예약번호</th>
				    <td>${dto.reserveno}</td>
				  </tr>
				  <tr>
				    <th>제목</th>
				    <td>${dto.retitle}</td>
				  </tr> 
				  <tr>
				    <td colspan="2">${dto.recontent}</td>
				  </tr> 
				  <tr>
				    <th>예약날짜</th>
				    <td>${dto.reterm}</td>
				  </tr>
				  <tr>
				    <th>장소</th>
				    <td>${dto.restate}</td>
				  </tr>  
				  <tr>
				    <th>인원</th>
				    <td>${dto.retimnum}</td>
				  </tr>
				  <tr>
				    <th>등록날짜</th>
				    <td>${dto.redate}</td>
				  </tr>
				  <tr>
				    <th>조회수</th>
				    <td>${dto.reviewcnt}</td>
				  </tr>
				  <tr>
				    <th>아이디</th>
				    <td>${dto.id}</td>
				  </tr>
			</table>
		</div>
	  
		<DIV class="bottom" style="text-align: center;">
			<c:if test="${not empty sessionScope.id}">
				<input type="button" value="등록" onclick="rcreate()">
			</c:if>
				<input type="button" value="목록" onclick="rlist()">
			<c:if test="${not empty sessionScope.id && sessionScope.id == dto.id}">
				<input type="button" value="수정" onclick="rupdate()">
				<input type="button" value="삭제" onclick="rdelete()">
			</c:if>
			<c:if	test="${not empty sessionScope.id && sessionScope.grade=='A' }">
				<input type="button" value="답변" onclick="rreply()">
				<input type="button" value="삭제" onclick="rdelete()">
			</c:if>
		</DIV>
	</div>
</body>
</html> 
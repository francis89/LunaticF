<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
</style> 
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
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
 
<DIV class="title">조회</DIV>
 
  <TABLE style=" width: 60%; padding: 20px;">
  <TR>
    <TH>예약번호</TH>
    <TD>${dto.reserveno}</TD>
  </TR>
  <TR>
    <TH>제목</TH>
    <TD>${dto.retitle}</TD>
  </TR> 
  <TR>
    <TD colspan="2" class='td'>${dto.recontent}</TD>
  </TR> 
  <TR>
    <TH>예약날짜</TH>
    <TD>${dto.reterm}</TD>
  </TR>
  <TR>
    <TH>장소</TH>
    <TD>${dto.restate}</TD>
  </TR>  
  <TR>
    <TH>인원</TH>
    <TD>${dto.retimnum}</TD>
  </TR>
  <TR>
    <TH>등록날짜</TH>
    <TD>${dto.redate}</TD>
  </TR>
  <TR>
    <TH>조회수</TH>
    <TD>${dto.reviewcnt}</TD>
  </TR>
  <TR>
    <TH>아이디</TH>
    <TD>${dto.id}</TD>
  </TR>
</TABLE>
  
  <div class="bottom">
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
</div>
</body>
</html> 
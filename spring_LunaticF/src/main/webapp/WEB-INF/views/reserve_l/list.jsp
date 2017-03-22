<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css"> 
*{ 
  font-size: 20px; 
} 
.search{
	width: 80%;
	text-align: center;
	margin: 2px auto;
}
</style>
<script type="text/javascript">
function read(reserveno) {
  var url = "read";
  	  url += "?reserveno=" + reserveno;
      url += "&col=${col}";
      url += "&word=${word}";
      url += "&nowPage=${nowPage}";
  
  location.href = url;
}

function idcheck(button) {
	if ('${sessionScope.id}' == "") {
		if (confirm("로그인후 등록을 하세요")) {
			var url = "../member_l/login";
			url = url + "?nowPage=${param.nowPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			url = url + "&bflag=../reserve_l/create";
			location.href = url;
		} else {
			button.blur();
		}
	} else {
		location.href = "../reserve_l/create";
	}
}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<DIV class="search"> 
  <FORM method='post' action="./list"> 
  <SELECT name='col'> <!-- 검색할 컬럼 -->
    <OPTION value='retitle' <c:if test="${col=='retitle'}">selected='selected'</c:if>>제 목</OPTION> 
    <OPTION value='restate' <c:if test="${col=='restate'}">selected='selected'</c:if>>장 소</OPTION> 
    <OPTION value='id' <c:if test="${col=='id'}">selected='selected'</c:if>>아이디</OPTION> 
    <OPTION value='total'>전체출력</OPTION> 
  </SELECT> 
  <input type='text' name='word' value='${word}'> <!-- 검색어 -->
  <input type='submit' value='검색' class="button_mini" >
  </FORM> 
</DIV> 
 
 
<DIV class="title"> 게시판 목록 </DIV>
	<TABLE>
   <TR>
    <TH>번호</TH>
    <TH>제목</TH>
    <TH>장소</TH>
    <TH>작성날짜</TH>
    <TH>조회수</TH>
    <TH>작성자</TH>
    
  </TR>
  <c:choose>
  	<c:when test="${fn:length(list) == 0}">
    <TR>
      <TD colspan='8' align='center'>등록된 글이 없습니다.</TD>
    </TR>
    </c:when>
    <c:otherwise>
    	<c:forEach items="${list}" var="dto">
    		<TR>
      			<TD>${dto.reserveno}</TD>
      			<TD>
      			<c:forEach begin="1" end="${dto.indent}">&nbsp;&nbsp;</c:forEach>
      				<c:if test="${dto.indent > 0}">
      					<img src="${pageContext.request.contextPath}/images/reply.JPG" style=" width:10px; height:10px;">
      				</c:if>
      				<a href="javascript:read('${dto.reserveno}')">
      					${dto.retitle}
      				</a>
      				<c:if test="${util:compareDay(fn:substring(dto.redate, 0, 10))}"><img src="${pageContext.request.contextPath}/images/new.gif"></c:if>
      			</TD>
      			<TD>${dto.restate}</TD>
      			<TD>${dto.redate}</TD>
      			<TD>${dto.reviewcnt}</TD>
      			<TD>${dto.id}</TD>
      			</TR>
    	</c:forEach>
    </c:otherwise> 
  </c:choose>
  </TABLE>
  
  <DIV class='bottom'>
  	${paging}
  </DIV>
 <DIV class='bottom'>
	<input type='button' value='등록' class="button" onclick="idcheck(this)">
    <input type='button' value='이전' class="button" onclick="location.href=history.back()">
 </DIV>
</body>
</html>
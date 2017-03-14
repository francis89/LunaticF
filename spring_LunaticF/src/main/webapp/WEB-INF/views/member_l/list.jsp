<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<script type="text/javascript">
function read(id){
	var url ="${pageContext.request.contextPath }/member_l/read";
	url += "?id="+id;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}

</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">회원 목록</DIV>
 <DIV class="search">
<FORM name='frm' method='POST' action='./list'>
<SELECT name="col">
	<option value="username" 
		<c:if test="${col=='username'}"> selected='selected' </c:if>>Name</option>
	<option value="tel"
		<c:if test="${col=='tel'}"> selected='selected' </c:if>>Tel</option>
	<option value="id"
		<c:if test="${col=='id'}"> selected='selected' </c:if>>I   D</option>
	<option value="total">전체출력</option>
</SELECT>
<input type="text" name="word" value='${word }'>
<input type="submit" value="검색">
<input type="button" value="회원가입" onclick="location.href='./create'"> 
</FORM>
 </DIV>
 
<c:forEach items="${list}" var="dto">
  <TABLE style="width:80%;">

    <TR>
      <TH width="20%">I D</TH>
      <TD width="50%">
      <a href="javascript:read('${dto.id }')">
		${dto.id }
      </a>
      </TD>
    </TR>
    <TR>
      <TH>Name</TH>
      <TD>${dto.username }</TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD>${dto.tel }</TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      ${dto.address1 }
      ${dto.address2 }
      </TD>
    </TR>
  </TABLE>
</c:forEach>
  <DIV class='bottom'>
  ${paging }
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
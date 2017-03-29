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
TD{
	width: 55%;
	text-align: left;
}
</style> 
</head> 
<body>
 
<h2 style="text-align: center;">회원 목록</h2>
 <div style="text-align: center;">
	<form name='frm' method='POST' action='./list'>
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
	</form>
 </div>
 <div class="container">
	<div class="table-responsive">
		<c:forEach items="${list}" var="dto">
		  <table class="table">
		    <tr>
		      <th>I D</th>
		      <TD><a href="javascript:read('${dto.id }')">${dto.id }</a></TD>
		    </tr>
		    <tr>
		      <th>Name</th>
		      <TD>${dto.username }</TD>
		    </tr>
		    <tr>
		      <th>전화번호</th>
		      <TD>${dto.tel }</TD>
		    </tr>
		    <tr>
		      <th>주소</th>
		      <TD>
			      ${dto.address1 }
			      ${dto.address2 }
		      </TD>
		    </tr>
		  </table>
		</c:forEach>
	</div>
  <div class='bottom'>
  ${paging }
  </div>
 
  </div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
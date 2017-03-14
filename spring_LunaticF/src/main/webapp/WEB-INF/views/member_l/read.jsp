<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function update(){
	var url = "update";
	url += "?id=${id}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href = url;
}

function deleteId(){
	var url = "delete";
	url += "?id=${id}";

	location.href = url;
	
}

function mlist() {
	var url = "${pageContext.request.contextPath}/admin/list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href = url;
}

function updatePw(){
	var url = "updatePw";
	url += "?id=${id}";

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
 
<DIV class="title">${dto.username } 의 회원 정보</DIV>
 <DIV class="content">
  <TABLE>
    <TR>
      <TH>ID</TH>
      <TD>${dto.id }</TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>${dto.username }</TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD>${dto.tel }</TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD>${dto.zipcode }</TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      		${dto.address1 }
      		${dto.address2 }
      </TD>
    </TR>
    <TR>
      <TH>가입날짜</TH>
      <TD>${dto.wdate }</TD>
    </TR>
  
  </TABLE>
 </DIV>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update()">
    
    <c:choose>
    	<c:when test="${not empty id && grade == 'A' }">
    		<input type='button' value='회원목록' onclick="mlist()">
    		<input type='button' value='계정삭제' onclick="deleteId()"> 	
    	</c:when>
    	<c:otherwise>
   			 <input type='button' value='패스워드 수정' onclick="updatePw()">
    		<input type='button' value='계정삭제' onclick="deleteId()"> 	
    	</c:otherwise>
    </c:choose>
  
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
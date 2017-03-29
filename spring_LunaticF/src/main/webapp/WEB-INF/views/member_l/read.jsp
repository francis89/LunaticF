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

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<h2 style="text-align: center;">${dto.username } 의 회원 정보</h2>
 <div class="container">
 	<div class="table-responsive">
		  <table class="table">
		    <tr>
		      <th>ID</th>
		      <td>${dto.id }</td>
		    </tr>
		    <tr>
		      <th>이름</th>
		      <td>${dto.username }</td>
		    </tr>
		    <tr>
		      <th>연락처</th>
		      <td>${dto.tel }</td>
		    </tr>
		    <tr>
		      <th>우편번호</th>
		      <td>${dto.zipcode }</td>
		    </tr>
		    <tr>
		      <th>주소</th>
		      <td>
		      		${dto.address1 }
		      		${dto.address2 }
		      </td>
		    </tr>
		    <tr>
		      <th>가입날짜</th>
		      <td>${dto.wdate }</td>
		    </tr>
		  
		  </table>
 	</div>
 </div>
  
  <DIV class='bottom' style="text-align: center; ">
    <input type='button' value='정보수정' onclick="update()">
    
    <c:choose>
    	<c:when test="${not empty id && grade == 'A' }">
    		<input type='button' value='회원목록' onclick="mlist()">
    	</c:when>
    	<c:when test="${not empty id }">
   			 <input type='button' value='패스워드 수정' onclick="updatePw()">
    		<input type='button' value='계정삭제' onclick="deleteId()"> 	
    	</c:when>
    </c:choose>
  
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
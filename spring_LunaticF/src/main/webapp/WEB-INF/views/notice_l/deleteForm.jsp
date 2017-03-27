<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
 
<DIV class="title">삭제</DIV>
 
<DIV class='content'> 

		<FORM name='frm' method='POST' action='./delete' >
  			<input type='hidden' name='noticeno' size='30' value='${param.noticeno }'>
  			<input type='hidden' name='col' size='30' value='${param.col }'>
  			<input type='hidden' name='word' size='30' value='${param.word }'>
  			<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
  			삭제하면 복구 할 수 없습니다 <br><br>
  
  			<DIV class='bottom'>
  		 		 <input type='submit' value='삭제'>
   				 <input type='button' value='취소' onclick="history.back();">
   				 <input type='button' value='목록으로' onclick='history.go(-2)'>
  			</DIV>
		</FORM>
	


</DIV>

 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
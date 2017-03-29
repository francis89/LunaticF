<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<body>
 
	<h2 style="text-align: center;">삭제</h2>
	 
	<div class='container'> 
	
			<form name='frm' method='POST' action='./delete' >
	  			<input type='hidden' name='noticeno' size='30' value='${param.noticeno }'>
	  			<input type='hidden' name='col' size='30' value='${param.col }'>
	  			<input type='hidden' name='word' size='30' value='${param.word }'>
	  			<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
	  			<h3 style="text-align: center;">삭제하면 복구 할 수 없습니다 </h3> 
	  			<br>
	  
	  			<DIV class='bottom' style="text-align: center;">
	  		 		 <input type='submit' value='삭제'>
	   				 <input type='button' value='취소' onclick="history.back();">
	   				 <input type='button' value='목록으로' onclick='history.go(-2)'>
	  			</DIV>
			</form>
	
	</div>
</body>
</html> 
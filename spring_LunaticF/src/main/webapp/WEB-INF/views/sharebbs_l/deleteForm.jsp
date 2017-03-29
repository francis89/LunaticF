<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>나눔장터 게시판 삭제</title> 
</head> 
<body>
	<h2 style="text-align: center;">삭제</h2>
	 
	<div class='container'>
	
		<form name='frm' method='POST' action='./delete' >
		  	<input type='hidden' name='shareno' size='30' value='${param.shareno}'>
		  	<input type='hidden' name='col' size='30' value='${param.col}'>
		  	<input type='hidden' name='word' size='30' value='${param.word}'>
		  	<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
		  	<input type='hidden' name='oldfile' size='30' value='${param.oldfile}'>

		  	삭제하면 복구 할 수 없습니다 <br><br>

		  <DIV class='bottom' style="text-align: center;">
		    <input class="button" type='submit' value='삭제'>
		    <input class="button" type='button' value='취소' onclick="history.back();">
		  </DIV>

		</form>
	</div>
</body>
</html> 
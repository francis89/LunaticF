<%@ page contentType="text/html; charset=UTF-8" %> 



<!DOCTYPE html> 
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<script type="text/javascript">
function mlist(){
	var url = "list";
	url += "?col=${param.col}";
    url += "&word=${param.word}";
    url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function incheck(f){
	if(f.mpasswd.value==""){
		alert("패스워드를 입력하세요");
		f.mpasswd.focus();
		return false;
	}
}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 

<div class="title">삭제 확인</div>
<form name="frm" method='POST' action='./delete' onsubmit="return incheck(this)">
<input type="hidden" name='memono' size='30' value='${dto.memono}'> 
<input type='hidden' name='col' size='30' value='${param.col}'>
<input type='hidden' name='word' size='30' value='${param.word}'>
<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
<div class="content">
삭제를 하면 복구 될 수 없습니다.<br><br>
			<TABLE>
    			<tr>
				<th>비밀번호</th>
				<td><input type="password" name='mpasswd' rows='10' cols='30'></td>
				</tr>	
  			</TABLE>
  
<input type='submit' value='삭제'>
<input type='button' value='목록' onclick="mlist()">

</div>
</form>

</body> 
</html> 






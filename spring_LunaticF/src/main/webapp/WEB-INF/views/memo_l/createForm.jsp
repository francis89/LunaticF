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
function input(frm){
	if(frm.title.value==""){
		alert("제목 넣어라");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용 넣어라");
		frm.content.focus();
		return false;
	}
	
}

</script>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css"> 
</head> 
<body> 

<div class="title">등록</div>
<form name="frm" method="POST" action="./create"
onsubmit="return input(this)">
<table>
<tr>
	<th>제목</th>
	<td>
	<input type='text' name='mtitle' size='30'>
	</td>
</tr>
<tr>
	<th>닉네임</th>
	<td>
	<input type='text' name='mnick' size='10'>
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
	<textarea name='mcontent' rows='10' cols='30' ></textarea>
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>
	<input type='text' name='mpasswd' size='10'>
	</td>
</tr>

</table>

<div class="bottom">
<input type='submit' value='전송'>
</div>
</form>

</body> 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="spring.model.memo_l.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function input(frm){
	if(frm.mtitle.value==""){
		alert("제목 넣어라");
		frm.mtitle.focus();
		return false;
	}
	if(frm.mcontent.value==""){
		alert("내용 넣어라");
		frm.mcontent.focus();
		return false;
	}
	if(f.mpasswd.value==""){
		alert("비밀번호을 입력하세요");
		f.mpasswd.focus();
		return false;
	}
	
}
</script>
</head> 
<body> 

<h2 style="text-align: center;"> 수정 </h2>

<div class="container">
	<form 
		name='frm' 
		method='POST' 
		action='./update'
		onsubmit="return input(this)" >
	
		<input type="hidden" name='memono' size='30' value='${dto.memono}'>
		<input type='hidden' name='col' size='30' value='${param.col}'>
		<input type='hidden' name='word' size='30' value='${param.word}'>
		<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
		<div class="table-responsive">
			<table class="table">
				<tr>
					<th>제목</th>
					<td><input type="text" name='mtitle' size='30' value="${dto.mtitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name='mcontent' rows='10' cols='30'>${dto.mcontent}</textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name='mpasswd' rows='10' cols='30'></td>
				</tr>
			
			</table>
		</div>
		<div class="bottom" style="text-align: center;">
		<input type="submit" value="등록">
		</div>
	</form>
</div>

</body> 
</html> 


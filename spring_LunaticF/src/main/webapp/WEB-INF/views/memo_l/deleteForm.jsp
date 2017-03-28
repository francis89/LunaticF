<%@ page contentType="text/html; charset=UTF-8" %> 



<!DOCTYPE html> 
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
</head> 
<body> 

<div class="container">
	<form name="frm" method='POST' action='./delete' onsubmit="return incheck(this)">
	<input type="hidden" name='memono' size='30' value='${dto.memono}'> 
	<input type='hidden' name='col' size='30' value='${param.col}'>
	<input type='hidden' name='word' size='30' value='${param.word}'>
	<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
	<h3 style="text-align: center;">삭제 하면 복구 할 수 없습니다.</h3>
	<br><br>
	<div class="table-responsive">
				<table class="table">
	    			<tr>
						<th>비밀번호</th>
						<td><input type="password" name='mpasswd' rows='10' cols='30'></td>
					</tr>	
	  			</table>
	  			<div class="bottom" style="text-align: center;">
				<input type='submit' value='삭제'>
				<input type='button' value='목록' onclick="mlist()">
	  			</div>
	
	</div>
	</form>
</div>

</body> 
</html> 






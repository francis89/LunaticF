<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
</head> 
<body> 

<h2 style="text-align: center;">등록</h2>

<div class="container">
	<form name="frm" method="POST" action="./create"
	onsubmit="return input(this)">
		<div class="table-responsive" style="margin: auto;">
			<table class="table" >
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
		</div>
	
		<div class="bottom" style="text-align: center;">
			<input type='submit' value='전송'>
		</div>
	</form>
</div>

</body> 
</html> 
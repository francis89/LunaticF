<%@ page contentType="text/html; charset=UTF-8" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function inCheck(f){
	if(f.passwd.value == ""){
		alert("패스워드를 입력하세요");
		f.passwd.focus();
		return false;
	} 
	if(f.repasswd.value==""){
		alert("패스워드확인을 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.passwd.value != f.repasswd.value){
		alert("일치 하지 않는다 다시해라");
		f.passwd.focus();
		return false;
	}
}


</script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<h2 style="text-align: center;">패스워드 변경</h2>
<div class="container">

	<form name='frm' 
		  method='POST' 
		  action='./updatePw'
		  onsubmit="return inCheck(this)">
	<input type="hidden" name="id" value="${param.id }">
		<div class="table-responsive">
		  <table class="table">
		    <tr>
		      <th>패스워드</th>
		      <td><input type="password" name="passwd"></td>
		    </tr>
		    <tr>
		      <th>패스워드 확인</th>
		      <td><input type="password" name="repasswd"></td>
		    </tr>
		  </table>
		</div>	
		
		<DIV class='bottom' style="text-align: center;">
		    <input type='submit' value='패스워드 수정'>
		    <input type='button' value='취소' onclick="history.back()">
		</DIV>
 
</form>
</div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
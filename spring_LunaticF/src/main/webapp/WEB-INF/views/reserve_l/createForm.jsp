<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css"> 
*{ 
  font-size: 20px; 
} 
</style>
<script type="text/javascript">
function incheck(f) {
	if(f.retitle.value=="") {
		alert("제목을 입력하세요");
		f.retitle.focus();
		return false;
	}
	
	if(f.recontent.value=="") {
		alert("내용을 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.reterm.value=="") {
		alert("날짜를 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.restate.value=="") {
		alert("장소를 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.retimnum.value=="") {
		alert("인원을 입력하세요");
		f.recontent.focus();
		return false;
	}
}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<DIV class="title">등록</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="retitle" size="40"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
		<textarea rows="10" cols="40" name="recontent"></textarea>
      </TD>
      <tr>
      <TH>예약날짜</TH>
      <TD><input type="text" name="reterm"></TD>
    </TR>
    <TR>
      <TH>장소</TH>
      <TD><input type="text" name="restate"></TD>
    </TR>
    <TR>
      <TH>인원</TH>
      <TD><input type="text" name="retimnum"></TD>
    </TR>
    <TR>
      <TH>id</TH>
      <TD><input type="text" name="id"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' class="button" >
    <input type='button' value='취소' class="button" onclick="history.back()">
  </DIV>
</FORM>
</body>
</html>
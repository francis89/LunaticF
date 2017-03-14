<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">

function incheck(f) {
	if(f.retitle.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.recontent.value==""){
		alert("내용을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.reterm.value==""){
		alert("날짜를 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.retimnum.value==""){
		alert("인원을 입력하세요");
		f.title.focus();
		return false;
	}
}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./update' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
	<input type='hidden' name='reserveno' size='30' value='${dto.reserveno}'>
	<input type='hidden' name='col' size='30' value='${param.col}'>
	<input type='hidden' name='word' size='30' value='${param.word}'>
	<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
  <TABLE class='table'>
     <TR>
      <TH>제목</TH>
      <TD><input type='text' name='retitle' size='40' value='${dto.retitle}'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='recontent' rows='10' cols='40'>${dto.recontent}</TEXTAREA></TD>
    </TR>
    <TR>
      <TH>예약날짜</TH>
      <TD><input type='text' name='reterm' size='40' value='${dto.reterm}'></TD>
    </TR>
    <TR>
      <TH>인원</TH>
      <TD><input type='text' name='retimnum' size='40' value='${dto.retimnum}'></TD>
    </TR>
  </TABLE>
 
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back();"> 
</Form>
</body>
</html> 
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
		f.reterm.focus();
		return false;
	}
	
	if(f.restate.value=="") {
		alert("장소를 입력하세요");
		f.restate.focus();
		return false;
	}
	
	if(f.retimnum.value=="") {
		alert("인원을 입력하세요");
		f.retimnum.focus();
		return false;
	}
}
</script> 
</head>
<body>
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./reply' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
  <!-- 답변을 등록하기 위해서 -->
  <input type='hidden' name='grpno'   value='${dto.grpno}'> 
  <input type='hidden' name='indent'  value='${dto.indent}'> 
  <input type='hidden' name='ansnum'  value='${dto.ansnum}'> 
  <!-- 페이지와 검색유지를 위해서 -->
  <input type='hidden' name='col'     value='${param.col}'>
  <input type='hidden' name='word'    value='${param.word}'>
  <input type='hidden' name='nowPage' value='${param.nowPage}'>
  <!-- 부모글 삭제를 막기위해서 -->
  <input type='hidden' name='reserveno' value='${param.reserveno}'>
  <input type="hidden" name="id" value="${sessionScope.id}">
  <!-- Form에서 입력값을 넘겨주기위해 -->
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
      <TD><input type="text" name="reterm" value="${dto.reterm }"></TD>
    </TR>
    <TR>
      <TH>장소</TH>
      <TD><input type="text" name="restate" value="${dto.restate }"></TD>
    </TR>
    <TR>
      <TH>인원</TH>
      <TD><input type="text" name="retimnum" value="${dto.retimnum }"></TD>
    </TR>
  </TABLE>  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</body>
</html> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">

function incheck(f) {
	
	if(f.ntitle.value==""){
		alert("제목을 입력하세요");
		f.ntitle.focus();
		return false;
	}
	  // content: textarea name
    if (CKEDITOR.instances['ncontent'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['ncontent'].focus();
      return false;
    }
	
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('ncontent');
  };
</script>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./update' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
	<input type='hidden' name='noticeno' size='30' value='${dto.noticeno }'>
	<input type='hidden' name='col' size='30' value='${param.col }'>
	<input type='hidden' name='word' size='30' value='${param.word }'>
	<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
	<input type='hidden' name='id' size='30' value='${dto.id }'>
	
  <TABLE class='table'>
     <TR>
      <TH>제목</TH>
      <TD><input type='text' name='ntitle' size='40' value='${dto.ntitle }'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      	<TEXTAREA name='ncontent' id='ncontent' style="font-size:12; color:#000000;border:1px solid; width: 100%" rows="30">
      		${dto.ncontent}
      	</TEXTAREA>
      	</TD>
    </TR>

  </TABLE>
 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
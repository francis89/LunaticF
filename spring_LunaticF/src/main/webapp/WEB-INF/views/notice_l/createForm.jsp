<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">

function incheck(f) {

	if(f.ntitle.value==""){
		alert("제목을 입력하세요");
		f.ntitle.focus();
		return false;
	}
// 	if(f.content.value==""){
// 		alert("내용을 입력하세요");
// 		f.content.focus();
// 		return false;
// 	}
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
     CKEDITOR.replace('ncontent');  // <TEXTAREA>태그 id 값
  };
 </script> 
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
	  <input type="hidden" name="id" value="${sessionScope.id }">
  <TABLE>

    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="ntitle" size="40"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
		<textarea rows="10" cols="60" name="ncontent"></textarea>
      </TD>
    </TR>


  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' >
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
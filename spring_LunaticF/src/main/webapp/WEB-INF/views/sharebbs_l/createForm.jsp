<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>나눔게시판 글 생성</title> 

<style type="text/css"> 
input,textarea
{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 20px;
}
</style>

<script type="text/javascript">

function incheck(f) {
	
	if(f.shtitle.value==""){
		alert("제목을 입력하세요");
		f.shtitle.focus();
		return false;
	}
	
	if(f.shcategory.value==""){
		alert("제품의 종류와 사이즈를 입력하세요");
		f.shcategory.focus();
		return false;
	}
	
	if (CKEDITOR.instances['shcontent'].getData() == '') {
	  window.alert('내용을 입력해 주세요.');
	  CKEDITOR.instances['shcontent'].focus();
	  return false;
	}
}
</script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('shcontent');  // <TEXTAREA>태그 id 값
  };
</script> 
 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">

</head> 

<body>
 
<DIV class="title">게시글 등록</DIV>
 
<FORM name='frm' 
			method='POST' 
			action='./create' 
			onsubmit="return incheck(this)"
			enctype="multipart/form-data">
  
  <TABLE>
    
    <TR>
      <TH>작성자</TH>
      <TD class="createtd" colspan="8">
    <input value="${sessionScope.id}" name="id">
      </TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD class="createtd" colspan="8">
    <input type="text" name="shtitle" size="40">
    	</TD>
    </TR>

		<tr>  
			<th>제품 종류 / 사이즈</th>
    	<td class="createtd">
				<input type="text" name="shcategory" size="20" placeholder="제품 종류 / 사이즈">
		 </td>
    </tr>
    
    <TR>
      <TH>내용</TH>
      <TD class="createtd" colspan="8">
		<textarea rows='20' cols='1000' name="shcontent"></textarea>
      </TD>
    </TR>
    
    <TR>
      <TH>이미지등록</TH>
      <TD><input type="file" name="fileMF" size="40"></TD>
    </TR>
    
  </TABLE>
  
  <br>
  
  <DIV class="bottom">
    <input type='submit' value='등록' class="button" >
    <input type='button' value='취소' class="button" onclick="history.back()">
  </DIV>

</FORM>
</body>
</html> 
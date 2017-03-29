<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
</head> 
<body>
	 
	<h2 style="text-align: center;">수정</h2>
	<div class="container">
		<form name='frm' 
			  method='POST' 
			  action='./update' 
			  onsubmit="return incheck(this)"
			  enctype="multipart/form-data">
			<input type='hidden' name='noticeno' size='30' value='${dto.noticeno }'>
			<input type='hidden' name='col' size='30' value='${param.col }'>
			<input type='hidden' name='word' size='30' value='${param.word }'>
			<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>
			<input type='hidden' name='id' size='30' value='${dto.id }'>
			<div class="table-responsive">
			  <table class='table'>
			     <tr>
				      <th>제목</th>
				      <td>
				      	<input type='text' name='ntitle' size='40' value='${dto.ntitle }'>
				      </td>
			    </tr>
			    <tr>
				      <th>내용</th>
				      <td>
				      	<TEXTAREA name='ncontent' id='ncontent' >
				      		${dto.ncontent}
				      	</TEXTAREA>
				      </td>
			    </tr>
			
			  </table>
			</div>
		 
		  <DIV class="bottom" style='text-align: center; '>
		    <input type='submit' value='전송'>
		    <input type='button' value='취소' onclick="history.back();"> 
		  </DIV>  
		</form>
	</div>
</body>
</html> 
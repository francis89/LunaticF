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
</head> 
<body>
	 
	<h2 style="text-align: center;">등록</h2>
	<div class=container>
		<FORM name='frm' 
			  method='POST' 
			  action='./create' 
			  onsubmit="return incheck(this)"
			  enctype="multipart/form-data">
			  <input type="hidden" name="id" value="${sessionScope.id }">
				<div class="table-responsive">
				  <table class="table">
				    <tr>
				      <th>제목</th>
				      <td><input type="text" name="ntitle" size="40"></td>
				    </tr>
				    <tr>
				      <th>내용</th>
				      <td>
						<textarea rows="10" cols="60" name="ncontent"></textarea>
				      </td>
				    </tr>
				  </table>
				</div>
	
				  <DIV class='bottom' style="text-align: center;">
				    <input type='submit' value='등록' >
				    <input type='button' value='취소' onclick="history.back()">
				  </DIV>
		</FORM>
	</div>
	 
</body>
</html> 
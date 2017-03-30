<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>나눔게시판 글 생성</title> 
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
</head> 
<body>
	<h2 style="text-align: center;">글 등록</h2>
	<div class="container">
		<form name='frm' 
					method='POST' 
					action='./create' 
					onsubmit="return incheck(this)"
					enctype="multipart/form-data">
					<input type="hidden" value="${sessionScope.id}" name="id" >
		  <div class="table-responsive">
			  <table class="table">
			    <tr>
			      <th>작성자</th>
			      <td colspan="8">
			    	<input type="text" value="${sessionScope.id}" name="id" disabled="disabled">
			      </td>
			    </tr>
			    
			    <tr>
			      <th>제목</th>
			      <td colspan="8">
			    	<input type="text" name="shtitle" size="40">
			      </td>
			    </tr>
				<tr>  
					<th>제품 종류 / 사이즈</th>
			    	<td>
						<input type="text" name="shcategory" size="20" placeholder="제품 종류 /사이즈">
					 </td>
			    </tr>
			    <tr>
				    <th>내용</th>
				    <td colspan="8">
						<textarea rows='20' cols='1000' name="shcontent"></textarea>
				    </td>
			    </tr>
			  </table>
		  </div>
		  
		  <DIV class="bottom" style="text-align: center;">
		    <input type='submit' value='등록' class="button" >
		    <input type='button' value='취소' class="button" onclick="history.back()">
		  </DIV>
		
		</form>
	</div>
</body>
</html> 
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATEFORM</title>

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

	<h2 style="text-align: center;">게시글 수정</h2>
	<div class="container">
		<form name='frm' 
					method='POST' 
					action='./update'
					onsubmit="return incheck(this)" 
					enctype="multipart/form-data">
	
			<input type='hidden' name='shareno' size='30' value='${dto.shareno}'>
			<input type='hidden' name='col' size='30' value='${param.col}'>
			<input type='hidden' name='word' size='30' value='${param.word}'>
			<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
			
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>작성자</th>
						<td>
							<input type='text' name='id' size='40' value='${dto.id}'>
						</td>
					</tr>
					
					<tr>
						<th>제목</th>
						<td>
							<input type='text' name='shtitle' size='40' value='${dto.shtitle}'>
						</td>
					</tr>
					
					<tr>
						<th>제품 종류 / 사이즈</th>
						<td>
							<input type="text" name="shcategory" size="20" placeholder="제품 종류 / 사이즈">
						</td>
					</tr>
			
					<tr>
						<th>내용</th>
						<td>
							<TEXTAREA name='shcontent' rows='10' cols='100'>${dto.shcontent}</TEXTAREA>
						</td>
					</tr>
					
				</table>
			</div>
			
			<br>
			<DIV class="bottom" style="text-align: center;">
				<input type='submit' value='전송'> 
				<input type='button' value='취소' onclick="history.back();">
			</DIV>
		</form>

	</div>
</body>
</html>

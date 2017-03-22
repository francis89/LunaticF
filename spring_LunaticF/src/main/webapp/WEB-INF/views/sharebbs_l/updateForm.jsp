<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REPLY UPDATEFORM</title>

<style type="text/css">
input, textarea {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 20px;
}
</style>

<script type="text/javascript">
	function incheck(f) {
		if (f.id.value == "") {
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if (f.shtitle.value == "") {
			alert("제목을 입력하세요");
			f.shtitle.focus();
			return false;
		}
		  // content: textarea name
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

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="Stylesheet" type="text/css">
</head>

<body>

	<DIV class="title">게시글 수정</DIV>

	<FORM name='frm' 
				method='POST' 
				action='./update'
				onsubmit="return incheck(this)" 
				enctype="multipart/form-data">

		<input type='hidden' name='shareno' size='30' value='${dto.shareno}'>
		<input type='hidden' name='col' size='30' value='${param.col}'>
		<input type='hidden' name='word' size='30' value='${param.word}'>
		<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
		<input type='hidden' name='oldfile' size='30' value='${dto.filename}'>
		
<TABLE>
			
		<TR>
			<TH>작성자</TH>
			<TD class="createtd">
	<input type='text' name='id' size='40' value='${dto.id}'>
			</TD>
		</TR>
		
		<TR>
			<TH>제목</TH>
			<TD class="createtd">
	<input type='text' name='shtitle' size='40' value='${dto.shtitle}'>
			</TD>
		</TR>
		
		<tr>
			<th>제품 종류 / 사이즈</th>
			<td class="createtd">
	<input type="text" name="shcategory" size="20" 
			placeholder="제품 종류 / 사이즈">
			</td>
		</tr>

		<TR>
			<TH>내용</TH>
			<TD class="createtd">
	<TEXTAREA name='shcontent' rows='10' cols='100'>${dto.shcontent}</TEXTAREA>
			</TD>
		</TR>
		
		<TR>
     	<TH>이미지등록</TH>
     	<TD class="createtd">
   <input type="file" name="fileMF" size="40">(${dto.filename})
   		</TD>
   	</TR> 
		
</TABLE>
		
		<br>
		<DIV class="bottom">
			<input class="button" type='submit' value='전송'> <input
				class="button" type='button' value='취소' onclick="history.back();">
		</DIV>
	</Form>

</body>
</html>

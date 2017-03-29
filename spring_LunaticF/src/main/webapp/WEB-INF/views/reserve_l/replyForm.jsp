<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	 
	<h2 style="text-align: center;">답변</h2>
	<div class="container">
		<form name='frm' 
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
		  <div class="table-responsive">
			 <table class="table">
			    <tr>
			      <th>제목</th>
			      <td>
			      	<input type="text" name="retitle" size="40">
			      </td>
			    </tr>
			    <tr>
			      <th>내용</th>
			      <td>
					<textarea rows="10" cols="40" name="recontent"></textarea>
			      </td>
			    </tr>
			    <tr>
			      <th>예약날짜</th>
			      <td><input type="text" name="reterm" value="${dto.reterm }"></td>
			    </tr>
			    <tr>
			      <th>장소</th>
			      <td><input type="text" name="restate" value="${dto.restate }"></td>
			    </tr>
			    <tr>
			      <th>인원</th>
			      <td><input type="text" name="retimnum" value="${dto.retimnum }"></td>
			    </tr>
			  </table>  
		  </div>
		  <DIV class='bottom' style="text-align: center;">
		    <input type='submit' value='등록'>
		    <input type='button' value='취소' onclick="history.back()">
		  </DIV>
		</form>
	</div>
</body>
</html> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function rlist(){
	var url = "list";
	url += "?col=${param.col}";
    url += "&word=${param.word}";
    url += "&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
</head>
<body> 
	<h2 style="text-align: center;">삭제 확인</h2>
	<div class="container">
		<c:choose>
			<c:when test="${flag }">
				답변 있는 글이므로 삭제 할 수 없습니다.<br>
				<input type='button' value='목록으로' onclick='history.go(-2)'>
			</c:when>
			<c:otherwise>
				<form name="frm" method='POST' action='./delete'>
				<input type="hidden" name='reserveno' size='30' value='${param.reserveno}'>
				<input type='hidden' name='col' size='30' value='${param.col}'>
				<input type='hidden' name='word' size='30' value='${param.word}'>
				<input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
					<div class="recontent">
						삭제를 하면 복구 될 수 없습니다.<br><br>
						삭제를 하시려면 삭제 처리 버튼을 클릭하세요.<br><br>
						취소는 '목록' 버튼을 누르세요.<br><br>
						<input type='submit' value='삭제 처리'>
						<input type='button' value='목록' onclick="rlist()">
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</body> 
</html> 
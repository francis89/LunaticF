<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html> 
<head> 
<title>나눔게시판 읽기</title> 
<style type="text/css">
.rcreate {
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	color: #000000; /* 글자 색깔 */
	width: 40%; /* 화면의 30% */
	padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
	/* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
	/* padding-top: 30px;  상단만 간격을 30px 지정   */
	margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

.rlist {
	line-height: 1.2em;
	font-size: 15px;
	font-weight: bold;
	text-align: left;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	color: #000000; /* 글자 색깔 */
	width: 35%; /* 화면의 30% */
	padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
	/* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
	/* padding-top: 30px;  상단만 간격을 30px 지정   */
	margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

hr {
	text-align: center;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	width: 45%; /* 화면의 30% */
}
</style>

<script type="text/javascript">
	function bupdate(){
		var url = "update";
		url += "?shareno=${dto.shareno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	
	function bdelete(){
		var url = "delete";
		url += "?shareno=${dto.shareno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	
	function blist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
	
	
	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "${pageContext.request.contextPath }/member_l/login";
				url = url + "?no=${dto.shareno}";
				url = url + "&type=shareno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "${pageContext.request.contextPath }/member_l/login";
				url = url + "?no=${dto.shareno}";
				url = url + "&type=shareno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.shrcontent.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.shrcontent.focus();
			return false;
		}
	}
	
	
	function rupdate(shrnum, shrcontent) {
		var f = document.rform;
		f.shrcontent.value = shrcontent;
		f.shrnum.value = shrnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	
	function rdelete(shrnum) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?shrnum=" + shrnum;
			url = url + "&shareno=${dto.shareno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
</script>
</head> 
<body>
	 
	<h2 style="text-align: center;">조회</h2>
	<div class="container">
		<div class="table-responsive">
			  <table class="table">
				  <tr>
				    <th>제목</th>
				    <td>${dto.shtitle}</td>
				  </tr>
				  
				  <tr>
				    <th style="width: 30%">작성자</th>
				    <td>${dto.id}</td>
				  </tr>
				
				  <tr>
				    <th style="width: 30%">종류 및 사이즈</th>
				    <td>${dto.shcategory}</td>
				  </tr>
				  
				  <tr>
				    <td colspan="2">${dto.shcontent}</td>
				  </tr>
				  
				  <tr>
				    <th style="width: 40%">조회수</th>
				    <td>${dto.shviewcnt}</td>
				  </tr>
				  <tr>
				  
				    <th style="width: 40%">등록일</th>
				    <td>${fn:substring(dto.shdate,0, 10)}</td>
				  </tr>
			 </table>
		</div>
		<br>
		<DIV class="bottom" style="text-align: center;">
			<c:if test="${not empty sessionScope.id && (sessionScope.id==dto.id)}">
				<input class="button" type="button" value="수정" onclick="bupdate()">
				<input class="button" type="button" value="삭제" onclick="bdelete()">
			</c:if>
				<input class="button" type="button" value="목록" onclick="blist()">
		</DIV>
		<hr>
			<c:forEach var="rdto" items="${rlist}">
				<div class="rlist">
					${rdto.id}<br />
					<p>${rdto.shrcontent}</p>
					${rdto.shrregdate}
					<c:if test="${sessionScope.id==rdto.id }">
						<span style="float: right;"> 
						<a href="javascript:rupdate('${rdto.shrnum}','${rdto.shrcontent }')">
								수정</a>|<a href="javascript:rdelete('${rdto.shrnum}')">삭제</a>
						</span>
					</c:if>
				</div>
			</c:forEach>
		<div class="rcreate" style="text-align: center;">
				<form name="rform" action="./rcreate" method="post"
					onsubmit="return input(this)">
					<textarea rows="3" cols="28" name="shrcontent" onclick="rcheck(this)"></textarea>
					<br>
					<input type="submit" name="rsubmit" value="등록"> 
					<input type="hidden" name="shareno" value="${dto.shareno}"> 
					<input type="hidden" name="id" value="${sessionScope.id}"> 
					<input type="hidden" name="nowPage" value="${param.nowPage}"> 
					<input type="hidden" name="nPage" value="${nPage}"> 
					<input type="hidden" name="col" value="${param.col}"> 
					<input type="hidden" name="word" value="${param.word}"> 
					<input type="hidden" name="shrnum" value="0">
		
				</form>
		</div>
		<DIV class="bottom" style="text-align: center;">
			${paging}
		</DIV>
 
	</div>
</body>
</html> 
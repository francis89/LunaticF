<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<style type="text/css">
.rcreate {
	font-size: 20px;
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
	function bcreate() {
		var url = "create";
		location.href = url;
	}

	function bupdate() {
		var url = "update";
		url += "?noticeno=${dto.noticeno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function bdelete() {
		var url = "delete";
		url += "?noticeno=${dto.noticeno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}


	function blist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}


	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member_l/login";
				url = url + "?no=${dto.noticeno}";
				url = url + "&type=noticeno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&bflag=../notice_l/read";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member_l/login";
				url = url + "?no=${dto.noticeno}";
				url = url + "&type=noticeno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&bflag=../notice_l/read";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.nrcontent.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	function rupdate(nreplyno, nrcontent) {
		var f = document.rform;
		f.nrcontent.value = nrcontent;
		f.nreplyno.value = nreplyno;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	function rdelete(nreplyno) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?nreplyno=" + nreplyno;
			url = url + "&noticeno=${dto.noticeno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
</script>
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>

	<TABLE style="width: 60%; padding: 20px;">
		<TR>
			<TH>제목</TH>
			<TD>${dto.ntitle }</TD>
		</TR>
		<TR>
			<TD colspan="2" class='td'>${dto.ncontent }</TD>
		</TR>
		<TR>
			<TH>I D</TH>
			<TD>${dto.id }</TD>
		</TR>

		<TR>
			<TH>조회수</TH>
			<TD>${dto.nviewcnt }</TD>
		</TR>
		<TR>
			<TH>등록일</TH>
			<TD>${fn:substring(dto.ndate, 0, 10) }</TD>
		</TR>

	</TABLE>

	<div class="bottom">
	<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
		<input type="button" value="목록" onclick="blist()"> 
		<input type="button" value="수정" onclick="bupdate()"> 
		<input type="button" value="삭제" onclick="bdelete()"> 
	</c:if>
		<input type="button" value="등록" onclick="bcreate()"> 
	</div>

	<hr>
	<c:forEach var="rdto" items="${rlist}">
		<div class="rlist">
			${rdto.id}<br />
			<p>${rdto.nrcontent}</p>
			${rdto.nrdate}
			<c:if test="${sessionScope.id==rdto.id }">
				<span style="float: right;"> <a
					href="javascript:rupdate('${rdto.nreplyno}','${rdto.nrcontent }')">
						수정</a>|<a href="javascript:rdelete('${rdto.nreplyno}')">삭제</a>
				</span>
			</c:if>
		</div>
	</c:forEach>
	<div class="rcreate">
		<form name="rform" action="./rcreate" method="post"
			onsubmit="return input(this)">
			<textarea rows="3" cols="28" name="nrcontent" onclick="rcheck(this)"></textarea>
			<br>
			<input type="submit" name="rsubmit" value="등록"> 
			<input type="hidden" name="noticeno" value="${dto.noticeno}"> 
			<input type="hidden" name="id" value="${sessionScope.id}"> 
			<input type="hidden" name="nowPage" value="${param.nowPage}"> 
			<input type="hidden" name="nPage" value="${nPage}"> 
			<input type="hidden" name="col" value="${param.col}"> 
			<input type="hidden" name="word" value="${param.word}"> 
			<input type="hidden" name="nreplyno" value="0">


		</form>
	</div>
	<div class="bottom">${paging}</div>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html> 
<html> 
<head> 
<title>나눔게시판 읽기</title> 

<style type="text/css"> 
input,textarea
{
	margin: 0;
	padding: 0;
	border: 0;
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
		url += "&oldfile=${dto.filename}";
		location.href = url;
	}
	
	function blist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href=url;
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

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>
 
<DIV class="title">조회</DIV>
  <TABLE>
  
  <TR>
  	<TD colspan="2">
  <img src="${pageContext.request.contextPath}/imgbbs/storage/${dto.filename}" style=" width: 400px; height: 350px;">
    </TD>
 	</TR>
  
  <TR>
    <TH style="width: 40%">제목</TH>
    <TD>${dto.shtitle}</TD>
  </TR>
  
  <TR>
    <TH style="width: 40%">작성자</TH>
    <TD>${dto.id}</TD>
  </TR>

  <TR>
    <TH style="width: 40%">종류 및 사이즈</TH>
    <TD>${dto.shcategory}</TD>
  </TR>
  
  <TR>
    <TH style="width: 40%">내용</TH>
    <TD>${dto.shcontent}</TD>
  </TR>
  
  <TR>
    <TH style="width: 40%">조회수</TH>
    <TD>${dto.shviewcnt}</TD>
  </TR>
  <TR>
  
    <TH style="width: 40%">등록일</TH>
    <TD>${fn:substring(dto.shdate,0, 10)}</TD>
  </TR>
  
</TABLE>
<br>

<div class="bottom">
	<input class="button" type="button" value="목록" onclick="blist()">
<c:if test="${not empty sessionScope.id && (sessionScope.id==dto.id)}">
	<input class="button" type="button" value="수정" onclick="bupdate()">
	<input class="button" type="button" value="삭제" onclick="bdelete()">
</c:if>
</div>

<!-- =============================================================== -->

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
	<div class="rcreate">
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
	<div class="bottom">${paging}</div>
	<!-- *********************************************** -->
 
</body>
</html> 
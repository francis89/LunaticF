<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*,spring.model.memo_l.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %> 



<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mcreate(){
	var url = "create";
	location.href=url;
	}
	function mupdate(memono){
	var url = "update";
	url += "?memono="+memono;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href=url;
	}
	function mdelete(memono){
		
		var url = "delete";
		url += "?memono="+memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href=url;
		
	}
	function mlist(){
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
	}

</script> 
</head> 
<body> 

<h2 style="text-align: center;">메모장</h2>

 <div class="search" style="text-align: center;"> 
	  <FORM method='post' action="./list"> 
	  <SELECT name='col'> <!-- 검색할 컬럼 -->
	    <OPTION value='title' <c:if test="${col=='mtitle'}">selected='selected'</c:if> >
	   			제 목</OPTION> 
	    <OPTION value='content' <c:if test="${col=='mcontent'}">selected='selected'</c:if> >
	    		내 용</OPTION> 
	    <OPTION value='total'>전체출력</OPTION> 
	  </SELECT> 
	  <input type='text' name='word' value='${word}'> <!-- 검색어 -->
	  <input type='submit' value='검색'> 
	  <input type='button' value='등록' onclick="location.href='./create'">
	  </FORM> 
</div>
<div class="container"> 
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>날짜</th>
					<th>닉네임</th>
					<th>조회수</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)==0 }">
						<tr>
							<td colspan='4'>등록된 메모가 없습니다.</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
					
					    <tr>
					      <td>${dto.memono}</td>         
					      <td>${dto.mtitle}
						      <c:if test="${util:newImg(fn:substring(dto.mdate,0,10))}">
						      	<img src="${pageContext.request.contextPath}/images/new.gif">
						      </c:if> 
					      </td>
					      <td>${dto.mcontent}</td>         
					      <td>${dto.mdate}</td>
					      <td>${dto.mnick}</td>
					      <td>${dto.mviewcnt}</td>
					      <td>
					      	<input type="button" value="수정" onclick="mupdate('${dto.memono}')">
							<input type="button" value="삭제" onclick="mdelete('${dto.memono}')">
					 	  </td>
					    </tr>
					    
					 	</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>


<div class="bottom" style="text-align: center;">
${paging}
<input type="button" value="등록" onclick="location.href='./create'">
</div>

</body> 
</html>


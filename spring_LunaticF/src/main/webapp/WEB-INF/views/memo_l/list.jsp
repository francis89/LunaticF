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
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style>
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
<link href="${pageContext.request.contextPath }/css/style2.css" rel="Stylesheet" type="text/css">
</head> 
<body> 

<div class="title">
메모목록
</div>
 <DIV class="search" align=center> 
  <FORM method='post' action="./list"> 
  <SELECT name='col'> <!-- 검색할 컬럼 -->
    <OPTION value='title'  
    <c:if test="${col=='mtitle'}">selected='selected'</c:if>
    >제 목</OPTION> 
    <OPTION value='content' <c:if test="${col=='mcontent'}">selected='selected'</c:if>
    >내 용</OPTION> 
    <OPTION value='total'>전체출력</OPTION> 
  </SELECT> 
  <input type='text' name='word' value='${word}'> <!-- 검색어 -->
  <input type='submit' value='검색'> 
  <input type='button' value='등록' onclick="location.href='./create'">
  </FORM> 
</DIV>
<div class='t3'> 
<table>
<tr>
<th class="ty2">번호</th>
<th class="ty2">제목</th>
<th class="ty2">내용</th>
<th class="ty2">날짜</th>
<th class="ty2">닉네임</th>
<th class="ty2">조회수</th>
<th class="ty2">수정/삭제</th>

</tr>
<c:choose>
<c:when test="${fn:length(list)==0 }">
<tr>
	<td colspan='4'>등록된 메모가 없습니다.</td>
</tr>
</c:when>
<c:otherwise>
	<c:forEach items="${list}" var="dto">

    <tr>
      <td class='ty1'>${dto.memono}</td>         
      <td class='ty1'>${dto.mtitle}
      <c:if test="${util:newImg(fn:substring(dto.mdate,0,10))}">
      <img src="${pageContext.request.contextPath}/images/new.gif">
      </c:if> 
      </td>
      <td class='ty1'>${dto.mcontent}</td>         
      <td class='ty1'>${dto.mdate}</td>
      <td class='ty1'>${dto.mnick}</td>
      <td class='ty1'>${dto.mviewcnt}</td>
      <td class='ty1'><input type="button" value="수정" onclick="mupdate('${dto.memono}')">
 					  <input type="button" value="삭제" onclick="mdelete('${dto.memono}')">
 					  </td>
      
    </tr>
    
 	</c:forEach>
</c:otherwise>
</c:choose>
</table>
</div>


<div class="bottom">
${paging}
<input type="button" value="등록" onclick="location.href='./create'">
</div>

</body> 
</html>


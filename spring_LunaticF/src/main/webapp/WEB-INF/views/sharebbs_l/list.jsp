<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>

<!-- IF 나 스코프를 사용하여 아이디가 있을경우 등록이 뜨게 할것.  -->
<!-- 아이디가 없으면 등록 버튼이 없음. -->

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>나눔장터 게시판</title> 

<script type="text/javascript">
	
	function read(shareno){
		var url = "read";
		url+="?shareno="+shareno;
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		location.href=url;
	}
	
</script>

<style type="text/css"> 

</style>

<link href="${pageContext.request.contextPath}/webapp/css/style.css" rel="Stylesheet" type="text/css">

</head> 

<body>

<DIV class='sharetitle'>나눔게시판 목록</DIV>
 
<TABLE class="sharetable">

  <TR class='menutr'>
  	<th style="text-align: center;">글번호</th>
    <TH style="text-align: center; width: 50%">제목</TH>
    <TH style="text-align: center;">작성자</TH>
    <TH style="text-align: center;">등록일</TH>
    <TH style="text-align: center;">조회수</TH>
  </TR>
  
<c:choose>
	<c:when test="${fn:length(list)==0}">
		
  <TR>
  	<TD colspan='8' align='center'>
  	등록된 글이 없습니다.</TD>
  </TR>
  
  </c:when>
  
	<c:otherwise>
		<c:forEach items="${list}" var="dto">
  <TR>
  	<TD>${dto.shareno}</TD>
    
    <TD class="listtd">
		<c:set var="rcount" value="${util:rcount(dto.shareno,sdao)}"/>
      <A href="javascript:read('${dto.shareno}')">
      ${dto.shtitle}
      <c:if test="${rcount>0}">
       <span style="color:red;">(${rcount})</span>
      </c:if>
      </A>
      <c:if test="${util:newImg(fn:substring(dto.shdate,0,10)) }">
    <img src="${pageContext.request.contextPath }/css/images/new.gif">  
    	</c:if>
    </TD>
    
    <TD>${dto.id}</TD>
    
		<td>${fn:substring(dto.shdate,0,10)}</td>
		
    <TD>${dto.shviewcnt}</TD>
    
	</TR>
		</c:forEach>
  </c:otherwise>
</c:choose>
</TABLE>

<br>

<div class="search">
<form method="post" action="./list">

<select name="col" class="searchselect">
	<option value="id"<c:if test="${col=='id'}">
	selected='selected'</c:if>>작성자 </option>
	<option value="shtitle"<c:if test="${col=='shtitle'}">
	selected='selected'</c:if>>제목 </option>
	<option value="shcontent"<c:if test="${col=='shcontent'}">
	selected='selected'</c:if>>내용 </option>
	<option value="shcategory"<c:if test="${col=='shcategory'}">
	selected='selected'</c:if>>종류/사이즈</option>
	<option value="total">전체출력 </option>
</select>

	<input type="text"   class="searchtext"   value="${word}" name="word"><!-- 검색어 -->
	<input type="submit" class="searchbutton" value="검색"><!-- 검색어 -->
	
	<c:if test="${not empty sessionScope.id}">
	<input type='button' class="searchbutton" value='등록' onclick="location.href='./create'">
	</c:if>
</form>
</div>
<br>
 
<DIV class='bottom'>
  ${paging}
</DIV>

</body>
</html> 
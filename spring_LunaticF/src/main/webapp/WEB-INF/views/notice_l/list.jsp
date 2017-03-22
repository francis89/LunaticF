<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  font-size: 20px; 
} 
.search{
	width: 80%;
	text-align: center;
	margin: 2px auto;
}
</style> 
<script type="text/javascript">
function read(noticeno) {
  var url = "read";
  	  url += "?noticeno=" + noticeno;
      url += "&col=${col}";
      url += "&word=${word}";
      url += "&nowPage=${nowPage}";
  
  location.href = url;
}

</script>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">


</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 <DIV class="container"> 
  <FORM method='post' action="./list"> 
	  <SELECT name='col'> <!-- 검색할 컬럼 -->
	    <option value="ntitle" <c:if test="${col=='ntitle'}"> selected='selected' </c:if>> 제목</option>
	    <option value="ncontent" <c:if test="${col=='ncontent'}"> selected='selected' </c:if>> 내용</option>
	    <option value="ndate" <c:if test="${col=='ndate'}"> selected='selected' </c:if>> 등록일</option>
	    <OPTION value='total'>전체출력</OPTION> 
	  </SELECT> 
	  <input type='text' name='word' value='${word }'> <!-- 검색어 -->
	  <input type='submit' value='검색'> 
  </FORM> 
 
 
 

 
 <h2><span class="glyphicon glyphicon-th-list"></span>게시판 목록</h2>
	<TABLE class="table">
   <TR>
    <TD>번호</TD>
    <TD>제목</TD>
    <TD>I D</TD>
    <TD>조회수</TD>
    <TD>등록일</TD>
    
  </TR>
  
  <c:choose>
  	<c:when test="${fn:length(list) == 0}">
    <TR>
      <TD colspan='8' align='center'>등록된 글이 없습니다.</TD>
    </TR>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${list}" var="dto">
  		
  			<TR>
		      <TD>${dto.noticeno }</TD>
		      <TH>
		      	
						<c:set var="rcount" value="${util:rcount(dto.noticeno,irdao) }"/>
		       				<a href="javascript:read('${dto.noticeno }')">${dto.ntitle }</a>
							<c:if test="${util:newImg(fn:substring(dto.ndate, 0, 10)) }">
						   		<img src="${pageContext.request.contextPath }/images/new.gif">
							</c:if>
          				<c:if test="${rcount>0 }">
            			<span style="color:red;">(${rcount})</span>
          </c:if>
		      </TH>
		      <TD>${dto.id }</TD>
		      <TD>${dto.nviewcnt }</TD>
		      <TD>${fn:substring(dto.ndate, 0, 10) }</TD>
		      
		    </TR>
		  		
		</c:forEach>
			<%--<c:forEach items="${list}" var="dto"> --%>
  	</c:otherwise>
  </c:choose>
 
  
  </TABLE>
  </DIV>
 <DIV class='bottom'>
  	${paging }
  	
  	<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
    	<input type='button' value='등록' onclick="location.href='./create'">
    </c:if>
    <input type='button' value='이전' onclick="location.href=history.back()">
 </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
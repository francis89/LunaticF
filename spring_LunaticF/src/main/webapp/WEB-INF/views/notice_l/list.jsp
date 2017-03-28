<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
</head> 
<body>
	<DIV class="search" style="text-align: center;"> 
	  <form method='post' action="./list"> 
		  <SELECT name='col'> <!-- 검색할 컬럼 -->
		    <option value="ntitle" <c:if test="${col=='ntitle'}"> selected='selected' </c:if>> 제목</option>
		    <option value="ncontent" <c:if test="${col=='ncontent'}"> selected='selected' </c:if>> 내용</option>
		    <option value="ndate" <c:if test="${col=='ndate'}"> selected='selected' </c:if>> 등록일</option>
		    <OPTION value='total'>전체출력</OPTION> 
		  </SELECT> 
		  <input type='text' name='word' value='${word }'> <!-- 검색어 -->
		  <input type='submit' value='검색'> 
	  </form> 
	</DIV>
	 
	<h2><span class="glyphicon glyphicon-th-list"></span>게시판 목록</h2>
	<div class="container">
		<div class="table-responsive">
			<table class="table">
				<tr>
				    <th>번호</th>
				    <th>제목</th>
				    <th>I D</th>
				    <th>조회수</th>
				    <th>등록일</th>
				    
				</tr>
			  
			  	<c:choose>
			  		<c:when test="${fn:length(list) == 0}">
			    		<tr>
			      			<td colspan='8' align='center'>등록된 글이 없습니다.</TD>
			    		</tr>
			  		</c:when>
			  	<c:otherwise>
			  	
			  		<c:forEach items="${list}" var="dto">
			  			<tr>
					      	<td>${dto.noticeno }</td>
					      	<td>
								<c:set var="rcount" value="${util:rcount(dto.noticeno,irdao) }"/>
					       			<a href="javascript:read('${dto.noticeno }')">${dto.ntitle }</a>
								<c:if test="${util:newImg(fn:substring(dto.ndate, 0, 10)) }">
									<img src="${pageContext.request.contextPath }/images/new.gif">
								</c:if>
			          			<c:if test="${rcount>0 }">
			            			<span style="color:red;">(${rcount})</span>
			          			</c:if>
					      </td>
					      <td>${dto.id }</td>
					      <td>${dto.nviewcnt }</td>
					      <td>${fn:substring(dto.ndate, 0, 10) }</td>
					    </tr>
					</c:forEach>
					
			  	</c:otherwise>
			  </c:choose>
			 
			</table>
		</div>
	</div>
	 <DIV class='bottom' style="text-align: center;">
	  	${paging }
	  	<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
	    	<input type='button' value='등록' onclick="location.href='./create'">
	    </c:if>
	    <input type='button' value='이전' onclick="location.href=history.back()">
	 </DIV>
	 
</body>
</html> 
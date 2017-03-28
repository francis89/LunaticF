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
</head> 
<body>
	
	<h2 style="text-align: center;">나눔게시판 목록</h2>
	<div class="container">
		<div class="table-responsive">
			<table class="table">
				<thead>
				  <tr>
				  	<th>글번호</th>
				    <th>제목</th>
				    <th>작성자</th>
				    <th>등록일</th>
				    <th>조회수</th>
				  </tr>
				</thead>
				<c:choose>
					<c:when test="${fn:length(list)==0}">
					  <tr>
					  	<td colspan='8' align='center'>
					  	등록된 글이 없습니다.</td>
					  </tr>
				   </c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
						  <tr>
						  	<td>${dto.shareno}</td>
						    
						    <td>
								<c:set var="rcount" value="${util:rcount(dto.shareno,sdao)}"/>
						      		<a href="javascript:read('${dto.shareno}')">
						     		 ${dto.shtitle}
						      	<c:if test="${rcount>0}">
						       		<span style="color:red;">(${rcount})</span>
						      	</c:if>
						      	</a>
						      	<c:if test="${util:newImg(fn:substring(dto.shdate,0,10)) }">
						    		<img src="${pageContext.request.contextPath }/css/images/new.gif">  
						    	</c:if>
						    </td>
						    
						    <td>${dto.id}</td>
						    
							<td>${fn:substring(dto.shdate,0,10)}</td>
								
						    <td>${dto.shviewcnt}</td>
						    
							</tr>
						 </c:forEach>
					  </c:otherwise>
				 </c:choose>
			</table>
		</div>
		
		<br>
		
		<div class="search" style="text-align: center;">
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
		 
		<DIV class='bottom' style="text-align: center;">
		 	${paging}
		</DIV>
	</div>
</body>
</html> 
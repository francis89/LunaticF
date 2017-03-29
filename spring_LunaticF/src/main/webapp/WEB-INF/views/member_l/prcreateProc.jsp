<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디</DIV>
 <DIV class="content">
 
 ${str }
 
 </DIV>

  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
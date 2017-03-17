<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../json/jquery.js"></script> 
<script type="text/javascript">
function read(i){
	//alert(memono);
	var url = "read";
	url += "?i="+i;
	location.href=url;
}
</script> 
<script type="text/javascript">
$(document).ready(function() {
    $.getJSON(
      "../json/SeoCho.json",
      response
  );
});
function response(result,textStatus){
	//alert('Call Back Call:'+result);
	$("#panel").append(
            "<TR>"+
            "<TH>번호</TH>"+
            "<TH>장소명</TH>"+
            "<TH>서비스명</TH>"+
            "<TH>서비스명</TH>"+
            "<TH>접수상태</TH>"+
            "</TR>"
	);
	
	var size = result.DATA.length;
	//alert('size: ' + size);
	var i = 0;
	
	for(i = 0; i < size; i++){
		$("#panel").append(                    
                "<TR>"+
                "<TD>"+(i+1)+"</TD>"+
                "<TD><a href='javascript:read("+i+")'>"+result.DATA[i].PLACENM+"</a></TD>"+
                "<TD>"+result.DATA[i].SVCNM+"</TD>"+
                "<TD>"+result.DATA[i].SVCSTATNM+"</TD>"+
                "<TD><a href='"+result.DATA[i].SVCURL+"'>"+result.DATA[i].SVCURL+"</a></TD>"+
                "</TR>"
            );
	}
}
</script>
</head>
<body>
	<TABLE id="panel"></TABLE>
</body>
</html>
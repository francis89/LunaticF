<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../json/jquery.js"></script>
<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=da246ae8b7c6b06cd80ebdbcac2b98ce&libraries=services"></script>
<script type="text/javascript">
$(document).ready(
		
function() {

    var x = "37.4730044433";
    var y = "126.9924890287";
    if(x != "" && x != "") {
        daumMap.setDiv("divMap");        
        daumMap.searchData.coords.lat = x;
        daumMap.searchData.coords.lng = y;
        daumMap.init();
        daumMap.create();        
    }

});
</script> 
</head>
<body>

</body>
</html>
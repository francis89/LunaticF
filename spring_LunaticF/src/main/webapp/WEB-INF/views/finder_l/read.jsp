<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../json/jquery.js"></script>
	<script type="text/javascript"
    src="//apis.daum.net/maps/maps3.js?apikey=da246ae8b7c6b06cd80ebdbcac2b98ce&libraries=services"></script>
<script type="text/javascript">
$(document).ready(function() {
    $.getJSON(
      "../json/${ida}.json",
      response
  );
});
function response(result,textStatus){
	//alert('Call Back Call:'+result);
	
	
	var size = result.DATA.length;
	//alert('size: ' + size);
	//var i = 0;
	
	var i = ${i};
	$("#panel").append(
				"<TR>"+
	                "<TH>서비스명</TH>"+
	                "<TD>"+result.DATA[i].SVCNM+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>소분류명</TH>"+
                	"<TD>"+result.DATA[i].MINCLASSNM+"</TD>"+
                "</TR>"+
                "<TR>"+
	                "<TH>장소명</TH>"+
	                "<TD>"+result.DATA[i].PLACENM+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>예약상태</TH>"+
                	"<TD>"+result.DATA[i].SVCSTATNM+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>접수종료일시</TH>"+
               		"<TD>"+result.DATA[i].RCPTENDDT+"</TD>"+
                "</TR>"+
               	"<TR>"+
	                "<TH>대상</TH>"+
	                "<TD>"+result.DATA[i].USETGTINFO+"</TD>"+
	            "</TR>"+
                "<TR>"+
	                "<TH>서비스 상태</TH>"+
	                "<TD>"+result.DATA[i].SVCSTATNM+"</TD>"+
	            "</TR>"+
                "<TR>"+
	                "<TH>URL</TH>"+
	                "<TD><a href='"+result.DATA[i].SVCURL+"'>"+result.DATA[i].SVCURL+"</a></TD>"+
	            "</TR>"
            ); 
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new daum.maps.LatLng(result.DATA[i].X, result.DATA[i].Y), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	//default x:37.5691675 y:126.9846888 종로 코아빌딩
	if(result.DATA[i].X==null || result.DATA[i].Y==null){
		/* result.DATA[i].X = 37.5694802;
		result.DATA[i].Y = 126.9859787; */
		$("#map").append(
				"<img src='${pageContext.request.contextPath}/images/default.jpg' style='width:400px;height:350px;'>"
				);
	} else {
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(result.DATA[i].X, result.DATA[i].Y); 
	
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		var iwContent = '<div style="font-size: 2px;">'+result.DATA[i].SVCNM+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new daum.maps.LatLng(result.DATA[i].X, result.DATA[i].Y); //인포윈도우 표시 위치입니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
		position : iwPosition, 
		content : iwContent 
		});
	
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	}
}
</script>

</head>

<body>
<table id="panel">
<tr>
		<td  colspan="2" align="center">
		
		<div id="map" style="width:400px;height:350px;"></div>
		
		</td>
</tr>
</table>
<input type='button' value='목록으로' class="button" onclick="history.back()">
</body>
</html>
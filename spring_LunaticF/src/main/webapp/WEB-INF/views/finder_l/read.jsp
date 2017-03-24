<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 TRansitional//EN" "http://www.w3.org/TR/html4/loose.dTD">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../json/jquery.js"></script>
	<script type="text/javascript" src="../json/seoul.json"></script>
<style type="text/css">
	TABLE{
	  margin: 0 auto;            /* 테이블 가운데 정렬 */
	  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
	  border-widTH: 1px;         /* 테이블 외곽선 두께 */ 
	  border-style: solid;       /* 테이블 외곽선 스타일 */
	  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
	 
	}
	 
	TH{
	  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
	  border-widTH: 1px;         /* 테이블 외곽선 두께 */ 
	  border-style: solid;       /* 테이블 외곽선 스타일 */
	 
	  color: black;            /* 글자 색 */ 
	  background-color: white; /* 배경 색 */
	  padding: 5px;              /* 셀 내부 간격 */
	}
	 
	 
	TD{
	  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
	  border-widTH: 1px;         /* 테이블 외곽선 두께 */ 
	  border-style: solid;       /* 테이블 외곽선 스타일 */
	 
	  color: #000000;            /* 글자 색 */ 
	  background-color: white; /* 배경 색 */
	  padding: 5px;              /* 셀 내부 간격 */  
	}
	 
	.input{
	  padding: 0px;
	  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
	  border-widTH: 1px;         /* 테이블 외곽선 두께 */ 
	  border-style: solid;       /* 테이블 외곽선 스타일 */
	 
	  border-top-style: none;
	  border-right-style: none;
	  border-left-style: none;
	  
	}
	 
	A:link {     /* A 태그의 링크 속성 */
	  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	  color: black;              /* 글자색깔 검정 */
	}
	 
	A:hover{     /* A 태그에 마우스가 올라 갔을 경우 */
	  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	  background-color: #E6F7FF; /* 배경 색 변경*/
	  color: black;              /* 문자열 색깔 */ 
	}
	 
	A:visited{     /* A 태그의 링크를 방문한 경우 */
	  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	  color: black;              /* 글자색깔 검정 */
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $.getJSON(
      "../json/seoul.json",
      response
  );
});
function response(result,textStatus){
	//alert('Call Back Call:'+result);
	
	
	var size = result.DATA.length;
	//alert('size: ' + size);
	//var i = 0;
	
	
	$("#panel").append(
				"<TR>"+
	                "<TH>시설명</TH>"+
	                "<TD>"+result.DATA[1].CENTER_NAME+"</TD>"+
                "</TR>"+
                "<TR>"+
	                "<TH>주소</TH>"+
	                "<TD>"+result.DATA[1].ADDRESS+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>우편번호</TH>"+
                	"<TD>"+result.DATA[1].ZIP+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>시설소개</TH>"+
                	"<TD>"+result.DATA[1].INTRO+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>부대시설</TH>"+
                	"<TD>"+result.DATA[1].SUBSIDIARY+"</TD>"+
                "</TR>"+
                "<TR>"+
                	"<TH>홈페이지</TH>"+
               		"<TD>"+result.DATA[1].HOMEPAGE+"</TD>"+
                "</TR>"+
               	"<TR>"+
	                "<TH>전화번호</TH>"+
	                "<TD>"+result.DATA[1].TEL+"</TD>"+
	            "</TR>"+
                "<TR>"+
	                "<TH>E-Mail</TH>"+
	                "<TD>"+result.DATA[1].EMAIL+"</TD>"+
	            "</TR>"
            ); 
		

	
}
</script>

</head>

<body>

<TABLE id="panel">
	<TR>
		<TD colspan="2" align="center">
			<div id="map" style="width:500px;height:400px;"></div>
			
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=da246ae8b7c6b06cd80ebdbcac2b98ce&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addr2coord('잠실야구장',
						function(status, result) {

							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {

								var coords = new daum.maps.LatLng(
										result.addr[0].lat, result.addr[0].lng);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new daum.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new daum.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
		</TD>
	</TR>
	
</TABLE>

</body>
</html>
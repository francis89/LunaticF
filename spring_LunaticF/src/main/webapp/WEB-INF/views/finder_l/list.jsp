<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../json/jquery.js"></script> 
<script type="text/javascript">
var gida = '';
function read(i){
	var url = "read";
	url += "?i="+i;
	url += "&ida="+gida;
	
	location.href=url;
}

function jsonOpen(test) {
	var ida = document.getElementById(test.getAttribute('id')).getAttribute('id');
	//alert(ida);
	
	$.getJSON(
   	   "../json/"+ ida +".json",
  	   response
	 );
  	   gida = ida;
}
function response(result, textStatus) {
	var size = result.DATA.length;
	var i = 0;
	//alert(ida);
	var str = "<table class='table'>";
	str += "<thead><tr>";
	str += "<th>번호</th>";
	str += "<th>구역</th>";
	str += "<th>분류</th>";
	str += "<th>서비스명</th>";
	str += "<th>접수상태</th>";
	str += "<th>URL</th>";
	str += "</tr></thead>";
	str += "<tbody>";
	for (i = 0; i < size; i++) {
		$("#div1").append(
			str += "<tr>",
			str += "<td>"+ (i+1) + "</td>",
			str += "<td>" + result.DATA[i].AREANM + "</td>",
			str += "<td>" + result.DATA[i].MINCLASSNM + "</td>",
			str += "<td><a href='javascript:read(" + i + ")'>"	+ result.DATA[i].SVCNM + "</a></td>",
			str += "<td>" + result.DATA[i].SVCSTATNM + "</td>",
			str += "<td><a href='"+ result.DATA[i].SVCURL +"'>URL</a></td>",
			str += "</tr>"
		);
	}
	str += "</tbody>";
	str += "</table>";
	document.getElementById("div1").innerHTML = str;
}
</script>
</head>
<body>
<div class="container">
	<div class="table-responsive">  
		<table class="table">
			<thead>
				<tr>
					<th colspan="5">
						<h2  style="text-align: center;">AREA LIST</h2>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="GangNam(default)" onmousedown='jsonOpen(this)'>강남구</td>
					<td id="GangDong" onmousedown='jsonOpen(this)'>강동구</td>
					<td id="GangBuk(default)" onmousedown='jsonOpen(this)'>강북구</td>
					<td id="GangSeo" onmousedown='jsonOpen(this)'>강서구</td>
					<td id="GwanAk(default)" onmousedown='jsonOpen(this)'>관악구</td>
				</tr>
				<tr>
					<td id="GwangJin" onmousedown='jsonOpen(this)'>광진구</td>
					<td id="Guro" onmousedown='jsonOpen(this)'>구로구</td>
					<td id="GeumCheon(default)" onmousedown='jsonOpen(this)'>금천구</td>
					<td id="NoWon(default)" onmousedown='jsonOpen(this)'>노원구</td>
					<td id="DoBong(default)" onmousedown='jsonOpen(this)'>도봉구</td>
				</tr>
				<tr>
					<td id="DongDaeMun(default)" onmousedown='jsonOpen(this)'>동대문구</td>
					<td id="DongJak" onmousedown='jsonOpen(this)'>동작구</td>
					<td id="Mapo" onmousedown='jsonOpen(this)'>마포구</td>
					<td id="SeoDaeMun(default)" onmousedown='jsonOpen(this)'>서대문구</td>
					<td id="SeoCho" onmousedown='jsonOpen(this)'>서초구</td>
				</tr>
				<tr>
					<td id="SungDong" onmousedown='jsonOpen(this)'>성동구</td>
					<td id="SungBuk(default)" onmousedown='jsonOpen(this)'>성북구</td>
					<td id="SongPa" onmousedown='jsonOpen(this)'>송파구</td>
					<td id="YangCheon" onmousedown='jsonOpen(this)'>양천구</td>
					<td id="YeongDeungPo" onmousedown='jsonOpen(this)'>영등포구</td>
				</tr>
				<tr>
					<td id="YongSan" onmousedown='jsonOpen(this)'>용산구</td>
					<td id="EunPyeong(default)" onmousedown='jsonOpen(this)'>은평구</td>
					<td id="JongNo(default)" onmousedown='jsonOpen(this)'>종로구</td>
					<td id="JungGu(default)" onmousedown='jsonOpen(this)'>중구</td>
					<td id="JungNang(default)" onmousedown='jsonOpen(this)'>중랑구</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id='div1'></div><br>
</div>
</body>
</html>
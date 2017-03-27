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

function testfunc(test) {
	var ida = document.getElementById(test.getAttribute('id')).getAttribute('id');
	alert(ida);
	
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
	var str = str + "<table>";
	str = str + "<tr><th>번호</th>";
	str = str + "<th>분류</th>";
	str = str + "<th>서비스명</th>";
	str = str + "<th>접수상태</th>";
	str = str + "<th>URL</th></tr>";
	for (i = 0; i < size; i++) {
		$("#div1").append(
			str = str + "<tr><td>"+ (i+1) + "</td>",
			str = str + "<td>" + result.DATA[i].MINCLASSNM + "</td>",
			str = str + "<td><a href='javascript:read(" + i + ")'>"	+ result.DATA[i].SVCNM + "</a></td>",
			str = str + "<td>" + result.DATA[i].SVCSTATNM + "</td>",
			str = str + "<td><a href='"+ result.DATA[i].SVCURL +"'>URL</a></td></tr>"
		);
	}
	str = str + "</table>";
	document.getElementById("div1").innerHTML = str;
}
</script>
</head>
<body>
	<table>
		<tr>
			<td id="GangNam(default)" onmousedown='testfunc(this)'>강남구</td>
			<td id="GangDong" onmousedown='testfunc(this)'>강동구</td>
			<td id="GangBuk(default)" onmousedown='testfunc(this)'>강북구</td>
			<td id="GangSeo" onmousedown='testfunc(this)'>강서구</td>
			<td id="GwanAk(default)" onmousedown='testfunc(this)'>관악구</td>
		</tr>
		<tr>
			<td id="GwangJin" onmousedown='testfunc(this)'>광진구</td>
			<td id="Guro" onmousedown='testfunc(this)'>구로구</td>
			<td id="GeumCheon(default)" onmousedown='testfunc(this)'>금천구</td>
			<td id="NoWon(default)" onmousedown='testfunc(this)'>노원구</td>
			<td id="DoBong(default)" onmousedown='testfunc(this)'>도봉구</td>
		</tr>
		<tr>
			<td id="DongDaeMun(default)" onmousedown='testfunc(this)'>동대문구</td>
			<td id="DongJak" onmousedown='testfunc(this)'>동작구</td>
			<td id="Mapo" onmousedown='testfunc(this)'>마포구</td>
			<td id="SeoDaeMun(default)" onmousedown='testfunc(this)'>서대문구</td>
			<td id="SeoCho" onmousedown='testfunc(this)'>서초구</td>
		</tr>
		<tr>
			<td id="SungDong" onmousedown='testfunc(this)'>성동구</td>
			<td id="SungBuk(default)" onmousedown='testfunc(this)'>성북구</td>
			<td id="SongPa" onmousedown='testfunc(this)'>송파구</td>
			<td id="YangCheon" onmousedown='testfunc(this)'>양천구</td>
			<td id="YeongDeungPo" onmousedown='testfunc(this)'>영등포구</td>
		</tr>
		<tr>
			<td id="YongSan" onmousedown='testfunc(this)'>용산구</td>
			<td id="EunPyeong(default)" onmousedown='testfunc(this)'>은평구</td>
			<td id="JongNo(default)" onmousedown='testfunc(this)'>종로구</td>
			<td id="JungGu(default)" onmousedown='testfunc(this)'>중구</td>
			<td id="JungNang(default)" onmousedown='testfunc(this)'>중랑구</td>
		</tr>
	</table>
	<div id='div1'></div><br>
</body>
</html>
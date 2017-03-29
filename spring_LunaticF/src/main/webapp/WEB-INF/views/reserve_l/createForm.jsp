<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css"> 
.ui-controlgroup-vertical {
      width: 150px;
}
.ui-controlgroup.ui-controlgroup-vertical > button.ui-button,
.ui-controlgroup.ui-controlgroup-vertical > .ui-controlgroup-label {
      text-align: center;
}
.ui-controlgroup-horizontal .ui-spinner-input {
      width: 50px;
}
</style>
<script type="text/javascript">
function incheck(f) {
	if(f.retitle.value=="") {
		alert("제목을 입력하세요");
		f.retitle.focus();
		return false;
	}
	
	if(f.recontent.value=="") {
		alert("내용을 입력하세요 " + redat);
		f.recontent.focus();
		return false;
	}
	
	if(f.reterm.value=="") {
		alert("날짜를 입력하세요");
		f.reterm.focus();
		return false;
	}
	
	if(f.restate.value=="default") {
		alert("장소를 입력하세요");
		f.restate.focus();
		return false;
	}
	
	if((today - redat) < 0) {
		alert("날짜 다시 입력.");
		f.recontent.focus();
		return false;
	} else {
		alert("에러가 나와야 한다.");
		return false;
	}
	
	if(f.retimnum.value <= 0) {
		alert("정수를 입력하세요");
		f.retimnum.focus();
		return false;
	}
	
}

$(function() {
	$("#rdate").change(function() {
		$(document).ready(function() {
			var reda = document.getElementById("rdate").value;
			var rdate = new Date(reda);
			var today = new Date();
			if(today >= rdate) {
				alert("이전 날짜로는 예약할 수 없습니다. 날짜를 변경해주세요.")
			}
		});
	});
});

$(function() {
	$("select").change(function() {
		$(document).ready(function() {
			$.getJSON(
			   	   "../json/"+$(":selected").attr("value")+".json",
		  	   response
			 );
		});
	});
});
	
function response(result,textStatus){
	//alert('Call Back Call:'+result);
	$("#panel").html("");
	var size = result.DATA.length;
	//alert('size: ' + size);
	var i = 0;
	
	for(i = 0; i < size; i++){
		$("#panel").append(                    
                "<Option><a href='javascript:read("+i+")'>"+result.DATA[i].SVCNM+"</a></Option>"
            );
	}
}
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".controlgroup" ).controlgroup()
    $( ".controlgroup-vertical" ).controlgroup({
      "direction": "vertical"
    });
  });
</script>
</head>
<body>
	<h2 style="text-align: center;">등록</h2>
	 <div class="container">
		<FORM name='frm' 
			  method='POST' 
			  action='./create' 
			  onsubmit="return incheck(this)"
			  enctype="multipart/form-data">
			  <input type="hidden" name="id" value="${sessionScope.id}">
			  <div class="table-responsive">
				  <table class="table">
				    <tr>
				      <th>제목</th>
				      <td><input type="text" name="retitle" size="40"></td>
				    </tr>
				    <tr>
				      <th>내용</th>
				      <td>
						<textarea rows="10" cols="40" name="recontent"></textarea>
				      </td>
				    <tr>
				      <th>예약날짜</th>
				      <td>
				      	<input type="date" name="reterm" id="rdate">
				      </td>
				    </tr>
				    <tr>
				      <th>장소</th>
				      <td>
				      		<p>
								<label for="serviceStatus3">지역 :</label>
						    	<select class="selectSt" onchange="searchArea(this.value);" id="serviceStatus3" name="areaStatus" style="width:20%;height:100%" title='지역 선택' >
									<option value="defaule" >지역</option>
				                    <option value="DongJak" >동작구</option>
				                    <option value="DoBong(default)" >도봉구</option>
				                    <option value="GangBuk(default)" >강북구</option>
				                    <option value="NoWon(default)" >노원구</option>
				                    <option value="EunPyeong(default)" >은평구</option>
				                    <option value="JongNo(default)" >종로구</option>
				                    <option value="SungBuk(default)" >성북구</option>
				                    <option value="JungNang(default)" >중랑구</option>
				                    <option value="DongDaeMun(default)" >동대문구</option>
				                    <option value="SeoDaeMun(default)" >서대문구</option>
				                    <option value="JungGu(default)" >중구</option>
				                    <option value="SungDong" >성동구</option>
				                    <option value="GwangJin" >광진구</option>
				                    <option value="GangDong" >강동구</option>
				                    <option value="GangSeo"  >강서구</option>
				                    <option value="Mapo" >마포구</option>
				                    <option value="YeongDeungPo" >영등포구</option>
				                    <option value="YongSan" >용산구</option>
				                    <option value="GangNam(default)" >강남구</option>
				                    <option value="SongPa" >송파구</option>
				                    <option value="SeoCho" >서초구</option>
				                    <option value="GwanAk(default)" >관악구</option>
				                    <option value="GeumCheon(default)" >금천구</option>
				                    <option value="Guro" >구로구</option>
				                    <option value="YangCheon" >양천구</option>
								</select>
				  				<br>
				  				<label for="panel">장소명:</label>
				  				<select id="panel" name="restate"  style="width:60%;height:100%" title='장소 선택'>
				  					<option value="default" >장소</option>
				  				</select>
							</p>
				      </td>
				    </tr>
				    <tr>
				      <th>인원</th>
				      <td>
				      	<DIV class="controlgroup">
				      		<input id="horizontal-spinner" class="ui-spinner-input" name="retimnum">
				      	</DIV>
				      </td>
				    </tr>
				  </table>
			  </div>
			  <DIV class='bottom' style="text-align: center;">
			    <input type='submit' value='등록' class="button" >
			    <input type='button' value='취소' class="button" onclick="history.back()">
			  </DIV>
		</FORM>
	 </div>
</body>
</html>
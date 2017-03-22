<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css"> 
*{ 
  font-size: 20px; 
}
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
		alert("내용을 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.reterm.value=="") {
		alert("날짜를 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.restate.value=="") {
		alert("장소를 입력하세요");
		f.recontent.focus();
		return false;
	}
	
	if(f.retimnum.value <= 0) {
		alert("정수를 입력하세요");
		f.recontent.focus();
		return false;
	}
}

$(document).ready(function() {
    $.ajax({
        url:"GangDong.json",
        dataType:"text",
        success:function(data) {
            result=eval("("+data+")");
            //alert('Call Back Call: ' + result.name);
        }
    });
});
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".controlgroup" ).controlgroup()
    $( ".controlgroup-vertical" ).controlgroup({
      "direction": "vertical"
    });
  } );
  </script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<DIV class="title">등록</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create' 
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
	  <input type="hidden" name="id" value="${sessionScope.id}">
  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="retitle" size="40"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
		<textarea rows="10" cols="40" name="recontent"></textarea>
      </TD>
      <tr>
      <TH>예약날짜</TH>
      <TD><input type="text" name="reterm"></TD>
    </TR>
    <TR>
      <TH>장소</TH>
      <TD><input type="text" name="restate">
      		<p>
				<label for="serviceStatus3">서비스 지역 :</label>
		    	<select class="selectSt" onchange="searchArea(this.value);" id="serviceStatus3" name="areaStatus" style="width:90px;height:40px" title='지역 선택' >
					<option value="25" >전체</option>
                    <option value="0" >도봉구</option>
                    <option value="1" >강북구</option>
                    <option value="2" >노원구</option>
                    <option value="3" >은평구</option>
                    <option value="4" >종로구</option>
                    <option value="5" >성북구</option>
                    <option value="6" >중랑구</option>
                    <option value="7" >동대문구</option>
                    <option value="8" >서대문구</option>
                    <option value="9" >중구</option>
                    <option value="10" >성동구</option>
                    <option value="11" >광진구</option>
                    <option value="12" >강동구</option>
                    <option value="13"  >강서구</option>
                    <option value="14" >마포구</option>
                    <option value="15" >영등포구</option>
                    <option value="16" >용산구</option>
                    <option value="17" >강남구</option>
                    <option value="18" >송파구</option>
                    <option value="19" >서초구</option>
                    <option value="20" >동작구</option>
                    <option value="21" >관악구</option>
                    <option value="22" >금천구</option>
                    <option value="23" >구로구</option>
                    <option value="24" >양천구</option>
				</select>
			</p>
      </TD>
    </TR>
    <TR>
      <TH>인원</TH>
      <TD><DIV class="controlgroup">
      <input id="horizontal-spinner" class="ui-spinner-input" name="retimnum"></DIV></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' class="button" >
    <input type='button' value='취소' class="button" onclick="history.back()">
  </DIV>
</FORM>
</body>
</html>
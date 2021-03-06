<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script> 

<script type="text/javascript">
function inputCheck(f){
	if(f.id.value==""){
		alert("ID를 입력해주세요");
		f.id.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("Password를 입력해주세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("Password 확인을 입력해주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("Password가 일치 하지 않습니다. 다시 입력해주세요 ");
		f.passwd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력해주세요");
		f.mname.focus();
		return false;
	}
	
}
function idCheck(id){
	
	if(id==""){
		alert("아이디를 입력해주세요");
		document.frm.id.focus();
	}else{
		var url = "id_Proc"
		url += "?id="+id;
		var wr = window.open(url, "아이디 검색", "width=500, height=500");
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);
	}
}
</script> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<h2 style="text-align: center;">회원가입</h2> 
<div class="container">

<form name='frm' 
	  method='POST' 
	  action='./create'
	  enctype="multipart/form-data"
	  onsubmit="return inputCheck(this)">
	  <div class="table-responsive">
	  
  <table class="table">
    
    <tr>
      <th>*아이디</th>
      <td>
      	<input type="text" name="id" size="15"placeholder="ID">
      	<input type="button" value="ID중복확인" 
      	       onclick="idCheck(document.frm.id.value)">
      </td>
      <td>아이디를 적어주세요.</td>
    </tr>
    
    <tr>
      <th>*패스워드</th>
      <td><input type="password" name="passwd" size="15"></td>
      <td> 패스워드를 적어주세요 </td>
    </tr>
    <tr>
      <th>*패스워드확인</th>
      <td><input type="password" name="repasswd" size="15" ></td>
      <td> 패스워드를 확인합니다 </td>
    </tr>
    <tr>
      <th>*이름</th>
      <td><input type="text" name="username" size="15" placeholder="이름"></td>
      <td> 실명을 적어주세요 </td>
    </tr>
	<tr>
      <th>연락처</th>
      <td><input type="text" name="tel" size="15"placeholder="연락처"></td>
      <td> 연락처를 적어주세요 </td>
    </tr>    
    
    <tr>
      <th>우편번호</th>
      <td>
      <input type="text" name="zipcode" size="7" maxlength="6" id="sample6_postcode" placeholder="우편번호">
	  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색">
      </td>
      <td> 우편번호를 검색해주세요 </td>
    </tr>

    <tr>
      <th>주소</th>
      <td>
      <input type="text" name="address1" size="40" id="sample6_address" placeholder="주소"> 
      <input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소">
      </td>
      <td> 주소를 입력해주세요 </td>
    </tr>
    
    
  </table>
  </div>
  <div class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='button' value='취소' onclick="history.back()">
  </div>
</form>
  </div>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
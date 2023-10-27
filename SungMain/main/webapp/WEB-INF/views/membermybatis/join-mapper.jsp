<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
<%@include file="submenu.jsp" %>
<h2>회원가입</h2>


		
		
		<div class="input-group" id="divUser_IdChk">
		<input type="email"  name="user_id" id="up_user_id">
		<span id="spanUser_IdChk" class="error-text"></span> 
		</div>
		<div class="input-group" id="divPwdChk">
		<input type="password" name="pw" id="up_password">
		<span id="spanPwdChk" class="error-text"></span> 
		</div>
		<div class="input-group" id="divPwdChk2">
		<input type="password" name="pw2" id="up_password_ck">
		<span id="spanPwdChk2" class="error-text"></span> 
		</div>
		<div class="input-group" id="divNameChk">
		<input type="text" name="name" id="up_name">
		<span id="spanNameChk" class="error-text"></span> 
		</div>
		<div class="input-group" id="divNickNameChk">
		<input type="text" name="nickname" id="up_nickname">
		<span id="spanNickNameChk" class="error-text"></span> 
		</div>
		<div class="input-group" id="divEmailChk">
		<input type="text" name="email" id="up_email">
		<span id="spanEmailChk" class="error-text"></span> 
		</div>
		<div class="input-group" id="divPhoneNumberChk">
		<input type="text" name="PhoneNumber" id="up_PhoneNumber">
		<span id="spanPhoneNumberChk" class="error-text"></span> 
		</div>
		<input type="submit" value="회원가입" id="join_btn">
	
	
<form action="joinP" method="post" id="registrationForm">
    <div class="input-group" id="divUser_IdChk">
        <input type="text" name="user_id" id="up_user_id" required>
        <span id="spanUser_IdChk" class="error-text"></span> 
    </div>
    <!-- 다른 입력 필드 및 에러 메시지들 -->

    <input type="submit" value="회원가입" id="join_btn">
</form>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var form = document.getElementById("registrationForm");

    form.addEventListener("submit", function(event) {
        if (!form.checkValidity()) {
            // 폼 유효성 검사 실패 시 기본 동작을 막음
            event.preventDefault();
            alert("입력 양식을 올바르게 작성해 주세요.");
        }
    });
});
</script>
<script>
//ID 체크 블러이벤트
$('#up_user_id').on('blur', function() {
   getMemberAjax($('#up_user_id').val());
});

function getMemberAjax(id) {
	   $.ajax({
	      type: 'POST',
	      url: '../membermybatis/getMemberdata',
	      data: {
	         id: id
	      }, 
	      dataType: 'json', // text or json
	      success: function(response) { // function으로 넣어야 callback 가능
	         if (response === 1) {
	            console.log("성공이야");
	        	 checkId(id, true);
	            
	         } else {
	            checkId(id, false);
	         }
	      },
	      error: function(xhr, status, error) {
	         console.log(xhr, status, error)
	      }
	   })
	}
	
function checkId(user_id, flag) {
	   let divUser_IdChk = document.getElementById('divUser_IdChk');
	   let join_btn = document.getElementById('join_btn');

	   if (user_id == "") {
	      $('#spanUser_IdChk').text('아이디: 필수 정보입니다.');
	      divUser_IdChk.classList.add('red');
	   } else {
	      if (flag) {
	         $('#spanUser_IdChk').text('동일한 아이디가 존재합니다.');
	         divUser_IdChk.classList.add('red');
	         join_btn.disabled = true;
	         
	      } else {
	         $('#spanUser_IdChk').text('');
	         divUser_IdChk.classList.remove('red');
	         join_btn.disabled = false;
	      }
	   }
	}
	
	

 
function joinAjax(user_id, password, password_ck, name,nickname, email,PhoneNumber) {
	   var flag = checkSignUp(user_id, password, password_ck, name,nickname, email,PhoneNumber);
	   if (!flag) return;
	   console.log(flag);
	   console.log("user_id 체크 :" + user_id);
	   console.log("password_ck 체크 :" + password_ck);
	   console.log("PhoneNumber 체크 :" + PhoneNumber);
	   console.log("name 체크 :" + name);
	   	var pw = password;
	   	
	  
	   $.ajax({
		      type: 'POST',
		      url: '../membermybatis/joinP',
		      data: {
		         user_id: user_id,
		         pw: pw,
		         password_ck: password_ck,
		         name : name,		         
		         nickname: nickname,
		         email : email,
		         PhoneNumber : PhoneNumber
		         
		      },
		      dataType: 'json', // text or json
		      success: function(response) { // function으로 넣어야 callback 가능
		          console.log(response);
		         if (response === 1) {
		            alert('회원가입 되었습니다.');
		            toggle();
		         
		         } else {
		            alert('잠시 후 다시 시도해주세요');
		         }
		      },
		      error: function(xhr, status, error) {
		         console.log(xhr, status, error);
		      }
		   });
	   
}

function red(){
	   divChk = document.getElementById('divNickNameChk');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divUser_IdChk');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divPwdChk');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divPwdChk2');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divNameChk');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divEmailChk');
	   divChk.classList.remove('red');
	   divChk = document.getElementById('divPhoneNumberChk');
	   divChk.classList.remove('red');
	}

function checkSignUp(user_id, password, password_ck,name, nickname, email,PhoneNumber) {
	   let flag = true;
	   
	   console.log("user_id 체크" + user_id);
	   console.log("password_ck 체크" + password_ck);
	   let divChk = document.getElementById('divEmailChk');
	   let input = document.getElementById('up_email')
	   if (email == "") {
	      $('#spanEmailChk').text('이메일: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (email != "") {
	      $('#spanEmailChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   divChk = document.getElementById('divPwdChk2');
	   input = document.getElementById('up_password_ck')
	   if (password_ck == "") {
	      $('#spanPwdChk2').text('비밀번호 확인: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (password_ck != "") {
	      if (password != password_ck) {
	         $('#spanPwdChk2').text('비밀번호가 일치하지 않습니다.');
	         divChk.classList.add('red');
	         input.focus();
	         flag = false;
	      } else {
	         $('#spanPwdChk2').text('');
	         divChk.classList.remove('red');
	      }
	   }

	   divChk = document.getElementById('divPwdChk');
	   input = document.getElementById('up_password')
	   if (password == "") {
	      $('#spanPwdChk').text('비밀번호: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (password != "") {
	      $('#spanPwdChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   divChk = document.getElementById('divUser_IdChk');
	   input = document.getElementById('up_user_id')
	   if (user_id == "") {
	      $('#spanUser_IdChk').text('아이디: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (user_id != "") {
	      $('#spanUser_IdChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   divChk = document.getElementById('divNameChk');
	   input = document.getElementById('up_nickname')
	   if (name == "") {
	      $('#spanNickNameChk').text('이름: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (nickname != "") {
	      $('#spanNickNameChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   divChk = document.getElementById('divNickNameChk');
	   input = document.getElementById('up_nickname')
	   if (nickname == "") {
	      $('#spanNickNameChk').text('닉네임: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (nickname != "") {
	      $('#spanNickNameChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   divChk = document.getElementById('divPhoneNumberChk');
	   input = document.getElementById('up_PhoneNumber')
	   if (PhoneNumber == "") {
	      $('#spanPhoneNumberChk').text('전화번호: 필수 정보입니다.');
	      divChk.classList.add('red');
	      input.focus();
	      flag = false;
	   } else if (PhoneNumber != "") {
	      $('#spanPhoneNumberChk').text('');
	      divChk.classList.remove('red');
	   }
	   
	   return flag;
	}
	

window.onload = function() {  //onload
	
	red();
	
	
	$('#join_btn').on('click', function() {
		console.log("하위");
		console.log("name값아 좀 와라 : " + $('#up_name').val())
	    joinAjax($('#up_user_id').val(), $('#up_password').val(), $('#up_password_ck').val(),$('#up_name').val(), $(
	       '#up_nickname').val(), $('#up_email').val(),$('#up_PhoneNumber').val());
	 });


}
	

</script>

</body>
</html>
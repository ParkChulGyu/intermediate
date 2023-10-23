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
<hr>
<form action="joinP" method="post">
	<table border="1">
		<tr><th>ID</th><td><input type="text" id="user_id" name="user_id"><button class="idCheck" type="button" id="idCheck"  value="N">중복확인</button></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw"></td></tr>
		<tr><th>PW2</th><td><input type="text" name="pw2"></td></tr>
		<tr><th>Name</th><td><input type="text" id="name" name="name"><button class="nameCheck" type="button" id="nameCheck"  value="N">중복확인</button></td></tr>
		<tr><th>nickName</th><td><input type="text" name="nickName"></td></tr>
		<tr><th>email</th><td><input type="text" name="email"></td></tr>
		<tr><th>PhoneNumber</th><td><input type="text" name="PhoneNumber"></td></tr>
		<tr><th>grade</th><td>
		<input type="radio" name="role" value="1" checked="checked">Member
		<input type="radio" name="role" value="0">Admin
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>
<script>

window.onload = function() {
	//if (password != password_ck) {
      //  $('#spanPwdChk2').text('비밀번호가 일치하지 않습니다.');
      //  divChk.classList.add('red');
      //  input.focus();
       // flag = false;
        
      
        		$('.idCheck').click( function(){  
        		idcheck();
        	});	
        		
        		$('.nameCheck').click( function(){  
            		namecheck();
            	});	
            		
        	
        		
        	
}
	



function idcheck() {
		const user_id = $("#user_id").val();
		console.log("id check입니다" + id);
	$.ajax({
        type: 'POST',
        url: '../membermybatis/idCheckReal',
        data: {user_id},
        dataType: 'json',
        success: function(data) {
        	
        	
			if(data == 1){
				alert("중복된 아이디입니다.")
			}else if(data == 0){
				$("#idCheck").attr("value","Y");
				alert("사용 가능한 아이디입니다.")
			}
        	
        
        
        },
        error: function(xhr, status, error) {
        	
            console.log(xhr, status, error);
        }
    });
};

function namecheck() {
	const name = $("#name").val();
	console.log("name check입니다" + name);
    $.ajax({
        type: 'POST',
        url: '../membermybatis/nameCheckReal',
        data: {name},
        dataType: 'json',
        success: function(data) {
			if(data == 1){
				alert("중복된 닉네임입니다.")
			}else if(data == 0){
				$("#nameCheck").attr("value","Y");
				alert("사용 가능한 닉네임입니다.")
			}
        	
        
        
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};
</script>


</body>
</html>
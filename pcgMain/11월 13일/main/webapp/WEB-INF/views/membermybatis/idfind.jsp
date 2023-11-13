<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<%@include file="submenu.jsp" %>
<script type="text/javascript">

var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


</script>
<h2>아이디를 찾아 주갓어</h2>

<form action="idfindP" method="post">
이메일 : <input type="text" name="str_email01" id="str_email01" style="width:100px"> @
<input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com">
<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail">
	 <option value="1">직접입력</option>
	 <option value="naver.com" selected>naver.com</option>
	 <option value="hanmail.net">hanmail.net</option>
	 <option value="nate.com">nate.com</option>
	 <option value="gmail.com">gmail.com</option>
</select>

<input type="submit"></button>
</form> 


<a href="membermybatis/login-mapper">로그인하러 가기</a>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//이메일 입력방식 선택
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
		
		if($(this).val()== '1'){ //직접입력일 경우
			 $("#str_email02").val('');                        //값 초기화
			 $("#str_email02").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#str_email02").val($(this).text());      //선택값 입력
			 $("#str_email02").attr("disabled",true); //비활성화
		}
   });
});
</script>


















</body>
</html>
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
<h2>로그인</h2>
<hr>
rs:<%=request.getAttribute("rs") %>
</hr>
<form action="loginP" method="post">
	<table border="1">
		<tr><th>ID</th><td><input type="text" name="user_id"></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw"></td></tr>
		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>
<a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"style="width: 208px; height: auto;"></a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	window.Kakao.init("362b656b5b93008aab3b5504dea7f99d");
	
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope: 'profile_nickname',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url: "/v2/user/me",
					success: function(res) {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
		});
	}
</script>



</body>
</html>
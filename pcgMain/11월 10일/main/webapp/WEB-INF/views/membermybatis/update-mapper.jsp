<%@page import="com.myweb.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="loginCheck-mapper.jsp" />
<%
request.setCharacterEncoding("utf-8");

MemberDTO dto = (MemberDTO)request.getAttribute("dto");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<script>
	function deleteConfirm() {
		const input = confirm("회원을 탈퇴할까요?");
		alert(input);
		if (input) location.href = "delete-mapper";
		else return;
	};
	
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top2.css">
</head>
<body>
<%@include file="submenu.jsp" %>
<h2>회원정보수정</h2>



<hr>
<form action="updateP" method="post">
	<table border="1">
		<tr><th>ID</th><td><%=dto.getUser_id()%></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw" value="<%=dto.getPw()%>"></td></tr>
		<tr><th>Name</th><td><input type="text" name="name" value="<%=dto.getName()%>"></td></tr>
		<tr><th>nickname</th><td><input type="text" name="nickname" value="<%=dto.getNickname()%>"></td></tr>
      	<tr><th>email</th><td><input type="text" name="email" value="<%=dto.getEmail()%>"></td></tr>
      	<tr><th>PhoneNumber</th><td><input type="text" name="PhoneNumber" value="<%=dto.getPhoneNumber()%>"></td></tr>	

		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>

<button>
	<a href="#" onclick="deleteConfirm();">회원탈퇴</a> |
</button>
</body>
</html>
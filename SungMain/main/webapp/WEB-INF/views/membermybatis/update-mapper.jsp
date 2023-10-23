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

		<!--  
		<tr><th>Role</th><td>
		<%--if(dto.getGrade().equals("admin")){%>	
		<input type="radio" name="role" value="1" checked="checked">Member
		<input type="radio" name="role" value="0">Admin
		<%} %>
		<%if(dto.getGrade().equals("일반")) {%>
		<input type="radio" name="role" value="1">Member
		<input type="radio" name="role" value="0" checked="checked">Admin
		<%}--%>
		</td></tr>
		-->
		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>
</body>
</html>
<%@page import="com.myweb.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getRequestURI() %></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
<%@include file="../topmenu.jsp" %>

<main>
<%@include file="submenu.jsp" %>

<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO)request.getAttribute("dto");
%>


<div class="main-mapper">



	<table>
	
		<tr><th>등급</th><td>회원</td></tr>
		<tr><th>ID</th><td><%=dto.getUser_id()%></td></tr>
		<tr><th>PW</th><td><%=dto.getPw()%></td></tr>
		<tr><th>Name</th><td><%=dto.getName()%></td></tr>
		<tr><th>nickname</th><td><%=dto.getNickname()%></td></tr>
      	<tr><th>email</th><td><%=dto.getEmail()%></td></tr>
      	<tr><th>PhoneNumber</th><td><%=dto.getPhoneNumber()%></td></tr>	
	</table>































</div>








</main>


</body>
</html>
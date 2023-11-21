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

	
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
<%@include file="../topmenu.jsp" %>
<main>
<%@include file="submenu.jsp" %>


<div class="update-mapper">
<div class="maintitle">


<h2>회원정보수정</h2>

</div>




<hr>

<form action="updateP" method="post">
	<table class="updatetable">
		<tr><th class="updateline">ID</th><td class="updateline"><%=dto.getUser_id()%></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw" value="<%=dto.getPw()%>"></td></tr>
		<tr><th class="updateline">Name</th><td class="updateline"><input type="text" name="name" value="<%=dto.getName()%>"></td></tr>
		<tr><th class="updateline" >nickname</th><td class="updateline" ><input type="text" name="nickname" value="<%=dto.getNickname()%>"></td></tr>
      	<tr><th>email</th><td><input type="text" name="email" value="<%=dto.getEmail()%>"></td></tr>
      	<tr><th class="updateline" >PhoneNumber</th><td class="updateline"><input type="text" name="PhoneNumber" value="<%=dto.getPhoneNumber()%>"></td></tr>	

		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>


</div>
</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function deleteConfirm() {
		const input = confirm("회원을 탈퇴할까요?");
		alert(input);
		if (input) location.href = "delete-mapper";
		else return;
	};
</script>
	<a href="#" onclick="deleteConfirm();">회원탈퇴</a> |
<%@include file="../topmenu.jsp" %>
<%@include file="../subject.jsp" %>
<h2>
<!--  <a href="main">Home</a> | -->
<a href="main-mapper">Home-mapper</a> |
<a href="memberList-mapper">회원목록-Interface(mapper)</a> |

<% if (session.getAttribute("user_id") == null) { %>
<% } else { %>	
	<a href="update-mapper">정보수정</a> |
	<a href="logout-mapper">로그아웃</a> | <br>
<%=session.getAttribute("nickname") %>(<%=session.getAttribute("user_id") %>) 로그인 중
<% } %>


</h2>
<hr>
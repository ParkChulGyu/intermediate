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
<%@include file="../topmenu.jsp" %>
<%@include file="../subject.jsp" %>
<h2>
<!--  <a href="main">Home</a> | -->
<a href="main-mapper">Home-mapper</a> |


<a href="memberList-mapper">회원목록-Interface(mapper)</a> |

<% if (session.getAttribute("id") == null) { %>
<a href="join-mapper">회원가입</a> |
<a href="login-mapper">로그인</a> |
<% } else { %>	
	<a href="update-mapper">정보수정</a> |
	<a href="#" onclick="deleteConfirm();">회원탈퇴</a> |
	<a href="logout-mapper">로그아웃</a> | <br>

<%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>) 로그인 중
<% } %>

</h2>
<hr>
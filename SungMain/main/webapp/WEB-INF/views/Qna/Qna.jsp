<%@page import="com.myweb.dto.AdminNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna.jsp</title>
</head>
<body>
<%@include file="../topmenu.jsp" %>
<h3>Q&A </h3>

<div id="list-top">
	<div>
		<ul>
			<!--<core:if test="${login_info.admin eq 'Y' }">-->
				<li><a class="btn-fill" href="New">글쓰기</a></li>
			<!--</core:if>-->
		</ul>
	</div>
</div>

<table>
	<tr>
		<th class="w-px60">번호</th>
		<th>제목</th>
		<th class="w-px100">작성자</th>
		<th class="w-px120">작성일자</th>
		<th class="w-px60">첨부파일</th>
	</tr>
	
	
	<c:forEach items="${list }" var="QnaDTO"  varStatus="dto">
	
	
							
	
		<td>${QnaDTO.no }</td>
			<td clsass="left">
				<c:forEach var="i" begin="1" end="${QnaDTO.indent }">
				
				<c:choose>
                         <c:when test="${i eq OnaDTO.indent}">
      					&nbsp;&nbsp;
                            </c:when>
                              <c:otherwise>
                             <img src=${pageContext.request.contextPath}/resources/svg/arrow-return-right.svg />
    						</c:otherwise>
                              
                           </c:choose>
				</c:forEach>
					
		
					
				<a href="detail?idx=${QnaDTO.idx }" >${QnaDTO.title }</a>
			</td>
			<td>${QnaDTO.writer }</td>
			<td>${QnaDTO.regdate }</td>
			<td>
				<c:if test="${!empty QnaDTO.filename }">
					<a href="download?idx=${QnaDTO.idx }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16" title="${QnaDTO.filename }">
 							 <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
  							 <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
					</svg>
					
					
						
					</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>


<tr>
			



	






</body>
</html>
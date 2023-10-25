<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.myweb.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<body>
<!-- 탑메뉴 넣기-->

<h2>페이징 값 확인</h2>
<hr>
<p>Total Count: <c:out value="${pdto.totalCount}" /></p>
<p>page	 Num: <c:out value="${pdto.pageNum}" /></p>
<p>list Num: <c:out value="${pdto.listNum}" /></p>
<p>block Num: <c:out value="${pdto.blockNum}" /></p>
<p>start Page: <c:out value="${pdto.startPage}" /></p>
<p>end   Page: <c:out value="${pdto.endPage}" /></p>
<p>is	 Prev: <c:out value="${pdto.isPrev}" /></p>
<p>is	 Next: <c:out value="${pdto.isNext}" /></p>
<p>is	 BPrev: <c:out value="${pdto.isBPrev}" /></p>
<p>is	 BNext: <c:out value="${pdto.isBNext}" /></p>
<hr>
<p>list: <c:out value="${list}" /></p>
<hr>

<c:forEach items="${list}" var="MemberDTO">
					<td>${MemberDTO.user_idx}</td>
					<!-- 다른 필드들도 필요에 따라 출력 -->
			</c:forEach>
			
		
			
		<div class="pagination">
		<c:if test="${pdto.isPrev eq true }">
		<button class="page-btn">
    		<a href="/web/membermybatis/memberList-paging?pageNum=${pdto.pageNum - 1}">이전</a>
		</button>

		</c:if>
		
		
		<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="pageNumber">
				
				<c:choose>
					<c:when test="${pageNumber eq pdto.pageNum}">
				        <button >${pageNumber}</button>
					</c:when>
					<c:otherwise>
						<button class="page-btn">
    						<a href="/web/membermybatis/memberList-paging?pageNum=${pageNumber}">${pageNumber}</a>
						</button>

					</c:otherwise>
				</c:choose>
				
		</c:forEach>
		
        
        
        <c:if test="${pdto.isNext eq true }">
        <button class="page-btn">
    						<a href="/web/membermybatis/memberList-paging?pageNum=${pdto.pageNum + 1}">다음</a>
		</button>
		</c:if>
    </div>


</body>
</html>
<%@page import="com.myweb.dto.AdminNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     

	<!-- Object attribute = request.getAttribute("num");
	int num = 0; // 기본값 설정

	if (attribute != null && attribute instanceof Integer) {
	    num = ((Integer) attribute).intValue(); // intValue() 메서드 사용
	} -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminlist.jsp</title>
</head>
<body>
<%@include file="../topmenu.jsp" %>





<hr>

<form action="/web/adminnotice/adminlist" method="post">
							<select name="listNum"
								class="form-select" aria-label="Default select example">
								<!-- 선택 목록 -->
								<option value="5">5</option>
								<option value="10" selected>10</option>
								<option value="20" >20</option>
							</select>
							<select name="slt">
								<!-- 선택 목록 -->
								<option value="title">제목</option>
								<option value="content" selected>제목or내용</option>
							</select>
        <input id = "search" type="text" name="str" placeholder="검색어를 입력하세요">
        <button type="submit">검색</button>
 </form>
 
 <script>
var searchValue = $("#search").val();
 </script>

<hr>
<!--  테이블 시작-->
			<table>
					<tr>
					<!-- 다른 필드들도 필요에 따라 출력 -->
					<th>idx</th>
					<th>title</th>
					<th>content</th>
					<th>nickname</th>
					<th>total count</th>
					</tr>
					<tr>
<c:forEach items="${list}" var="AdminNoticeDTO">
					
			<td><a href="/web/adminnotice/adminview?idx=${AdminNoticeDTO.idx}&totalcount=${AdminNoticeDTO.totalcount}">${AdminNoticeDTO.idx} |</a></td>
    		<td><a href="/web/adminnotice/adminview?idx=${AdminNoticeDTO.idx}&totalcount=${AdminNoticeDTO.totalcount}">${AdminNoticeDTO.title} |</a></td>
   			<td><a href="/web/adminnotice/adminview?idx=${AdminNoticeDTO.idx}&totalcount=${AdminNoticeDTO.totalcount}">${AdminNoticeDTO.content} |</a></td>
   			 <td><a href="/web/adminnotice/adminview?idx=${AdminNoticeDTO.idx}&totalcount=${AdminNoticeDTO.totalcount}">${AdminNoticeDTO.nickname} |</a></td>
   			 <td><a href="/web/adminnotice/adminview?idx=${AdminNoticeDTO.idx}&totalcount=${AdminNoticeDTO.totalcount}">${AdminNoticeDTO.totalcount} </a></td>
  
					</tr>
			</c:forEach>
			
			
			</table>

<!-- 페이징 처리값 세팅 -->
		<div class="pagination">
		<c:if test="${pdto.isPrev eq true }">
		<button class="page-btn">
    		<a href="/web/adminnotice/adminlist?pageNum=${pdto.pageNum - 1}&str=${str}">이전</a>
		</button>

</c:if>
		
		
		<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="pageNumber">
				
				<c:choose>
					<c:when test="${pageNumber eq pdto.pageNum}">
				        <button >${pageNumber}</button>
					</c:when>
					<c:otherwise>
						<button class="page-btn">
    						<a href="/web/adminnotice/adminlist?pageNum=${pageNumber}&str=${str}">${pageNumber}</a>
						</button>

					</c:otherwise>
				</c:choose>
				
		</c:forEach>
		
        
        
        <c:if test="${pdto.isNext eq true }">
        <button class="page-btn">
    						<a href="/web/adminnotice/adminlist?pageNum=${pdto.pageNum + 1}&str=${str}">다음</a>
		</button>
		</c:if>
    	<a href="/web/adminnotice/adminwrite">글쓰기</a>
    
    </div>
	

니 아이디임 : <%=session.getAttribute("user_id") %>
니 닉네임임 : <%=session.getAttribute("nickname") %>




</body>
</html>
<%@page import="com.myweb.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>name/tourlist.jsp</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/top2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
</head>
<body>
	<%@include file="../topmenu.jsp"%>
	<main>
		<h1>hotellist</h1>
		<h4>
			<form action="/web/name/hotellist" method="post">
				<select name="listNum" class="" aria-label="Default select example">
					<!-- 선택 목록 -->
					<option value="5" selected>5</option>
					<option value="10">10</option>
					<option value="20">20</option>
				</select> 
				<select name="slt">
					<!-- 선택 목록 -->
					<option value="name">이름</option>
					<option value="nickname" selected>이름or닉네임</option>
				</select>
				 <input type="text" name="str" placeholder="검색어를 입력하세요">
				<button type="submit">검색</button>
			</form>
			<hr>
			<h6>
			<strong>
			<ul>
			<il>총 게시물 : ${pdto.totalCount}</il>
			<il>총 페이지 : ${pdto.totalPage}</il>
			<il> now : ${pdto.pageNum}</il>
			</ul>
			</strong>
			</h6>


			<c:forEach var="hn" items="${hnlist}" varStatus="statusNm">
				<c:choose>
					<c:when test="${statusNm.index % 5 == 0}">
						<div class="card-group">
					</c:when>
				</c:choose>

				<c:forEach var="fn" items="${fnlist[statusNm.index]}"
					varStatus="status">
					<li>
						<div style="position: relative; display: inline-block;">
							<div class="card" style="width: 18rem;">
								<a href="../name/hview?name=${hn}"> <img
									src="${pageContext.request.contextPath}/resources/img/${fn}"
									class="card-img-top" alt="...">
									<button style="position: absolute; top: 20px; left: 20px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-bookmark-plus"
											viewBox="0 0 16 16">
  <path	d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
  <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z" />
</svg>
									</button>
									<div class="card-body">
										<p class="card-text">
											<strong>${hn}</strong>
										</p></a>
							</div>
						</div>
						</div>
					</li>
				</c:forEach>

				<c:choose>
					<c:when test="${statusNm.index % 5 == 4 or statusNm.last}">
						</div>
					</c:when>
				</c:choose>
			</c:forEach>

			<hr>

			<!-- 페이징 처리값 세팅 -->
			<ul class="pagination">
				<c:if test="${pdto.isPrev eq true }">
					<li class="page-btn"><a
						href="/web/name/hotellist?pageNum=${pdto.pageNum - 1}&str=${str}&listNum=${listNum}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}"
					var="pageNumber">

					<c:choose>
						<c:when test="${pageNumber eq pdto.pageNum}">
							<li class="page-btn"><a href="javascript:void(0);"
								style="cursor: default;">${pageNumber}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-btn"><a
								href="/web/name/hotellist?pageNum=${pageNumber}&str=${str}&listNum=${listNum}">${pageNumber}</a>
							</li>

						</c:otherwise>
					</c:choose>

				</c:forEach>
				<c:if test="${pdto.isNext eq true }">
					<li class="page-btn"><a
						href="/web/name/hotellist?pageNum=${pdto.pageNum + 1}&str=${str}&listNum=${listNum}">다음</a>
					</li>
				</c:if>
			</ul>

		</h4>
	</main>
</body>
</html>





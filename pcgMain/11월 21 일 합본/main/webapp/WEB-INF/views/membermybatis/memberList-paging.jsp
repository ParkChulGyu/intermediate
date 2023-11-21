<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.myweb.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="loginCheck-mapper.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">









<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top2.css">
<meta charset="UTF-8">
<title>memberList.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminpage.css">
</head>
<body>
<%@include file="../topmenu.jsp" %>
<!-- 탑메뉴 넣기-->
<main>
<%@include file="adminsubmenu.jsp" %>


<div class="memberlist-paging">
<h2>페이징 값 확인</h2>
<hr>
<p>Total Count: <c:out value="${pdto.totalCount}" /></p>



<form action="/web/membermybatis/memberList-paging" method="post">
							<select name="listNum"
								class="form-select" aria-label="Default select example">
								<!-- 선택 목록 -->
								<option value="5">5</option>
								<option value="10" selected>10</option>
								<option value="20" >20</option>
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
<!--  테이블 시작-->
			<table>
			<!-- 선택  all 테이블 체크박스 -->
					<tr><td>
					<button class="delete">삭제</button>
					</td>
					<td>
					<label for="th_checkAll">전체선택</label>
	        		<input type="checkbox" id="th_checkAll" onclick="checkAll();">
					</td></tr>
					<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이름</th>
					<th>이름</th>
					<th>이름</th>
					<th>이름</th>
					</tr>
			
			<c:forEach items="${list}" var="MemberDTO">
					<tr>
					<!-- 다른 필드들도 필요에 따라 출력 -->
					<td><input class="chk"  type="checkbox" name="checkRow" id="${MemberDTO.user_id}" value="${MemberDTO.user_id}"></td>
					<td>${MemberDTO.user_idx}</td>
					<td>${MemberDTO.nickname}</td>
					</tr>
			</c:forEach>
			
			
			</table>
		
			<!-- 페이징 처리값 세팅 -->
		<div class="pagebtn">
			<ul class="pagination">
				<c:if test="${pdto.isPrev eq true }">
					<li class="page-btn"><a
						href="/web/membermybatis/memberList-paging?pageNum=${pdto.pageNum - 1}&str=${str}&listNum=${pdto.listNum}">이전</a>
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
								href="/web/membermybatis/memberList-paging?pageNum=${pageNumber}&str=${str}&listNum=${pdto.listNum}">${pageNumber}</a>
							</li>

						</c:otherwise>
					</c:choose>

				</c:forEach>
				<c:if test="${pdto.isNext eq true }">
					<li class="page-btn"><a
						href="/web/membermybatis/memberList-paging	?pageNum=${pdto.pageNum + 1}&str=${str}&listNum=${pdto.listNum}">다음</a>
					</li>
				</c:if>
			</ul>
		
		<hr >
		</div>
		
		
 
</div>






















 <script>
//체크박스 전체선택, 전체 해체	
	function checkAll() {
		if( $("#th_checkAll").is(':checked') ){
		$("input[name=checkRow]").prop("checked",true);
		}else{
			$("input[name=checkRow]").prop("checked",false);
		}
	}
	
	function deleteAction(){
		console.log("deleteAction 시작");
		var cnt = $("input[name='checkRow']:checked").length;
		let arr= [];
		var value = $("input[name='checkRow']:checked").val();
		console.log(value);
		$("input[name='checkRow']:checked").each(function(index) {
			   var bChecked = $(this).prop('checked');
			 // arr.push($(this).attr(value));
			  var value = $(this).val();
			   arr.push(value);
			  
		});
		console.log(arr);
		console.log("deleAc 성공");
		
		if(cnt == 0) { alert("선택된 글이 없습니다.");  }
		else{
		 console.log("ajax실행");
		 var user_id = arr;
		 console.log("id 체크 : " + user_id);
          $.ajax({
              // get방식일때만 사용 contentType : 'application/json',
			//contentType : 'application/json',
                type: "POST",
                traditional : true,
                url: "../membermybatis/memberdelete",
                data:  {user_id},
                dataType:"json",
                success: function(response){
                	console.log("response 체크 :" + response);
                    if(response == 1) {  alert("삭제 성공");  
                    window.location.reload() }
                    else{ alert("삭제 실패");  } },
                error: function(){alert("서버통신 오류");}
                    });
        } }
	
	
$(function(){ // onload 삭제
		$('.delete').click( function(){  
		deleteAction()
	});	
});
	
	
	
	
 </script>	
    
    
</main>
</body>
</html>
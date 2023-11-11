<%@page import="com.myweb.dto.AdminNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<%
	String nickname = (String) session.getAttribute("nickname"); 
	
	%>
	
	



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New.jsp</title>
</head>
<body>
<%@include file="../topmenu.jsp" %>
<!--
파일 첨부 시 form 태그가 반드시 가져야 할 속성
method="post"
enctype="multipart/form-data"
  -->
  
  
 dfd ${dto.idx }
<form action="reply_insert" method="post" enctype="multipart/form-data">    
	<input type="hidden" name="idx" value="${dto.idx }"/>
	<input type="hidden" name="root" value="${dto.root }" />
	<input type="hidden" name="step" value="${dto.step }" />
	<input type="hidden" name="indent" value="${dto.indent }" />
	
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${nickname}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
					<!-- <img src="img/select.png" class="file-img" /> -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
  							<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
  							<path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-left: 20px;"><i class="fas fa-times font-img"/></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</a>
	<a class="btn-empty" href="detail?idx=${dto.idx }">취소</a>
</div>



<script>
/**
 * 입력 항목에 입력되어 있는지 반환하는 함수
 */
 function necessary() {
 	$('.need').each(function(){
 		if($(this).val() == "") {
 			alert("입력하세요!");
 			$(this).focus();
 			need = false;
 			return need;
 		}else{
 			need=true;
 		}
 		console.log(need);
 	});
 	return need;
 }
 
 $('[name=title]').on('keypress', function(e) {
	    if (e.key === 'Enter') {
	        e.preventDefault(); // 기본 엔터 동작 방지
	        if (necessary()) {
	            $('form').submit();
	        } else {
	            return false;
	        }
	    }
	});
 
 
 
 
 /**
  * 첨부파일 관련 처리
  */
  /* 파일을 선택했을 때 파일명이 보이게 처리 */
 $('#attach-file').on('change', function(){
	 	$('#file-name').text( this.files[0].name );
	 	$('#delete-file').css('display', 'inline');
	 });
	 $('#delete-file').on('click', function(){
	 	$('#file-name').text('');
		$('#delete-file').css('display', 'none');
		$('#attach-file').val('');
	 });
 
</script>
	






</body>
</html>
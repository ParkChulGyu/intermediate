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

<<!-- 
 - 파일 첨부 시 form 반드시 갖고 있어야 할 속성 
	1. 반드시 method는 post이어야만 한다.
	2. enctype을 지정한다. ▶ enctype='multipart/form-data'
-->
<form action="../Qna/update" method="post" enctype="multipart/form-data">                                        
	<input type="hidden" name="idx" value="${dto.idx }"/>
	<input type="hidden" name="attach" />
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input class="need" type="text" name="title" value="${dto.title }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="need" name="content">${dto.content }</textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input id="attach-file" type="file" name="file" />
					<!-- <img src="img/select.png" class="file-img" /> -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
  							<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
  							<path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
				</label>
				<span id="file-name">${dto.filename }</span>
				<span id="delete-file" style='display:${empty dto.filename ? "none" : "inline"}; color:red; margin-left:20px;'><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) { $('[name=attach]').val($('#file-name').text()); $('form').submit(); }">저장</a>
	<a class="btn-empty" href="detail?idx=${dto.idx }">취소</a>
	<!-- <a class="btn-empty" href="javascript:history.go(-1)">취소</a> -->
</div>



<script>
	/**
	 * 입력 항목에 입력되어 있는지 반환하는 함수
	 */
	 function necessary(){
			var need = true;
			$('.need').each(function(){
				if( $(this).val()=='' ){
					alert( '입력하세요!' );
					$(this).focus();
					need = false;
					return need;
				}
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
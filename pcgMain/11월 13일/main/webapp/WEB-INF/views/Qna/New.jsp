<%@page import="com.myweb.dto.AdminNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     

	
	
	
	<style>
	@charset "UTF-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

body {
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

a:link, a:visited {
	text-decoration: none;
	color: #000;
}

#content {
	padding: 20px 0;
	min-width: 1024px;	/* 창의 최소 크기 지정 */
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

table {
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse;	/* 테두리 겹침 설정 collapse: 겹치지 않게 처리 */
}

table th, table td {
	border: 1px solid;
	padding: 5px 10px;
}

table td a:hover { font-weight: bold; }

.btnSet { margin-top: 20px;	}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border:1px solid #3367d6;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill { 
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty { 
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border:1px solid #c4dafc
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	font-size: 13px;
}

a.btn-fill-s { 
	background-color: #bacdfa;
}

a.btn-empty-s { 
	background-color: #fff;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover { cursor:pointer; }

input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}

input[type=radio] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

table tr td label:not(:last-child) {
	margin-right: 20px;	
}

.w-pct60 { width: 60% }
.w-pct70 { width: 70% }
.w-pct80 { width: 80% }
.w-px40 { width: 40px }
.w-px60 { width: 60px }
.w-px80 { width: 80px }
.w-px100 { width: 100px }
.w-px120 { width: 120px }
.w-px140 { width: 140px }
.w-px160 { width: 160px }
.w-px180 { width: 180px }
.w-px200 { width: 200px }

.left { text-align: left }
.right { text-align: right }

.font-img { cursor: pointer; }

ul { list-style: none; padding: 0; }
#list-top{ width: 80%; padding: 20px 10%;}
#list-top ul { margin:0; display:flex; }
#list-top ul:last-child { float: right; }
#list-top div { width: 100%;  }
#list-top ul li * { vertical-align:middle; }

input[name=title] { width:calc(100% - 14px) }
textarea[name=content] { width:calc(100% - 6px); height: 150px; resize: none;}

/* 파일 첨부 */
.file-img { width: 18px; height:18px; cursor:poinrter; }
#attach-file, #delete-file { display:none; }
출처: https://upcake.tistory.com/346 [오늘이라도:티스토리]
	
	
	
	</style>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New.jsp</title>
</head>
<body>
<%@include file="../topmenu.jsp" %>


<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form action="insert" method="post" enctype="multipart/form-data">


	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>작성자${idx }</th>
			<td>${nickname }</td>
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
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
  							<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
  							<path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
				파일 업로드
					<!-- <img src="img/select.png" class="file-img" /> -->
				</label>
				<span id="file-name" name="attachedFile"></span>
				<span id="delete-file" style="color: red; margin-lefT: 20px;"><i class="fas fa-times font-img" ></i></span>
 			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<!--  <a class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</a> -->
	<a class="btn-fill" onclick="if (necessary()) { $('form').submit(); }">저장</a>
	<a class="btn-empty" href="Qna">취소</a>
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
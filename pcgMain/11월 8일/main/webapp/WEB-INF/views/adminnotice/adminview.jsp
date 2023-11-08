<%@page import="com.myweb.dto.AdminNoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("utf-8");
	
	AdminNoticeDTO	one = (AdminNoticeDTO)request.getAttribute("one");
	
	int lastidx = Integer.parseInt(request.getAttribute("lastidx").toString());
	int nextidx = Integer.parseInt(request.getAttribute("nextidx").toString());
	int lasttotalcount = Integer.parseInt(request.getAttribute("lasttotalcount").toString());
	int nexttotalcount = Integer.parseInt(request.getAttribute("nexttotalcount").toString());
	String lasttitle = (String)request.getAttribute("lasttitle");
	String nexttitle = (String)request.getAttribute("nexttitle");
	
	
	String nickname = (String)session.getAttribute("nickname");
	
	

%>
	<!--String before = (String)request.getAttribute("before");
	
	String next = (String)request.getAttribute("next"); -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminview.jsp</title>
</head>
<body>
<%@include file="../topmenu.jsp" %>



	<table>
				<tr>
					<!-- 다른 필드들도 필요에 따라 출력 -->
					<th>idx</th>
					<th>>title</th>
					<th>>content</th>
					<th>>nickname</th>
					<th>total count</th>
					</tr>
					<tr>
					
	<td><%=one.getIdx()%> </td>
	<td><%=one.getTitle()%></td>
	<td><%=one.getContent()%></td>
	<td><%=one.getNickname() %></td>
	<td><%=one.getRegdate() %></td>
		<td> <%=one.getTotalcount() %></td>
					
					</tr>
	</table>





<div class="my-3 p-3 bg-white rounded shadow-sm">
	<c:choose >
	<c:when test="${nexttitle != null}">
	
	<a href="/web/adminnotice/adminview?idx=<%=nextidx%>&totalcount=<%=nexttotalcount %>">다음</a> : <%=nexttitle %>
	</c:when>
	
	<c:when test="${nexttitle == null}">
	<a disabled>다음글이 없습니다</a>
	</c:when>
	</c:choose>
	<br/>
	<c:choose>
	<c:when test="${lasttitle != null}">
	<a href="/web/adminnotice/adminview?idx=<%=lastidx%>&totalcount=<%=lasttotalcount %>">이전</a> : <%=lasttitle %>
	</c:when>
	
	<c:when test="${lasttitle == null}">
	<a>이전글이 없습니다</a>
	</c:when>
	</c:choose>

</div>









<a href="../adminnotice/adminlist">목록</a>

<!-- 댓글 -->

${one.idx }
<div class="collapse" id="reply_card${one.idx }">
	<section class="modal-section">
	<div class="card card-body">
	<!-- 댓글 목록 -->
	<div class="reply-list${one.idx}">
	<!-- 댓글이 들어가는 곳 -->
	</div> 
	<!-- 댓글 작성 => 로그인한 상태여야만 댓글 작성 칸이 나온다. -->
	<!-- <c:if test="$not empty sessionScope.nickname}">                </c:if>-->
	<div class="row reply_write">
	<div class="col-1">
	
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16"   onclick="ReplyList(${one.idx })">
  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
</svg>

	</div>
	<div class="col-8 class="input_reply_div">
		<input class="w-100 form-control" id="input_reply${one.idx }"
		type="text" placeholder="댓글입력...">
		
	</div>
	<div class="col-3">
	<button type="button" bidx="${one.idx}"
		class="write_rereply">댓글&nbsp;달기</button>
	</div>
	</div>
	
	</div>
	</section>
</div>

<script>
//댓글
// 게시물의 댓글 목록을 불러오는 함수
const ReplyList = function(idx) {
	console.log("idx 체크 " + idx );
	 $.ajax({
		 url : 'picture_replyList',
	 	type : 'get',
	 	data : {
	 		idx : idx
	 	},
	 	success : function(data) {
	 		console.log("댓글 리스트 가져오기 성공");
	 		console.log(data);
	 		let listHtml = "";
	 		for(const i in data){
	 			let idx = data[i].idx;
	 			let bidx = data[i].bidx;
	 			let grp = data[i].grp;
	 			let grps = data[i].grps;
	 			console.log("모댓글일땐 0, 답글일땐 1  " + grpl )
	 			let grpl = data[i].grpl;
	 			let writer = data[i].writer;
	 			let content = data[i].content;
	 			let regdate = data[i].regdate;
	 			let wgap = data[i].wgap;
	 			
	 			console.log("모댓글일땐 0, 답글일땐 1  " + grpl )
	 			
	 			listHtml += "<div class='row replyrow reply" + idx + "'>";
	 			
	 			if(content==""){        //삭제된 댓글일때
	 				listHtml += "       <div>";
	 				listHtml += "            (삭제된 댓글입니다);"
	 				listHtml += "            <div>;"
	 			}else{
	 				if(grpl == 0) { //모댓글일때
	 					listHtml +=  '<div class="col-1">';
	 					listHtml += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-dots' viewBox='0 0 16 16'>";
	 					listHtml += " <path d='M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z'/>";
	 					listHtml +=	 "<path d='m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z'/>";
	 					listHtml +=	"</svg>";
	 					listHtml += " </div>";
	 					listHtml += " <div class='rereply-content col-8'>";
	 					listHtml += " <div>";
	 					listHtml += " <span>";
	 					listHtml += " <b>" + writer + "</b>";
	 					listHtml += " </span>";
	 					listHtml += " <span>";
	 					listHtml += content;
	 					listHtml += " </span>";
	 					listHtml += " </div>";
	 					//현재 로그인 상태일때 답글작성 버튼이 나온다
	 					if("${nickname}" != ""){
	 						listHtml += "            <div>";
	 						listHtml += "                    <a href='javascript:' idx='" + idx +"' grpl='" + grpl +"' bidx='" + bidx + "' grp='" + grp +"' class='reply_delete'>삭제</a>";
	 						listHtml += " </div>";
	 					}
	 				}
	 			
	 				listHtml += "    </div>";
	 				//댓글에 답글달기를 누르면 답글입력란이 나온다.
	 				//------답글입력란
	 				listHtml += " <div class='collapse row rereply_write' id='re_reply" + idx +"'>";
	 				
	 			
	 				listHtml += " <div class='col-1'>"; // div 열기
	 				listHtml += " <a href='other_profile.do?other_nick=" + writer + "'>"; // 링크 열기
	 				listHtml += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-dots' viewBox='0 0 16 16'>"; // SVG 열기
	 				listHtml += " <path d='M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z'/>"; // SVG path 열기
	 				listHtml += "<path d='m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z'/>"; // 다른 SVG path 열기
	 				listHtml += "</svg>"; // SVG 닫기
 					listHtml += " </a>";
 					listHtml += " </div>";
 					listHtml += " <div class='col-7'>"
 					listHtml +="   <input class='w-100 input_rereply_div form-control' id='input_rereply" + idx +"' type='text' placeholder='댓글입력...'>"
	 				listHtml +="</div>"
	 				listHtml +="  <div class='col-3'>"
	 				listHtml +="<button type='button' class='write_rereply' idx='" + idx + "' bidx='" + bidx + "'>답글&nbsp;달기</button>"
	 				listHtml +="</div>";
	 				listHtml +="</div>";
	 				// 답글입력란 끝
	 				
	 			}
				listHtml +="</div>";	 				
	 		};
	 		
	 		//댓글 리스트 부분에 받아온 댓글 리스트를 넣기
	 		$(".reply-list" + idx).html(listHtml);
	 		//답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click evnet를 아래처럼 jquery로 처리한다.
	 		$('.write_rereply').on('click', function() {
	 			console.log("dfdfdfdf");
	 			console.log('idx'+ $(this).attr('idx') );
	 			console.log( 'bidx' +  $(this).attr('bidx'));
	 		//답글을 DB에 저장하는 함수를 호출한다. bidx와 idx를 같이 넘겨준다.
			 WriteReReply($(this).attr('bidx'), $(this).attr('idx'));
	 			
	 		});
	 		$('.reply_delete').on('click', function(){
	 			//모댓글 삭제일때
	 		if($(this).attr('grpl') == 0){
	 			DeleteReply($(this).attr('idx'), $(this).attr('bidx'));
	 			//답글 삭제일때
	 		}else{
	 			DeleteReREply($(this).attr('idx'), $(this).attr('bidx', $(this).attr('grp')))
			}
	 		
	 	
	 })
},

	error : function() {
		alert('서버 에러');
		}
	 });
};


const WriteReReply = function(bidx,idx) {
	
	console.log("idx 체크 : "  + idx);
	console.log("bidx 체크 : "  + bidx);
	
	console.log($("#input_rereply" + idx).val());
	
	// 댓글 입력란의 내용을 가져온다.
	// "" 를 붙인 이유 => 앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기 위함)
	
	let content = $("#input_rereply" + idx).val();
//	content = content.trim();
	
	
	if(content ==""){ // 입력된게 없을 때
		alert("글을 입력하세요!");
	}else{
		// 입력란 비우기
		$("#input_rereply" + idx).val("");
		
		//reply+1 하고 그 값을 가져옴
		$.ajax({
			url : 'picture_write_rereply',
			type : 'get',
			data : {
				
				bidx : bidx,
				content : content
			},
			success : function(pto){
				let reply = pto.reply;
				//페이지, 모달창에 댓글수 갱신
				$('#m_reply' + bidx).text(reply);
				$('#reply'+bidx).text(reply);
				
				console.log("답글 작성 성공");
				//게시물 번호(bidx)에 해당하는 댓글리스트를 새로 받아오기
				ReplyList(bidx);

				picture_reply_up;
				
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};
};









//모댓글 삭제일때




// 답글 삭제일때







</script>








</body>
</html>
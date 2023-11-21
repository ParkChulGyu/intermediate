<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<header>
        <div class="logo">
            <a href="#">
            
                <img  class = "logoimg"src="${pageContext.request.contextPath}/resources/img/main-logo4.jpg" alt="logo">
            </a>
        </div> <!--로고 영역-->
        <nav>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/name/namelist">목록 검색</a>
                </li>
                <li>
                    <!--주메뉴-->
                    <a href="#">게시판</a>
                    <!--서브메뉴-->
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/adminnotice/adminlist">자유게시판</a></li>
                        <li><a href="${pageContext.request.contextPath}/Qna/Qna">QnA Board</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" >List List</a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/name/culturelist">문 화</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/tourlist">관 광</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/reslist">음식점</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/hotellist">숙 박</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" id = "checkcount" ></a>
                    <ul class="sub" id="myList">
                        
                    </ul>
                </li>
            </ul>
        </nav> <!--네비게이션(GNB) 영역 end-->
        
        <!-- 맴버 영역 -->
        


        
        
                <% if (session.getAttribute("user_id") == null) { %>
        <div class="top_menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/membermybatis/login-mapper">로 그 인 |</a></li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/join-mapper">회원 가입 |</a></li>
            </ul>
        </div> <!--로그인 회원가입 주문내역 마이페이지-->
                <!-- 위 로그인 전 아래 로그인 후 -->
				<% } else { %>	
        <div class="top_menu">
            <ul>
           	 	<li> <%=session.getAttribute("nickname") %>(<%=session.getAttribute("user_id") %>) </li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/logout-mapper">로그 아웃 |</a></li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/main-mapper">내 정보 |</a></li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/memberList-paging">관리자 페이지 |</a></li>
                <li><a href="#"> 담아두기 |</a></li>
                    <img src="img/header_ico_cart.jpg" alt="cart">
                  

            </ul>
        </div> <!--로그인 회원가입 주문내역 마이페이지-->
				<% } %>

    </header>
<script>


function alramList(){
	
	var toid = '<%=session.getAttribute("nickname") %>';
	
	 $.ajax({
	        url : '${pageContext.request.contextPath}/alarm/alramList',
	        type : 'get',
	        data : {toid : toid} ,
	        dataType : "json", 
	        success : function(data){
	         	var a='';
	         		for(const i in data){
	 			let idx = data[i].idx;
	 			let toid = data[i].toid;
	 			let fromid = data[i].fromid;
	 			let bidx = data[i].bidx;
	 			let bgidx = data[i].bgidx;
	 			let step = data[i].step;
	 			let title = data[i].title;
	 			let category = data[i].category;
	 			let readcheck = data[i].readcheck;
	 			var titles = title.replace(/@\S+/g, '');
	 			if (titles.length > 10) {
	 				titles = titles.substring(0, 10) + '...';
	 			}
	         		 
	 			//alarmClick();
	 		
	 				
	 			
           		if (category =="Qna"){
	 			a = '<li><a href="#" onclick=" alarmRead('+idx+ ');alarmClick('+bidx+');">' + fromid + ' 님께서 ' + title + '에 답변을 다셨습니다</a></li>';
           		}else if(category =="admin"){
	 			a = '<li><a href="/web/adminnotice/adminview?idx=' + bidx + '" onclick="alarmRead('+idx+ ')">' + fromid + ' 님의 댓글 <span>' + titles + '</span></a></li>';
           		}   
           			
	 		
            
	         		 
	         	 $('#myList').append(a);
	         	 };
	         	 
	         	 
	        }
	        
	    
	    });
	 }




const alarmRead = function(idx) {
	
	
	
		$.ajax({
			url : '${pageContext.request.contextPath}/alarm/alarmRead',
			type : 'get',
			data : {
				idx : idx
				
			},
			success : function(pto){
				
			alert('성공');
				
				
			},
			error : function() {
				alert('서버 에러');
			}
		});
	};


const alarmClick = function(bidx) {
	
	
	
	
	$.ajax({
		url : '${pageContext.request.contextPath}/alarm/alarmClick',
		type : 'get',
		 dataType : "json",
		data : {
			
			bidx : bidx
		
		},
		success : function(pto){
			
		
			location.href="/web/Qna/detail?idx="+pto.idx+"";
			
		},
		error : function() {
			alert('서버 에러');
		}
	});
};


const checkcount = function() {
	
	
	var toid = '<%=session.getAttribute("nickname") %>';
	
	
	$.ajax({
		url : '${pageContext.request.contextPath}/alarm/checkcount',
		type : 'get',
		 dataType : "json",
		data : {
			
			toid : toid
		
		},
		success : function(checkcount){
			
			 $('#checkcount').html(checkcount + '개의 답변이 도착했습니다');
			
		
			
			
		},
		error : function() {
			alert('서버 에러');
		}
	});
};




window.onload = function () {
	
	alramList();
	
	checkcount();
	
	
	
}





</script>


 

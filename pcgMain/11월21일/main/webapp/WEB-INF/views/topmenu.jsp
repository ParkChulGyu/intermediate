<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
        <div class="logo">
            <a href="${pageContext.request.contextPath}">
            
                <img class="logoimg" src="${pageContext.request.contextPath}/resources/img/main-logo4.jpg" alt="logo">
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
                        <li><a href="${pageContext.request.contextPath}/adminnotice/adminlist">자유</a></li>
                        <li><a href="#">QnA</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">List List</a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/name/culturelist">문 화</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/tourlist">관 광</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/reslist">음식점</a></li>
                        <li><a href="${pageContext.request.contextPath}/name/hotellist">숙 박</a></li>
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
          	 	 <li><%=session.getAttribute("nickname") %></li>
           	 	<li> (<%=session.getAttribute("user_id") %>) </li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/logout-mapper">로그 아웃 |</a></li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/main-mapper">내 정보 |</a></li>
                <li><a href="${pageContext.request.contextPath}/membermybatis/memberList-mapper">관리자 페이지 |</a></li>
                <li><a href="${pageContext.request.contextPath}/name/cartlist"> 담아두기 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hearts" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.931.481c1.627-1.671 5.692 1.254 0 5.015-5.692-3.76-1.626-6.686 0-5.015Zm6.84 1.794c1.084-1.114 3.795.836 0 3.343-3.795-2.507-1.084-4.457 0-3.343ZM7.84 7.642c2.71-2.786 9.486 2.09 0 8.358-9.487-6.268-2.71-11.144 0-8.358Z"/>
</svg>|</a></li>

            </ul>
        </div> <!--로그인 회원가입 주문내역 마이페이지-->
				<% } %>
    </header>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage navigation bar</title>
</head>
<body>
<div class=" container-scroller">
		<!-- 		  상단바 -->
		<nav
			class="navbar navbar-default col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="navbar-menu-wrapper d-flex align-items-center">
				<button class=" navbar-toggler   navbar-dark align-self-center mr-5"
					type="button" data-toggle="minimize">

					<div id="header" class="header-scrolled2">
						<div class="container">
							<div class="row  justify-content-between d-flex">
								<div id="logo">
									<a href="index.html"></a>
								</div>
								<nav id="nav-menu-container">
									<ul class="nav-menu2">
										
										
										
										
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="departments.html">회사소개</a></li>
						<li><a href="departments.html">마이페이지</a></li>
						<li><a href="#">요양 정보</a>
							<ul>
								<li><a
									href="${cp}/basicU/main">요양보호소
										찾기 </a></li>
								<li><a href="${cp}/basicU/findingCareWorker">요양원/요양병원
										찾기</a></li>
								<li><a href="${cp}/basicU/findingCareWorker">기관 정보 조회</a></li>
							</ul></li>

						<li class="menu-has-children"><a href="">커뮤니티</a>
							<ul>
								<li><a href="about.html">공지사항</a></li>
								<li><a href="about.html">자유게시판</a></li>
								<li><a href="elements.html">QnA</a></li>
							</ul></li>
							
							
						<li class="menu-has-children"><a href="">건강정보</a>
							<ul>
								<li><a href="blog-home.html">인지 능력 향상 프로그램</a></li>
								<li><a href="blog-home.html">인지테스트</a></li>
								<li><a href="blog-home.html">스트레스 지수 </a></li>
								<li><a href="blog-home.html">수면상태</a></li>
										<li><a href="blog-home.html">GPS</a></li>
							</ul></li>
							
						<li class="menu-has-children"><a href="">기타 문화 정보</a>
							<ul>
								<li><a href="blog-home.html">무더위 쉼터</a></li>
								<li><a href="blog-home.html">문화시설</a></li>
						
							</ul></li>
										
										
										
										
									</ul>
								</nav>
							</div>
						</div>
					</div>
					<hr>
					<br>
				</button>
			</div>
		</nav>

</body>
</html>
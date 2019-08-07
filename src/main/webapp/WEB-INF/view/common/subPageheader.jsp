<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BASIC</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>


</head>
	


	<div id="header"  class="header-scrolled2">
		<div class="container">
			<div class="row  justify-content-between ">
				<div id="logo">
					<a href="index.html"></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
					
					
					
					
		
					<c:if test="${MEM_INFO.mem_grade!=0}">
					<li class="" ><a href="">
					</a></li>
					</c:if>
					
						
						<li class="" ><a href="${cp}/main">Home</a></li>
						<li><a href="">회사소개</a></li>
						<li><a href="">마이페이지</a></li>
						<li><a href="">요양 정보</a>
							<ul>
<%-- 								<li><a href="${cp}/basicU/main">요양보호소찾기 </a></li> --%>
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
								<li><a href="${cp}/mypage/stress?mem_id=${MEM_INFO.mem_id}">스트레스 지수 </a></li>
								<li><a href="${cp}/mypage/gpxMap?mem_id=${MEM_INFO.mem_id}">GPS 정보</a></li>
								<li><a href="blog-home.html">GPS</a></li>
							</ul></li>

						<li class="menu-has-children"><a href="">기타 문화 정보</a>
							<ul>
								<li><a href="blog-home.html">무더위 쉼터</a></li>
							<li><a href="${cp}/lecture/lectureMain">문화.강좌 정보</a></li>
							</ul></li>
							
							<c:if test="${MEM_INFO.mem_grade==0}">
							
							 <li class="menu-has-children"><a href="">관리자 메뉴 </a>
			<ul>
			<li><a href="${cp}category/categoryList">메뉴관리</a></li>
					<li><a href="${cp}/lecture/lectureListManagement">메뉴관리</a></li>
			
			</ul></li>
							</c:if>
							
							
                           

							
							
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<br>
	<br>
	<hr>



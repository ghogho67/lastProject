<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav id="nav-menu-container">
	<ul class="nav-menu">
		<li class="menu-active"><a href="${cp}/main">Home</a></li>
		<li><a href="departments.html">회사소개</a></li>
	<c:choose>
				<c:when test="${MEM_INFO.mem_grade==0}"><li><a href="${cp}mypage/Admin_Info">마이페이지</a></li></c:when>
				<c:when test="${MEM_INFO.mem_grade==1}"><li><a href="${cp}mypage/Patient_Info">마이페이지</a></li></c:when>
				<c:when test="${MEM_INFO.mem_grade==2}"><li><a href="${cp}mypage/Patient_Info">마이페이지</a></li></c:when>
				<c:otherwise> <li><a href="${cp}mypage/Worker_Info">마이페이지</a></li> </c:otherwise>
			</c:choose>
		<li><a href="#">요양 정보</a> 
		
			<ul>
				<li><a href="${cp}/test/matching">요양보호소 찾기 </a></li>
				<li><a href="${cp}/test/matching">요양원/요양병원 찾기</a></li>
				<li><a href="${cp}/test/matching">기관 정보 조회</a></li>
			</ul></li>

		<li class="menu-has-children"><a href="">커뮤니티</a>
			<ul>
				<li><a href="${cp}/test/basicBoard">공지사항</a></li>
				<li><a href="${cp}/test/basicBoard">자유게시판</a></li>
				<li><a href="${cp}/test/basicQnA">QnA</a></li>
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

			</ul>
			
			</li>
			
			<c:choose>
 
    <c:when test="${MEM_INFO.mem_grade==0}">
    
      <li class="menu-has-children"><a href="">관리자 메뉴 </a>
			<ul>
				<li><a href="blog-home.html">메뉴관리</a></li>
			
			</ul></li>
			

    </c:when>
 
  
 
    <c:otherwise>

    </c:otherwise>
 
</c:choose>
			
			
			
			
			
			
			
			
			
	</ul>
</nav>

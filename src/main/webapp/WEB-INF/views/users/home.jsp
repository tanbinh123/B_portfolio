<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
    maximum-scale=1.0, minimum-scale=1.0">


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<title>OneTwo#</title>
<style type="text/css">
.pageli {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<style>
ul {
	list-style: none;
}
#logo {
margin-right: 200px;
}
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap')
	;

body {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
}

td>input {
	margin-bottom: 5px;
}

select {
	margin-left: 5px;
}

a {
	color: #EC7357;
}

a:hover {
	text-decoration: none;
	color: #EC7357;
}

.sidebar-nav {
	margin-top: 10px;
	padding: 10px;
}

h6 {
	font-weight: bold;
}

.table1 {
	padding: 20px;
	border: none;
}

.table-1 {
	border: 1px solid #754F44;
}

.tablehead {
	background-color: #FDD692;
}

.table {
	color: 754F44;
	font-weight: bold;
}

#goto {
	width: 150%;
	height: 150%;
}

div#header {
		background-color: #FDD692;
}

nav.navbar {
	background-color: white;
	margin-bottom: -30px;
}
div.blank-box2 {
	padding-bottom:25px;
	background-color: #F2F2F2;
}
</style>

</head>
<body>





	<!-- 네비바 -->
	<div id="Header" class="">
	
  <div class="container-fluid">
    <div class="top d-none d-md-block">
      <div class="topMenu">
     <%  String member_id2 = (String)session.getAttribute("member_id");		//null체크
		if( member_id2 != null) 
		{   //로그인 상태
		%>
			<span><%= member_id2 %>님 환영합니다</span>
		<%		
		}
		else
		{  //로그아웃 상태
		%>
			<span></span>
		<%
		}
		%>
		<span style="padding-left: 15px;"></span>
      
        <span class="home"><a href="/home">HOME</a></span>
        <%
		String member_id = (String)session.getAttribute("member_id");
		//null체크
		if( member_id != null) 
		{   //로그인 상태
		%>
			<span><a href="logoutAction">로그아웃</a></span>
		<%		
		}
		else
		{  //로그아웃 상태
		%>
			<span><a href="login">로그인</a></span>
		<%
		}
		
		
		%>  
		
        
        <span><a href="/join">회원가입</a> </span>
        	
        		<% 
		if( member_id != null) 
		{  
		%>
			 <span><a href="user_myPage?member_id=<%=member_id%>">마이페이지</a></span>
			         <span><a href="cart_view?member_id=<%=member_id%>">장바구니</a></span>
        <span><a href="order_list?member_id=<%=member_id%>">주문내역</a></span>
		<%		
		}
		else
		{  
		%>
		<%
		}
		
		
		%>  
        
      </div>
    </div>
  </div>
	
	
	
	
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href="/home"><img id="logo"
				src="/img/logo.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 회사소개 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="introduce">회사소개</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 판매상품 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="items_list">판매상품</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 공지사항 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="user_notice">공지사항</a>
						</div></li>
					
				</ul>
			</div>
		</nav>
	</div>

	<div id="blank-box2" class="blank-box2"></div>


	<c:import url="${ mainPage }" />

	<div class="footer01"></div>
	<div class="footer02">
		<div class="address">
			회사 : 노원이젠, 주소 : 서울시 노원구 상계동 화랑빌딩 4층, 대표 : 홍길동, <br> 고객지원 :
			010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호
			: 100-02-00033, 통신판매업 : 제1111-경기-00000호
		</div>
		<div class="copy">COPYRIGHT(C) 2021 NOWON_EZEN. ALL RIGHT
			RESERVED.</div>
	</div>
</body>
</html>
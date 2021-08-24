<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	

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
<title>주문관리</title>

<style>
ul{
   list-style:none;
   }
   @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
   
   body {
   font-family: 'Gowun Batang', serif;
   }
a {
    color:#EC7357;
}

a:hover {
    text-decoration: none;
    color: #EC7357;
}

.sidebar-nav {
	margin-top:10px;
	padding: 10px;
}
</style>

</head>
<body>

	<!-- 네비바 -->
	<div id="Header" class="">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href="#"><img id="logo" src="/img/logo.png"></a>
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
						aria-haspopup="true" aria-expanded="false"> 주문관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">주문목록</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 상품관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">상품목록</a> <a
								class="dropdown-item" href="#">상품등록</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 커뮤니티 관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">공지사항 관리</a> <a
								class="dropdown-item" href="#">묻고답하기 관리</a> <a
								class="dropdown-item" href="#">상품평 관리</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>

	<div id="content" class="d-flex flex-row bd-highlight mb-3">


			<!-- 사이드바 -->
			<div id="sidebar sidebar-wrapper col-md-3" class="ml-3">
				<ul class="border border-warning sidebar-nav pr-5">
				<li class="text-center sidebar-brand">MENU</li>
				<li>주문 관리
					<ul>
						<li>　<a href="#">주문 목록</a></li>
					</ul>
				</li>
				<li>상품 관리
					<ul>
						<li>　<a href="#">상품 목록</a></li>
						<li>　<a href="#">상품 등록</a></li>
					</ul>
				</li>
				<li>커뮤니티 관리
					<ul>
						<li>　<a href="#">공지사항 관리</a></li>
						<li>　<a href="#">묻고답하기 관리</a></li>
						<li>　<a href="#">상품평 관리</a></li>
					</ul>
				</li>
			</ul>
			</div>

		<!-- 메인 -->
		<div class="main-content container col-md-9"></div>
		
		
		
		
		</div>

		<!-- 푸터 -->
		
		 <div class="footer01">
  </div>
  <div class="footer02">
    <div class="address">
      회사 : 노원이젠, 주소 : 서울시 노원구 상계동 화랑빌딩 4층, 대표 : 홍길동, <br>
      고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호
    </div>
    <div class="copy">
      COPYRIGHT(C) 2021 NOWON_EZEN. ALL RIGHT RESERVED.
    </div>
  </div>
  
</body>
</html>
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
ul {
	list-style: none;
}

@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap')
	;

body {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
}
td > input {
	margin-bottom:5px;
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
</style>

</head>
<body>

	<!-- 네비바 -->
	<div id="Header" class="">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href="#"><img id="logo"
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
						aria-haspopup="true" aria-expanded="false"> 주문관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="admin_order">주문목록</a>
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
							<a class="dropdown-item" href="admin_notice">공지사항 관리</a> <a
								class="dropdown-item" href="#">묻고답하기 관리</a> <a
								class="dropdown-item" href="#">상품평 관리</a>
						</div></li>
												<li>
						        <%
		String admin_id = (String)session.getAttribute("admin_id");
		//null체크
		if( admin_id != null) 
		{   //로그인 상태
		%>
			<div class="d-flex flex-row pl-3 justify-content-center "><span class="mt-2 pr-4">관리자님 환영합니다.</span><br><span class="mt-2"><a href="adminLogoutAction">LOGOUT</a></span></div>
		<%		
		}
		else
		{  //로그아웃 상태
		%>
			<div class="mt-2 ml-2"><span class=""><a href="admin">LOGIN</a></span></div>
		<%
		}
		
		
		%>  
		</li>
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
						<li><a href="admin_order">　주문 목록</a></li>
					</ul>
				</li>
				<li>상품 관리
					<ul>
						<li><a href="#">　상품 목록</a></li>
						<li><a href="#">　상품 등록</a></li>
					</ul>
				</li>
				<li>커뮤니티 관리
					<ul>
						<li><a href="admin_notice">　공지사항 관리</a></li>
						<li><a href="#">　묻고답하기 관리</a></li>
						<li><a href="#">　상품평 관리</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<!-- 메인 -->
		
		<!-- 주문서 관리 테이블 -->
		<div class="main-content container col-md-9 m-5">
			<div class="justify-content-center">
				<h4>주문서 관리</h4>
				<table class="table table-borderless table-1 text-center">
					<tr>
						<td class="table1">주문일: {주문일}</td>
						<td class="table1">주문고객: {고객명} ID: {고객ID}</td>
						<td class="table1">주문번호: {주문번호}</td>
					</tr>
					<tr>
						<td class="table1">결제상태: <select name="pay">
								<option value="입금전">입금전</option>
								<option value="결제완료">결제완료</option>
						</select></td>
						<td class="table1">주문처리상태: <select name="pay">
								<option value="주문 확인 전">주문 확인 전</option>
								<option value="배송 준비 중">배송 준비 중</option>
								<option value="배송 중">배송 중</option>
								<option value="배송완료">배송완료</option>
						</select></td>
						</td>
						<td class="table1"><input type="submit" value="   상태 변경   "><br><input type="button" value="주문 취소하기"></td>
					</tr>

				</table>
			</div>
			
			<!-- 주문상품목록 테이블 -->
			<div class="">
				<br>
				<h4>주문 상품</h4>
				<table class="table">
					<thead>
						<tr class="tablehead">
							<th scope="col">번호</th>
							<th scope="col"></th>
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">합계금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">2</th>
							<td>image삽입</td>
							<td>{상품명}</td>
							<td>{개수}개</td>
							<td>{상품가격}*{개수}원</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>image삽입</td>
							<td>{상품명}</td>
							<td>{개수}개</td>
							<td>{상품가격}*{개수}원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			<!-- 주문자 정보 테이블 -->
			<div class="">
				<br>
				<h4>배송 정보</h4>
				<h6>주문자 정보</h6>

				<table class="table">
					<tbody>
						<tr>
							<th scope="row" class="text-center">이름</th>
							<td><input type="text" value="{주문자명}" readonly></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">이메일주소</th>
							<td><input type="text" value="{이메일주소}" readonly></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-center"><a href="admin_order"><input id="goto" type="button" value="목록으로"></a></div>

		</div>


	</div>

	<!-- 푸터 -->

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
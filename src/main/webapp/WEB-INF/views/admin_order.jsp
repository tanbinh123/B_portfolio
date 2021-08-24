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
       color: #754F44;
       font-weight:bold;
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
			<div class="main-content container col-md-9">
				<!-- 메인 네비바  -->
				<ul class="nav justify-content-center navbar-dark">
					<li class="nav-item"><a class="nav-link active" href="#">주문
							확인 전</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문 확인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송 준비중</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송 중</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송 완료</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문 모두보기</a></li>
				</ul>
				<!-- 주문관리 테이블 -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">번호</th>
							<th scope="col">유형</th>
							<th scope="col">주문 일시</th>
							<th scope="col">주문 번호</th>
							<th scope="col">주문 상품</th>
							<th scope="col">주문자 <br />(아이디)
							</th>
							<th scope="col">결제 금액</th>
							<th scope="col">결제 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><input type="checkbox" value="check1"></th>
							<td>{번호} c:forEach</td>
							<td>{유형}</td>
							<td>{주문일시}</td>
							<td>{주문번호}</td>
							<td><a href="order_view">{주문상품명} 외 {상품 개수} 건</a></td>
							<td>{주문자 이름} <br /> {주문자 아이디}
							</td>
							<td>{주문 금액}원</td>
							<td>{결제 상태}</td>

						</tr>
						<tr>
							<th scope="row"><input type="checkbox" value="check1"></th>
							<td>{번호}</td>
							<td>{유형}</td>
							<td>{주문일시}</td>
							<td>{주문번호}</td>
							<td><a href="order_view">{주문상품명} 외 {상품 개수} 건</a></td>
							<td>{주문자 이름} <br /> {주문자 아이디}
							</td>
							<td>{주문 금액}원</td>
							<td>{결제 상태}</td>

						</tr>

					</tbody>
				</table>



				<!-- 페이지 네비게이션 -->

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
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
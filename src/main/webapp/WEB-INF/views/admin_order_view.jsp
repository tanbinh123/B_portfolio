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
<title>주문관리</title>

<style>
#itemImg {
	width: 100px;
	height: 60px;
}

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

td>input {
	margin-bottom: 5px;
}

select {
	margin-left: 5px;
}

a {
	color: #5a5a5a;
}

a:hover {
	text-decoration: none;
	color: #EC7357;
}

a:after{
	text-decoration: none;
	color:#5a5a5a;
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

/* 로그인 */

.input{
	width: 40px;
	height: 40px;
	text-align: right;
	padding-right: 5px;
	font-weight: bold;
	border-right: 0px;
	border-radius: 5px 0px 0px 5px;
}

.input2{
	height: 40px;
	padding-left: 10px;
}

td>.btn{
	margin-top: 10px;
	margin-bottom: -10px;
	background-color: #4a484b;
	color: white;
	width: 130px;
	height: 38px;
}

td>.btn:hover{
	color: white;
	background-color: #39373a;
}

</style>

</head>
<body>	<%
						String admin_id = (String) session.getAttribute("admin_id");
						//null체크
						if (admin_id != null) { //로그인 상태
						%>
	<!-- 네비바 -->
	<div id="Header" class="">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href=""><img id="logo"
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
							<a class="dropdown-item" href="admin_items_list">상품목록</a> <a
								class="dropdown-item" href="admin_items_add">상품등록</a>
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
								class="dropdown-item" href="admin_qna">묻고답하기 관리</a> <a
								class="dropdown-item" href="admin_shopping_review">상품평 관리</a> <a
								class="dropdown-item" href="admin_cancel">환불 관리</a> <a
								class="dropdown-item" href="admin_memberList">회원 목록</a>
						</div></li>
					<li>
						<div class="d-flex flex-row pl-3 justify-content-center ">
							<span class="mt-2 pr-4">관리자님 환영합니다.</span><br> <span
								class="mt-2"><a href="adminLogoutAction">LOGOUT</a></span>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<div id="blank-box2" class="blank-box2"></div>

	<!-- 공지사항 섹션 -->

	<div id="content" class="d-flex flex-row bd-highlight mb-3">


		<!-- 사이드바 -->
		<div id="sidebar sidebar-wrapper col-md-3" class="ml-3">
			<ul class="border border-warning sidebar-nav pr-5">
				<li class="text-center sidebar-brand">MENU</li>
				<li>주문 관리
					<ul>
						<li><a href="admin_order">주문 목록</a></li>
					</ul>
				</li>
				<li>상품 관리
					<ul>
						<li><a href="admin_items_list">상품 목록</a></li>
						<li><a href="admin_items_add">상품 등록</a></li>
					</ul>
				</li>
				<li>커뮤니티 관리
					<ul>
						<li><a href="admin_notice">공지사항 관리</a></li>
						<li><a href="admin_qna">묻고답하기 관리</a></li>
						<li><a href="admin_shopping_review">상품평 관리</a></li>
						<li><a href="admin_cancel">환불 관리</a></li>
						<li><a href="admin_memberList">회원 목록</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<!-- 메인 -->

		<!-- 주문서 관리 테이블 -->
		<div class="main-content container col-md-9 m-5">
			<div class="justify-content-center">
				<h4>주문서 관리</h4>
				<form action="order_status?items_idx=${dto.items_idx }" method="post">
				<table class="table table-borderless table-1 text-center">
					<tr>
						<td class="table1">주문고객: ${dto.items_title}</td>
						<td class="table1">주문번호: ${dto.items_idx}</td>
					</tr>
					<tr>
						<td class="table1">주문처리상태:${ status }</td>
						<td>주문처리상태 변경 <select id="statusSelect" name="statusSelect"
							name="pay">
								<option value="status1">주문 확인 중</option>
								<option value="status2">주문 확인</option>
								<option value="status3">배송 준비 중</option>
								<option value="status4">배송 중</option>
								<option value="status5">배송완료</option>
						</select></td>
						<td class="table1"><input id="statusBtn" name="statusBtn"
							type="submit" class="btn btn-primary" value="   상태 변경   "><br>
					</td>
					</tr>

				</table>
		</form>
			</div>
			<!-- 주문상품목록 테이블 -->
			<div class="">
				<br>
				<h4>주문 상품</h4>
				<table style="text-align: center;" class="table table-bordered">
					<tr>
						<td scope="col">주문번호</td>
						<td scope="col">상품명</td>
						<td scope="col">상품가격</td>
						<td scope="col">개수</td>
						<td scope="col">총금액</td>

					</tr>
					<c:set var="total" value="0" />
					<c:forEach items="${ order_view }" var="dto">
						<tr>
							<td></td>
							<td><img style="width: 150px; height: 100px;"
								src="/upload/${dto.order_img }">${dto.order_title } <input
								type="hidden" id="cart_title" name="cart_title"
								value="${ cart_list.cart_title }"> <input type="hidden"
								id="cart_img" name="cart_img" value="${ cart_list.cart_img }">
								<input type="hidden" id="cart_price" name="cart_price"
								value="${ cart_list.cart_price }"> <input type="hidden"
								id="cart_numb" name="cart_numb" value="${ cart_list.cart_numb }">
								<input type="hidden" id="cart_totalPrice" name="cart_totalPrice"
								value="${ cart_list.cart_totalPrice }"></td>
							<td>${ dto.order_price }</td>
							<td>${ dto.order_numb }</td>
							<td>${ dto.order_totalPrice }</td>

							<c:set var="total" value="${total + dto.order_totalPrice}" />
						</tr>

					</c:forEach>
					<tr>
						<td style="text-align: right;" colspan="4">합계 금액 :</td>
						<td><input type="hidden" id="total" name="total"
							value="${total}">
						<c:out value="${total}" /></td>

					</tr>

					<tr>
						<td colspan="5"></td>
					</tr>

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
<td>주문자 성함 : ${ userDto.orderInfo_name }
					<br/> 연락처: ${ userDto.orderInfo_phone } <br />
					우편번호 : ${ userDto.orderInfo_addressNumb }
					상세 주소 : ${ userDto.orderInfo_address } ${ userDto.orderInfo_address_detail } ${ userDto.orderInfo_address_extra } <br />
					결제 방식 : ${ userDto.orderInfo_status }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-center">
			
			
	<a href="admin_order_delete?items_idx=${ dto.items_idx }&items_order_idx=${dto.items_order_idx}"><input
								type="button" class="btn btn-primary" value="주문 취소하기"></a>
								<span style="margin-right:50px;"></span>
				<a href="admin_order"><input class="btn btn-secondary" type="button"
					value="목록으로"></a>
			</div>

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
	<script>
		document.getElementById("statusBtn").onclick = function() {

			let statusSelect = document.getElementsByName("statusSelect")[0].value;
			var items_idx = $
			{
				dto.items_idx
			}
			location.href = "/order_status?statusSelect=" + statusSelect
					+ "&items_idx=" + items_idx
		};
	</script>
</body>
 <%
 } else { //로그아웃 상태
 %>
	<!-- 네비바 -->
	<div id="Header" class="">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href=""><img id="logo"
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
							<a class="dropdown-item disabled" href="admin_order">주문목록</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 상품관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item disabled" href="admin_items_list">상품목록</a> <a
								class="dropdown-item disabled" href="admin_items_add">상품등록</a>
						</div></li>
				</ul>
				<ul class="navbar-nav m-auto">
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 커뮤니티 관리 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item disabled" href="admin_notice">공지사항 관리</a>
							<a class="dropdown-item disabled" href="admin_qna">묻고답하기 관리</a> <a
								class="dropdown-item disabled" href="admin_shopping_review">상품평 관리</a>
							<a class="dropdown-item disabled" href="admin_cancel">환불 관리</a>
						</div></li>
					<li>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<div style="margin-top:180px;" id="blank-box2" class="blank-box2"></div>

<!-- 로그인 섹션 -->
	<div id="content" class="d-flex flex-row bd-highlight justify-content-center align-center">
<div class="">
    <form action="Admin-LoginAction" method="post" name="Admin-loginAction">
        <table class="main1" style="text-align: center;">
          <tr>
            <td>
              아이디<br>
              비밀번호
            </td>
            <td>
              <input type="text" id="admin_id" name="admin_id"><br>
              <input type="password" id="admin_pw" name="admin_pw">
            </td>
            </tr>
            <tr>
            <td colspan="2">
              <button class="btn btn-primary" type="submit">로그인</button>
              </td>
          </tr>
        </table>
        </form>
        <a style="text-align:center;" href="home"><button style="margin-top: 25px;" class="btn btn-secondary">사용자 페이지로</button></a>
</div>
	</div>
	

<div class="blank-box"></div>

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

</body> <%
 }
 %>
</html>
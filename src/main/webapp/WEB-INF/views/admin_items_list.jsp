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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "admin_notice?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<title>주문관리</title>
<style type="text/css">
img {
	width : 50px;
	height : 30px;
}

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

.btn{
	width: 100%;
}

#btn1{
	width: 50px;
	height: 100%;
	background-color: white;
	border: 1px solid rgb(182, 182, 182);
	border-radius: 5px;
}

#btn1:hover{
	background-color: #754f44;
	color: #fbffb9;
}

#add_write{
	background-color: white;
	border: 1px solid rgb(182, 182, 182);
	border-radius: 5px;
	width: 80px;
	height: 35px;
	margin-bottom: -10px;
	margin-right: 10px;
}

#add_write:hover{
	background-color: #754f44;
	color: #fbffb9;
}

#keyword{
	padding: 5px;
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
							<a class="dropdown-item" href="admin_notice">공지사항 관리</a>
							<a class="dropdown-item" href="admin_qna">묻고답하기 관리</a> <a
								class="dropdown-item" href="admin_shopping_review">상품평 관리</a>
							<a class="dropdown-item" href="admin_cancel">환불 관리</a>
							<a class="dropdown-item" href="admin_memberList">회원 목록</a>
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
		<div class="main-content container col-md-9">



			<!-- 공지사항 검색 -->
			<div id="addSearch" class="addSearch">
					<select id="searchType" name="searchType">
						<option value="title"
							<c:if test="${page.searchType eq 'title'}">selected</c:if>>상품명</option>
						<option value="numb"
							<c:if test="${page.searchType eq 'numb'}">selected</c:if>>번호</option>
					</select>
					 <input type="search" id="keyword" name="keyword"
						value="${ keyword }" class="searchbar">
					<button type="submit" id="searchButton" class="btn btn-secondary">
						검색</button>
			</div>


<div>

	

	
	


			<!-- 주문관리 테이블 -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">상품명</th>
						<th scope="col">판매가격</th>
						<th scope="col">재고수량</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items='${ list }'>
						<tr>
							<td>${dto.add_idx}</td>
							<td><img src="/upload/${dto.add_img }"> ${dto.add_title}</td>
							<td>${dto.add_price }</td>
							<td>${dto.add_count }</td>
							<td><a
								href="admin_items_add_view?add_idx=${ dto.add_idx }">
<button>수정</button></a></td>
<td><a
								href="admin_items_add_delete?add_idx=${ dto.add_idx }">
<button>삭제</button></a></td>
									
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이지 네비게이션 -->


			
			
			<div style="display: block; text-align: center;">
			
			
				<c:if test="${page.prev}">
		<span>[ <a href="/admin_items_list?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
		
			<c:if test="${select != num}">
				<a href="/admin_items_list?num=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> 			
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
	 			
		</span>
	</c:forEach>
	
	<c:if test="${page.next}">
		<span>[ <a href="/admin_items_list?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
	</c:if>
			
		
				
				
			</div>
			<div id="write_div" class="d-flex justify-content-center">
				<a href="admin_items_add"><input id="add_write"
					type="button" value="상품 등록"></a>
			</div>


		</div>
	</div>
	</div>
	<!-- 푸터 -->

	<div class="blank-box"></div>

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

	document.getElementById("searchButton").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "/admin_items_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
</body>
	
<script>

	document.getElementById("searchBtn").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		console.log("searchType : " + searchType+ "keyword : " + keyword)
		location.href = "/admin_items_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
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
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
							<a class="dropdown-item disabled" href="#">상품목록</a> <a
								class="dropdown-item disabled" href="#">상품등록</a>
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
							<a class="dropdown-item disabled" href="#">묻고답하기 관리</a> <a
								class="dropdown-item" href="#">상품평 관리</a>
						</div></li>
					<li>
						<%
						String admin_id = (String) session.getAttribute("admin_id");
						//null체크
						if (admin_id != null) { //로그인 상태
						%>
						<div class="d-flex flex-row pl-3 justify-content-center ">
							<span class="mt-2 pr-4">관리자님 환영합니다.</span><br> <span
								class="mt-2"><a href="adminLogoutAction">LOGOUT</a></span>
						</div> <%
 } else { //로그아웃 상태
 %>
						<div class="mt-2 ml-2">
							<span class=""><a href="admin">LOGIN</a></span>
						</div> <%
 }
 %>
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
<<<<<<< HEAD
						<li><a href="admin_order"> 주문 목록</a></li>
=======
						<li><a href="admin_order">　주문 목록</a></li>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
					</ul>
				</li>
				<li>상품 관리
					<ul>
<<<<<<< HEAD
						<li><a href="#"> 상품 목록</a></li>
						<li><a href="#"> 상품 등록</a></li>
=======
						<li><a href="#">　상품 목록</a></li>
						<li><a href="#">　상품 등록</a></li>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
					</ul>
				</li>
				<li>커뮤니티 관리
					<ul>
<<<<<<< HEAD
						<li><a href="admin_notice"> 공지사항 관리</a></li>
						<li><a href="#"> 묻고답하기 관리</a></li>
						<li><a href="#"> 상품평 관리</a></li>
=======
						<li><a href="admin_notice">　공지사항 관리</a></li>
						<li><a href="#">　묻고답하기 관리</a></li>
						<li><a href="#">　상품평 관리</a></li>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
					</ul>
				</li>
			</ul>
		</div>

		<!-- 메인 -->
		<div class="main-content container col-md-9">

<<<<<<< HEAD
			<form id="infoForm" action="admin_notice" method="get">
				<input type="hidden" id="searchType" name="searchType"
					value="${ searchType }">
			</form>



			<!-- 공지사항 검색 -->
			<div id="noticeSearch" class="noticeSearch">
					<select id="searchType" name="searchType">
						<option value="title"
							<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
						<option value="title_content"
							<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
					</select>
					 <input type="search" id="keyword" name="keyword"
						value="${ keyword }" class="searchbar">
					<button type="submit" id="searchButton" class="btn btn-secondary">
						검색</button>
			</div>

=======
<form id="infoForm" action="admin_notice" method="get">
	<input type="hidden" id="searchType" name="searchType" value="${ searchType }">
</form>



<div>

	
	<%-- <c:forEach begin="1" end="${pageNum}" var="num">
  		<span>
  			<a href="/board/listPage?num=${num}">${num}</a>
		</span>
	</c:forEach> --%>
	
	
	<div>
	<form id="form1" method="post" action="admin_notice">
		<select id="searchType" name="searchType">
		    <option value="title" <c:if test="${ page.searchType eq 'title'}">selected</c:if>>제목</option>
	        <option value="content" <c:if test="${ page.searchType eq 'content'}">selected</c:if>>내용</option>
		    <option value="title_content" <c:if test="${ page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
		</select>
		
		<input type="text" id="keyword" name="keyword" value="${page.keyword}"/>
		
		<input type="button" id="searchBtn" class="searchBtn btn btn-sm btn-primary" value="검색">
		</form>
	</div>
	
</div>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074



			<!-- 주문관리 테이블 -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items='${ list }'>
						<tr>
							<td>${dto.notice_idx}</td>
							<td><a
								href="admin_notice_view?notice_idx=${ dto.notice_idx }">${dto.notice_title}</a></td>
<<<<<<< HEAD
							<td><<fmt:formatDate value="${dto.notice_date}"
									pattern="yyyy-MM-dd" />
							</td>
=======
							<td><fmt:formatDate value="${ dto.notice_date }"
									pattern="yyyy.MM.dd" /></td>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074

						</tr>
					</c:forEach>
				</tbody>
			</table>
<<<<<<< HEAD
			<!-- 페이지 네비게이션 -->

			<c:if test="${page.prev}">
				<span>[ <a
					href="/admin_notice?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					]
				</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
				var="num">
				<span> <c:if test="${select != num}">
						<a href="/admin_notice?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if> <c:if test="${select == num}">
						<b>${num}</b>
					</c:if>

				</span>
			</c:forEach>

			<c:if test="${page.next}">
				<span>[ <a
					href="/admin_notice?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					]
				</span>
			</c:if>



=======
			
			
			<div style="display: block; text-align: center;">
			
			
				<c:if test="${page.prev}">
		<span>[ <a href="/admin_notice?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
		
			<c:if test="${select != num}">
				<a href="/admin_notice?num=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> 			
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
	 			
		</span>
	</c:forEach>
	
	<c:if test="${page.next}">
		<span>[ <a href="/admin_notice?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
	</c:if>
			
		
				
				
			</div>
>>>>>>> 56b575679a692641989521ce93b3245ab280a074
			<div id="notice_write_div" class="d-flex justify-content-center">
				<a href="admin_notice_write"><input id="notice_write"
					type="button" value="글쓰기"></a>
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
		
		location.href = "/admin_notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
</body>
	
<script>

	document.getElementById("searchBtn").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		console.log("searchType : " + searchType+ "keyword : " + keyword)
		location.href = "/admin_notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>

</html>
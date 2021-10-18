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
<title>상품평관리</title>

<style>
ul {
	list-style: none;
}

@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap')
	;

body {
	font-family: 'Gowun Batang', serif;
	color: #754F44;
	font-weight: bold;
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

#writebtn {
	width: 100%;
	display: flex;
	flex-direction: row;
	align-items: flex-end;
	justify-content: flex-end;
	margin-top: 10px;
}

.sidebar-nav {
	margin-top: 10px;
	padding: 10px;
}
/* footer */
#footer_wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	width: 100%;
	height: 25%;
	background-color: rgb(37, 37, 37);
	color: gray;
	margin-bottom: 0px;
}

#footerin {
	margin: 30px;
}

.anchor {
	color: white;
}

.anchor>a {
	color: white;
	font-size: 14px;
	padding-right: 10px;
	padding-left: 10px;
}

.anchor>a:link {
	color: white;
}

.text_p>p {
	color: gray;
}

/* CSS */
html, body {
	height: 100%;
}

#bodyWrap {
	height: 100%;
	width: auto;
}

#footer_wrap {
	width: 100%;
	height: 200px;
	clear: both;
	margin-top: 300px;
}

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
	<div id="bodyWrap">
		<!-- 헤더 -->
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



			<!-- 콘텐츠 -->
			<div class="main-content container col-md-9 ">
				<h3>｜상품평관리</h3>
				<hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
				<input type="hidden" id="review_idx" name="review_idx"
					value="${ dto.review_idx }" />
				<table class="table">
							<tr>
					    <td width="20%">작성자</td><td> ${ dto.review_member_id }</td>
					    </tr>
					    <tr>
						<td>제목</td><td> ${ dto.review_title }</td>
						  </tr>
					    <tr>
						<td>상품명</td><td> ${ dto.review_items }</td>
						  </tr>
					    <tr>
						<td>날짜</td><td> <fmt:formatDate value="${ dto.review_date }"
									pattern="yyyy.MM.dd" /></td>
					</tr>
					<tr>
						<td>내용</td><td > ${dto.review_content} </td>
					</tr>

					<table width="500" cellpadding="0" cellspacing="0" border="1">
						<br>
						<form action="reply.do" method="post">
							<input type="hidden" name="s_reply_board_idx"
								value="${ dto.review_idx }" />
							<table width="500" cellpadding="0" cellspacing="0" border="1">
								<tr>
									<td colspan="2">
										<%
		if( admin_id != null) 
		{   //로그인 상태
		%>
										<div class="d-flex flex-row pl-3 justify-content-center ">
											<span class="mt-2 pr-4">ADMIN</span>
										</div> <label>댓글</label> <textarea rows="2" cols="40"
											name="s_reply_content"></textarea> <br> <input
										type="submit" value="댓글남기기" /> <%		
		}
		else
		{  //로그아웃 상태
		%>
										<div class="mt-2 ml-2">
											<span class=""><a href="admin">로그인</a>해주세요</span>
										</div> <%
		}
		
		
		%>





									</td>
								</tr>

							</table>
						</form>
						<tr>

							<th></th>
							<th></th>
							<th></th>
						</tr>

						<c:forEach var="s_dto" items="${ s_reply_list }">
							<br>
							<tr>
								<td>admin</td>
								<td><span class="date"><fmt:formatDate
											value="${s_dto.s_reply_date}" pattern="yyyy.MM.dd" /></span></td>
								<td>${s_dto.s_reply_content }</td>


								<%
		if( admin_id != null) 
		{   //로그인 상태
		%>
								<td><a
									href="s_reply_delete.do?s_reply_idx=${s_dto.s_reply_idx }&s_reply_board_idx=${ s_dto.s_reply_board_idx }"><input
										type="submit" value="삭제" /></a></td>
								<%		
		}
		else
		{  //로그아웃 상태
		%>


								<%
		}
		
		
		%>

							</tr>
						</c:forEach>
					</table>

				</table>

				<hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
				<div id="listbtn">
					<a href="admin_shopping_review"><button class="listbtn btn btn-primary">목록</button></a>

				</div>
			</div>

		</div>


		<!-- 푸터 -->

		<div class="blank-box"></div>

		<div class="footer01"></div>
		<div class="footer02">
			<div class="address">
				회사 : 노원이젠, 주소 : 서울시 노원구 상계동 화랑빌딩 4층, 대표 : 홍길동, <br> 고객지원 :
				010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com,
				사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호
			</div>
			<div class="copy">COPYRIGHT(C) 2021 NOWON_EZEN. ALL RIGHT
				RESERVED.</div>
		</div>
	</div>
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
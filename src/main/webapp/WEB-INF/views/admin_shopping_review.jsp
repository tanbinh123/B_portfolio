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
<title>상품평작성</title>

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
   #writebtn {
      width: 100%;
      display: flex;
      flex-direction: row;
      align-items: flex-end;
      justify-content: flex-end;
      margin-top: 10px;
    }
.sidebar-nav {
	margin-top:10px;
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
html, body {height:100%;}
#bodyWrap {height:100%;width:auto;}

#footer_wrap {width:100%;height:200px;clear:both;margin-top:300px;}
</style>

</head>
<body>
<div id="bodyWrap">
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
			<div class="d-flex justify-content-center "><span class="mt-2 pr-4">관리자님 환영합니다.</span><br><span class="mt-2"><a href="adminLogoutAction">LOGOUT</a></span></div>
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
						<li>　<a href="admin_order">주문 목록</a></li>
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
						<li>　<a href="admin_notice">공지사항 관리</a></li>
						<li>　<a href="#">묻고답하기 관리</a></li>
						<li>　<a href="#">상품평 관리</a></li>
					</ul>
				</li>
			</ul>
			</div>

			
    


   <div class="main-content container col-md-9 ">
      <h3>｜상품평 관리</h3>
      <hr style="border: 1px solid gray; width: 100%;">
      <div id="search">
        <select name="" id="">
          <option value="">제목</option>
          <option value="">내용</option>
          <option value="">제목+내용</option>
          <option value="">작성자</option>
        </select>
        <input type="search" name="" id="">
        <a href="#"><button>검색</button></a>
      </div>
      <table class="table">
        <tbody>
          <thead>
            <td width="10%">번호</td>
            <td width="40%">제목</td>
            <td width="20%">작성자</td>
            <td width="30%">작성일</td>
          </thead>
          <c:forEach var="qnadto" items="${ reviewlist }">
            <tr>
              <td width="10%">{ 번호 }</td>
              <td width="40%" align="left">
                <a href="qnaview?qna_idx=${ reviewdto.review_idx }">
                  ${ reviewdto.review_title }
                </a>
              </td>
              <td width="20%">{ 작성자 }</td>
              <td width="30%">{ 작성일 }</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div id="writebtn"> <a href="qnawrite"><button id="write">글쓰기</button></a></div>
      <div id="pagenavigation">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>

</div>

		<!-- 푸터 -->
  <footer>
    <!-- footer -->
    <div id="footer_wrap" class="container-fluid align-center">
      <div id="footerin">
        <div class="anchor">
          <a href="company">회사소개</a><span>|</span>
          <a href="#">개인정보보호정책</a><span>|</span>
          <a href="#">이메일무단수집거부</a><span>|</span>
          <a href="qna">묻고답하기</a>
        </div>
        <div>
          <p>회사 : 노원이젠, 주소 : 서울시 노원구 상계동 화랑빌딩 4층, 대표 : 홍길동.</p>
          <p>고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com,
              사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호</p>
          <p>COPYRIGHT(C) 2021 NOWON_EZEN. ALL RIGHT RESERVED.</p>
        </div>
        <div>
          <img src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/mf-icon01.png" alt="">
          <img src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/mf-icon02.png" alt="">
          <img src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/mf-icon03.png" alt="">
          <img src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/mf-icon04.png" alt="">
        </div>
      </div>
    </div>
  </footer>
  </div>
</body>
</html>
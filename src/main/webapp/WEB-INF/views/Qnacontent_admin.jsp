<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <title>묻고답하기</title>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        ul {
            list-style: none;
        }

        /* top 시작 */
        .top {
            width: 100%;
            height: 30px;
            color: white;
            font-size: 12px;
            font-weight: normal;
            text-align: right;
            background-color: #F17F42;
            border-bottom: 1px solid #ddd;
        }

        .topMenu {
            width: 94%;
            text-align: right;
            vertical-align: middle;
            line-height: 30px;
        }

        .topMenu span {
            padding: 5px;
        }

        .topMenu a {
            margin-bottom: 0px;
            text-decoration: none;
            color: #777777;
        }

        .topMenu>span>a {
            color: white;

        }

        /* 네비바 드롭다운 */
        .navbar {
            width: 97%;
        }

        li.dropdown {
            display: inline-block;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            /* 팝업메뉴가 닫히지 않도록 */
            margin-top: 0;
        }

        .dropdown-item:link {
            color: black;
        }

        .dropdown-item:visited {
            color: black;
        }

        .dropdown-item:hover {
            text-decoration: underline #F17F42;
            color: #F17F42;
        }

        ul.nav li.dropdown:hover>ul.dropdown-menu {
            display: block;
            margin: 0;
        }

        /* 네비바 드롭다운 끝 */
        main {
            width: 90%;
            height: 70%;
            margin: 10px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            gap: 20px;
        }

        a {
            text-decoration: none;
        }

        a:link {
            color: #5a5a5a;
        }

        a:visited {
            text-decoration: none;
            color: #5a5a5a;
        }

        a:active {
            color: #F17F42;
        }

        a:hover {
            color: #F17F42;
        }

        #side {
            width: 20%;
            height: 80%;
            padding: 10px;
            gap: 5px;
            display: flex;
            flex-direction: column;
            border: 1.5px solid rgb(175, 175, 175);
            border-radius: 10px;
        }

        #main {
            width: 80%;
            height: 600px;
            display: flex;
            flex-direction: column;
        }
        textarea {
            padding: 5px;
        }

        #replybtn {
            background-color: white;
            color:rgb(100, 100, 100) ;
            width: 85%;
            height: 80px;
            border: 1.5px darkgray solid;
            border-radius: 10px;
        }
        #replybtn:hover {
            background-color: #F17F42;
            color: white;
        }
        #replybtn2 {
            text-align: center;
            vertical-align: bottom;
            gap: 5px;
        }
        #replybtn2 > button {
            background-color: white;
            color:rgb(100, 100, 100) ;
            border: 1px solid darkgray;
            border-radius: 5px;
            width: 50px;
            height: 28px;
        }
        #replybtn2 > button:hover{
            background-color: #F17F42;
            color: white;
        }
        #listbtn{
            width: 94%;
            text-align: center;
            
        }
        .listbtn {
            background-color: white;
            color:rgb(100, 100, 100) ;
            border: 1px solid darkgray;
            border-radius: 5px;
            width: 70px;
            height: 35px;
        }
        button:hover{
            background-color: #F17F42;
            color: white;
        }

        /* footer */
        #footer {
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
    </style>
</head>

<body>
    <div class="top">
        <div class="topMenu d-none d-lg-block">
            <span><a href="login">LOGIN
                </a></span>
            <span><a href="join">JOIN</a> </span>
            <span><a href="customer">고객센터</a> </span>
            <span><a href="mypage">마이페이지</a> </span>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarCollapse">
            <ul class="navbar-nav justify-content-end container-fluid m-auto">
                <li class="nav-item d-sm-block d-md-none">
                    <a class="" href="login">LOGIN</a> &nbsp; <a class="" href="join">JOIN</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" data-toggle="dropdown">
                        주문관리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">주문목록</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" data-toggle="dropdown">
                        상품관리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">상품목록</a>
                        <a class="dropdown-item" href="#">상품등록</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" data-toggle="dropdown">
                        커뮤니티관리
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">공지사항 관리</a>
                        <a class="dropdown-item" href="#">묻고답하기 관리</a>
                        <a class="dropdown-item" href="#">상품평 관리</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <main>
        <div id="side">
            <h5>게시판 관리</h5>
            <a href="#">·공지사항</a>
            <a href="#">-원두 공지</a>
            <a href="#">-고객센터 공지</a>
            <a href="#">·커뮤니티</a>
            <a href="#">·1:1문의</a>
            <a href="#">·상품평</a>
            <a href="#">·게시판 카테고리</a>
            <a href="#">·관리</a>
        </div>
        <div id="main">
            <h3>｜묻고답하기</h3>
            <hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
            <form action="EditAcion" method="post" name="editinfo" class="form">
                <input type="hidden" id="qna_idx" name="qna_idx" value="${ qnadto.qna_idx }" />
                    <table class="table">
                        <tr>
                            <td align="left" id="td2" width="60%">${ qnadto.qna_title }</td>
                            <td width="15%" align="center">${qnadto.qna_name}</td>
                            <td width="25%" align="center">${qnadto.qna_date}</td>
                        </tr>
                        <tr>
                            <td colspan="3">${qnadto.qna_content}</td>
                        </tr>
                        <tr>
                            <td colspan="3">작성된 댓글(개)</td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea id="qna_content" maxlength="200" name="qna_content" style="width: 100%; height: 80px;">${ qnadto.qna_content }</textarea></td>
                            <td><button id="replybtn">등록</button></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                ㄴ${replydto.reply_writer} | ${replydto.reply_date} <br>
                                　${replydto.reply_content}
                            </td>
                            <td id="replybtn2" colspan="1">
                                <button id="replyedit">수정</button>
                                <button id="replydelete">삭제</button>
                            </td>
                        </tr>
                    </table>
                </form>
                <hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
                <div id="listbtn">
                    <a href="Qna.html"><button class="listbtn">목록</button></a>
                </div>
        </div>
    </main>

    <footer>
        <!-- footer -->
        <div id="footer" class="container-fluid align-center">
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
</body>

</html>
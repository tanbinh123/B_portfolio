<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">



    <div class="loginForm container text-center">
      <div class="loginSe1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
      </div>
      <div class="loginMain">
      <form action="LoginAction" method="post" name="loginAction">
        <table class="main1">
          <tr>
            <td>
              아이디<br>
              비밀번호
            </td>
            <td>
              <input type="text" id="member_id" name="member_id"><br>
              <input type="password" id="member_pw" name="member_pw">
            </td>
            <td>
              <input type="image" class="loginImg" src="http://bdmp-004.cafe24.com/bizdemo99969/img/member/btn_login.gif">
            </td>
          </tr>
        </table>
        </form>
        
        <div class="loginSe2">
          <table class="main2">
            <tr>
              <td>-아이디를 잊으셨나요?</td>
              <td><a href="idFind"><input type="image" src="http://bdmp-004.cafe24.com/bizdemo99969/img/member/btn_id_find.gif"></a></td>
            </tr>
            <tr>
              <td>-비밀번호를 잊으셨나요?</td>
              <td><a href="passwordFind"><input type="image" src="http://bdmp-004.cafe24.com/bizdemo99969/img/member/btn_pw_find.gif"></a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">



    <div class="loginForm container text-center">
      <div class="findMain">
      <form action="pwFindAction" method="post" name="loginAction">
        <table class="main1">
        <tr><td style="text-align:center;" colspan="3">아이디와 이름과 이메일을 입력해주세요.</td></tr>
        
          <tr>
            <td>
            아이디<br>
              이름<br>
              이메일
            </td>
            <td>
            <input type="text" id="member_id" name="member_id"><br>
              <input type="text" id="member_name" name="member_name"><br>
              <input type="text" id="member_email" name="member_email">
            </td>
            <td>
              <input class="btn btn-primary" type="submit" class="loginImg"	value="찾기">
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
          </table>
        </div>
      </div>
    </div>
  

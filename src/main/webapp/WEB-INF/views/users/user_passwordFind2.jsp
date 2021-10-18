<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">

<div style="margin-top: 200px;"></div>

    <div class="loginForm container text-center">
      <div class="findMain">
      <form action="user_pwModify" method="post" name="loginAction">
        <table class="main1">
        <tr><td style="text-align:center;" colspan="3">${ dto.member_id }님 새로운 비밀번호를 입력해주세요.</td></tr>
        
          <tr>
            <td>
              비밀번호<br>
              비밀번호 확인
            </td>
            <td>
            <input type="hidden" id="member_id" name="member_id" value="${ dto.member_id }">
              <input type="text" id="member_pw" name="member_pw"><br>
              <input type="text" id="member_pwCheck" name="member_pwCheck">
            </td>
            <td>
              <input class="btn btn-primary" type="submit" class="loginImg"	value="변경">
            </td>
          </tr>
        </table>
        </form>
        
<div style="margin-top: 200px;"></div>
      </div>
    </div>
  

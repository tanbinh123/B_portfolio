<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/login.css">

 <%
		String member_id = (String)session.getAttribute("member_id");
 %>
<div style="margin-top:250px;"></div>
    <div class="loginForm container text-center">
      <div class="findMain">
      <form action="user_pwFindAction" method="post" name="loginAction">
        <table class="main1">
        <tr><td style="text-align:center;" colspan="3">이름과 이메일을 입력해주세요.</td></tr>
        
          <tr>
            <td>
            아이디<br>
              이름<br>
              이메일
            </td>
            <td>
            <input type="text" id="member_id" name="member_id" value="<%=member_id%>" readonly><br>
              <input type="text" id="member_name" name="member_name"><br>
              <input type="text" id="member_email" name="member_email">
            </td>
            <td>
              <input class="btn btn-primary" type="submit" class="loginImg"	value="찾기">
            </td>
          </tr>
        </table>
        </form>
    
      </div>
    </div>
  

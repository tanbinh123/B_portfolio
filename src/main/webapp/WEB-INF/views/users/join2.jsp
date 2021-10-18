<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/member/join.css">

<div class="joinForm container">
	<div class="joinSe1">
		<div>
			<h3>회원가입</h3>
		</div>
		<div>
			<p>The design and maintenance are excellent.</p>
		</div>
	</div>
	<div class="wellcome">
		<h3>OneTwo#에 오신 것을 환영합니다.</h3>
		<h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
	</div>
	<br>
	<br>
	<div class="contents">
		<h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
		<h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
			자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
	</div>
	<div class="Information1">
		<div>기본정보</div>
		<form action="member_id_submit" method="post" name="idSubmit" id="idSubmit">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="member_id" name="member_id">
						<a onclick="idCheck()"><img
							src="http://bdmp-004.cafe24.com/cimg/btn_iddupl.gif"></a> (영문
						소문자, 숫자4~16자)</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="member_pw" id="member_pw">
						영문/숫자/특수문자('~!@^*()-_+[]{}\:,.<>/) 조합으로 8~16자리. 첫글자는 영문자로 사용</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="" id=""></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="member_name" id="member_name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="member_email" id="member_email"></td>
				</tr>
				<tr>
					<td>이메일 수신여부</td>
					<td><input type="radio" name="member_email_receive"
						id="member_email_receive" value="1">수신<input type="radio" name="member_email_receive"
						value="2">수신안함</td>
				</tr>
				
				<tr>
				<td></td>
					<td>
						<div class="imageBtn2">
							<input  type="submit" value="확인"
								src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/btn_confirm.gif">
							<input style=" width:40px; height:20px;" type="image"
								src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/btn_cancel.gif">
						</div>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>

  <script>
	function idCheck() {
    	var member_id = $('#member_id').val();
    	$.ajax({
    		url: 'idCheckAjax?member_id=' + member_id,
    		type: 'get',
    		success: function(data){
    			console.log("1:중복됨, 0=중복안됨 data:" + data);
    			if( data == 1 ) {
    				//아이디 중복됨.
    				alert('아이디가 중복됨.');
    			}else{
    				//아이디 중복 안됨.
    				alert('사용할 수 있는 아이디입니다.');
    			}
    		},
    		error: function() {

    		}
    	});
	}
	</script>
	
  

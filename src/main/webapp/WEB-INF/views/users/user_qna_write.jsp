<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>

<style>
	#btn{

		vertical-align: bottom;
		text-align: right;
	}
	#btn>input{
		background-color: white;
		border: 1px solid rgb(182, 182, 182);
		border-radius: 8px;
		width: 80px;
		height: 35px;
	}
	#btn>input:hover{
		background-color: #754f44;
		color: #fbffb9;
	}
	#btn>a>input{
		background-color: white;
		border: 1px solid rgb(182, 182, 182);
		border-radius: 8px;
		width: 80px;
		height: 35px;
	}
	#btn>a>input:hover{
		background-color: #754f44;
		color: #fbffb9;
	}
</style>

<div class="main-content container col-md-9">
	<!--  테이블 -->
	<div class="main" style="margin-top:50px;">
		<h3>｜묻고답하기</h3>
		<hr style="border: 1px solid rgb(211, 211, 211); width: 100%;">
		<form action="qna_write_action" method="post" name="qna_write_action" id="qna_write_action">
			<table class="table">
				<tr>
					<td style="width: 10%;">제목</td>
				<td align="left" >
					<input type="text" id="qna_title" name="qna_title" style="width:50%"/>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" id="qna_name" name="qna_name" style="width:50%" value="${ member_name }"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" id="qna_pw" name="qna_pw" style="width:50%"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea style="width: 80%; height: 300px;" id="qna_content" name="qna_content"></textarea>
					</td>
				</tr>
			</table>
			
			<hr style="border: 1px solid rgb(211, 211, 211); width: 100%; margin-top:0;">
			
			<div id="btn" class="container container-fluid" style="margin-top:15px;">
				<input style="width:80px;" type="submit" value="글쓰기">
			</div>
		        
		</form>		

	    <div class="d-flex justify-content-center">
			<a href="user_qna"><button class="btn btn-secondary" value="">목록으로</button></a>
		</div>    
		    
	</div>
	  
</div>
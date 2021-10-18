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
		<input type="hidden" id="qna_idx" name="qna_idx" value="${ dto.qna_idx }" />
		<table class="table">
			<tr>
				<td align="left" id="td2" width="60%">${ dto.qna_title }</td>
				<td width="15%" align="center">${dto.qna_name}</td>
				<td width="25%" align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.qna_date}"/></td>
			</tr>
			<tr>
				<td colspan="3">${dto.qna_content}</td>
			</tr>
		</table>
		<form action="qna_reply" method="post">
			<input type="hidden" name="reply_qna_idx" value="${ dto.qna_idx }" />
			<table class="table">
				<tr>
					<td colspan="3">작성된 댓글</td>
				</tr>
			</table>
		</form>
		<table class="table">
			<c:forEach var="reply_dto" items="${ qna_reply_list }">
			<tr>
				<td colspan="3" class="btnline">
					└ 관리자 | <fmt:formatDate pattern="yyyy-MM-dd" value="${reply_dto.reply_date}"/> 
					<br/>
			 　  ${reply_dto.reply_content}
				</td>
			</tr>
			</c:forEach>
		</table>
	
		<hr style="border: 1px solid rgb(211, 211, 211); width: 100%; margin-top:0;">			
		
	</div>
	
	<div id="btn">
			<a href="qna_modify?qna_idx=${dto.qna_idx}">
				<input type="button" value="수정" id="qna_modify" />
			</a>
			<a href="qna_delete?qna_idx=${ dto.qna_idx }">
				<input type="submit" value="삭제" id="qna_delete" />
			</a>
			
	</div>
	
	<div class="d-flex justify-content-center">
		<a href="user_qna"><button class="btn btn-secondary" value="">목록으로</button></a>
	</div>
</div>
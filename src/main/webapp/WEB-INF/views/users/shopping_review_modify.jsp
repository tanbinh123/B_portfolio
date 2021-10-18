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
		<form action="shopping_review_modify_action" method="post" name="shopping_review_modify_action" id="shopping_review_modify_action">
			<input type="hidden" id="review_idx" name="review_idx" value="${ dto.review_idx }" />
			<table class="table">
				<tr>
					<td style="width: 10%;">제목</td>
				<td align="left" >
					<input type="text" id="review_title" name="review_title" value="${ dto.review_title }" />
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ dto.review_member_id }</td>
				</tr>
						<tr>
					<td>상품명 <br /><span style="font-size: 13px; color: gray; text-align:center;">주문상품 중<br/> 선택 가능합니다.</span> </td>
					<td><select name="review_items" id="review_items"><option selected>상품명</option>
   <c:forEach items="${ list }" var="rdto">
   <option title="/upload/${ rdto.order_img }" value="${ rdto.order_title }">${ rdto.order_title }</option>
   </c:forEach>
</select></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea style="width: 80%; height: 300px;" name="review_content" id="review_content">${dto.review_content}</textarea>
					</td>
				</tr>
			</table>
			
			<hr style="border: 1px solid rgb(211, 211, 211); width: 100%; margin-top:0;">
		        <!-- 
		    <input style="width: 80px;" class="btn btn-primary" type="submit" value="수정하기"> -->
		    
		    <div id="btn" class="container container-fluid" style="margin-top:15px;">
				<input style="width: 80px;" type="submit" value="수정하기">
			</div>
		    
		</form>		
		    
		</div>
		  
		<div class="d-flex justify-content-center">
			<a href="shopping_review"><button class="btn btn-secondary" value="">목록으로</button></a>
		</div>
	</div>
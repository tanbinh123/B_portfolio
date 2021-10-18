<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>
<script src="/js/jquery.dd.min.js"></script>

<link rel="stylesheet" href="/css/dd.css">
<style>
.radio {
margin: 10px;
}
</style>
<%
		String member_id = (String)session.getAttribute("member_id");
 %>

<div class="container container-fluid" style="margin-top: 30px;">
	<table style="text-align: center;" class="table table-bordered">
		<tr>
			<td><h5>무엇을 도와드릴까요?</h5>
				<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
				<h6>친절히 안내해 드립니다.</h6></td>
		</tr>
	</table>
</div>
<!--  테이블 -->
<div class="main">
	<h3>환불 신청</h3>
	<form method="post" action="cancel_submit" id="cancel_submit">
		<table style="" class=" table table-bordered">	<tr>
					<td> <input type="hidden" name="cancel_id" id="cancel_id" value="<%=member_id%>" />상품명 <br /><span style="font-size: 13px; color: gray; text-align:center;">주문상품 중<br/> 선택 가능합니다.</span> </td>
					<td><select style="width:250px; "name="cancel_title" id="cancel_title"><option selected>상품명</option>
   <c:forEach items="${ list }" var="dto">
   <option style="" title="/upload/${ dto.order_img }" value="${ dto.order_title }">${ dto.order_title }</option>
   </c:forEach>
</select></td>
				</tr>
			<tr class="" style="">
				<td class="" style="text-align: center;">사유 선택</td>
				<td><input class="radio" type="radio" name="cancel_status2" value="1">단순
					변심<input class="radio" type="radio" name="cancel_status2" value="2">제품 이상
					및 파손<input class="radio" type="radio" name="cancel_status2" value="3">오배송<input
					class="radio" type="radio" name="cancel_status2" value="4">기타</td>
			</tr>
			<tr>

				<td style="text-align: center;">내용 작성</td>
				<td><textarea cols="100" rows="20" id="cancel_content"
						name="cancel_content"></textarea></td>
			</tr>
		</table>
		<div style="text-align: center;">
			<input id="cancelSubmit" onclick="button1_click();" type="submit" class="btn btn-primary" value="신청">
		</div>
	</form>
</div>
<style>img {
width:50px;
height:50px;
}</style>


<script>$("body select").msDropDown();</script>
<script>
function button1_click() {
	alert(${ alert });
}

</script>

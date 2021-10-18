<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<style>
.radio {
	margin: 10px;
}
</style>
<%
String member_id = (String) session.getAttribute("member_id");
%>

<div class="container container-fluid" style="margin-top: 30px;">
	<table style="text-align: center;" class="table table-bordered">
		<tr>
			<td><h5>환불 신청 방법</h5>
				<h6>환불 신청은 <span style="font-weight:bold;">희망배송일 전일 마감시간 (오전6시, 오후1시)전까지 가능합니다.</span></h6>
		</tr>
	</table>
</div>
<!--  테이블 -->
<div style="text-align:center;" class="d-flex flex-column justify-content-center">
	<table style="text-align:center;" class="">
		<tr>
			<td colspan="2"><img style="width: 85%;" src="./img/time.png">
	<h3 style="text-align:center;margin-top:30px; margin-bottom:30px;">환불 신청 방법</h3></td>
		</tr>
		<tr>
			<td><h5>[오전 6시 전에 주문한 경우]</h5><h6>오전 6시 이전 주문 건은</h6><h6><span style="font-weight: bold;">희망배송일 전일 오전 6시</span>까지 취소 가능!</h6></td>
			<td><h5>[오후 1시 전에 주문한 경우]</h5><h6>오전 6시~오후 1시 주문 건은</h6><h6><span style="font-weight: bold;">희망배송일 전일 오후 1시</span>까지 취소 가능!</h6></td>
		</tr>
	</table>
	
	
	<a href="user_cancel?member_id=<%=member_id%>" style="text-align:center; margin-top:50px;"><button class="btn btn-primary">환불신청 하러가기</button></a>
</div>

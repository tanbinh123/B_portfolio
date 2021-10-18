<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>


<div class="d-flex flex-row">
	<div class="d-flex flex-column col-md-2">
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h4>공지사항</h4></td>
				</tr>
			</table>
		</div>
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table">
				<tr>
					<td><h5>1:1문의</h5>
						<h6>비공개로 고객님께</h6>
						<h6>맞춤 답변을 드립니다.</h6></td>
				</tr>
			</table>
		</div>
		<div style="margin: 20px;">
			<table style="text-align: center;" class="table">
				<tr>
					<td><h6>고객센터</h6>
						<h6>070-0000-0000</h6>
						<br />
					<h6>평일 10~18시</h6>
						<h6>주말, 공휴일 휴무</h6></td>
				</tr>
			</table>
		</div>
	</div>


	<div class="d-flex flex-column col-md-9" style="margin-left: 60px;">
		<div class="container container-fluid" style="margin-top:30px;">
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
			<table style="" class=" table table-bordered">
				<tr>

					<td style="text-align: center;" >제목</td>
					<td>${ dto.notice_title }</td>
				</tr>
				<tr class="" style="height: 500px; padding:30px;" >
					<td class="" style="text-align: center;">내용</td>
					<td rowspan="5"><input id="notice_idx"
						name="notice_idx" type="hidden" value="${ dto.notice_idx }">${ dto.notice_content }</td>
				</tr>
		
			</table>


		</div>
		<div class="d-flex justify-content-center">
			<a style="margin-left: 75px;" href="user_notice"><button
					class="btn btn-secondary" value="">목록으로</button></a>
		</div>

	</div>
</div>
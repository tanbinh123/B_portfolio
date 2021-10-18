<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>
<!-- 주문관리 테이블 -->
		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>무엇을 도와드릴까요?</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>

<table style="text-align:center;" class="table">
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items='${ list }'>
			<tr>
				<td>${dto.faq_idx}</td>
				<td><a href="faq_view?faq_idx=${ dto.faq_idx }">${dto.faq_title}</a></td>


			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 페이지 네비게이션 -->




<div style="display: block; text-align: center;">


	<c:if test="${page.prev}">
		<span>[ <a
			href="/faq_list?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
			]
		</span>
	</c:if>

	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
		var="num">
		<span> <c:if test="${select != num}">
				<a href="/faq_list?num=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> <c:if test="${select == num}">
				<b>${num}</b>
			</c:if>

		</span>
	</c:forEach>

	<c:if test="${page.next}">
		<span>[ <a
			href="/faq_list?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
			]
		</span>
	</c:if>



</div>
<div id="faqSearch" class="faqSearch">
	<select id="searchType" name="searchType">
		<option value="title"
			<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
		<option value="content"
			<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
		<option value="title_content"
			<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
	</select> <input type="search" id="keyword" name="keyword" value="${ keyword }"
		class="searchbar">
	<button id="searchButton" class="btn btn-secondary">
		검색</button>
</div>
<script>
	document.getElementById("searchButton").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		location.href = "/faq_list?num=1" + "&searchType=" + searchType
				+ "&keyword=" + keyword;
	};
</script>
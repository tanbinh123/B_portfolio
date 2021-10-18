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
<!-- 메인 -->
<div class="main-content container col-md-9">

		<div class="container container-fluid" style="margin-top:30px;">
					<table style="text-align: center;" class="table table-bordered">
				<tr>
					<td><h5>무엇을 도와드릴까요?</h5>
						<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
						<h6>친절히 안내해 드립니다.</h6></td>
				</tr>
			</table>
		</div>

	<!-- 공지사항 검색 -->




		<%-- <c:forEach begin="1" end="${pageNum}" var="num">
  		<span>
  			<a href="/board/listPage?num=${num}">${num}</a>
		</span>
	</c:forEach> --%>




		<!-- 주문관리 테이블 -->
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items='${ list }'>
					<tr>
						<td>${dto.notice_idx}</td>
						<td><a href="user_notice_view?notice_idx=${ dto.notice_idx }">${dto.notice_title}</a></td>

						<td><fmt:formatDate value="${ dto.notice_date }"
								pattern="yyyy.MM.dd" /></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지 네비게이션 -->




		<div style="display: block; text-align: center;">


			<c:if test="${page.prev}">
				<span>[ <a
					href="/user_notice?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					]
				</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
				var="num">
				<span> <c:if test="${select != num}">
						<a href="/user_notice?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if> <c:if test="${select == num}">
						<b>${num}</b>
					</c:if>

				</span>
			</c:forEach>

			<c:if test="${page.next}">
				<span>[ <a
					href="/user_notice?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					]
				</span>
			</c:if>



		</div>
		<div id="noticeSearch" class="noticeSearch">
			<select id="searchType" name="searchType">
				<option value="title"
					<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="title_content"
					<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			</select> <input type="search" id="keyword" name="keyword"
				value="${ keyword }" class="searchbar">
			<button type="submit" id="searchButton" class="btn btn-secondary">
				검색</button>
		</div>
	</div>
</div>
	<script>

	document.getElementById("searchButton").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "/user_notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
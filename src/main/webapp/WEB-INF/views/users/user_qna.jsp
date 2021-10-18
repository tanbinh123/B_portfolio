<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<%
String member_id = (String) session.getAttribute("member_id");
%>

<style>
	a{
		cursor:pointer;
	}
	
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


<div class="container container-fluid" style="margin-top:30px;">
	<table style="text-align: center;" class="table table-bordered">
		<tr>
			<td>
				<h5>무엇을 도와드릴까요?</h5>
				<h6>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화주시거나 1:1문의로 남겨주세요.</h6>
				<h6>친절히 안내해 드립니다.</h6>
			</td>
		</tr>
	</table>
</div>
		<div id="noticeSearch" class="noticeSearch">
			<select id="searchType" name="searchType">
				<option value="title"
					<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="name"
					<c:if test="${page.searchType eq 'name'}">selected</c:if>>작성자</option>
			</select> <input type="search" id="keyword" name="keyword"
				value="${ keyword }" class="searchbar">
			<button type="submit" id="searchButton" class="btn btn-secondary">
				검색</button>
		</div>
<table style="text-align:center; " class="table container container-fluid" >
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items='${ qna_list }'>
			<input type="hidden" value="${dto.qna_pw}" id="pw${dto.qna_idx}">
			<tr>
				<td>${dto.qna_idx}</td>
				<td><a onclick="popup(${dto.qna_idx})"><img src="img/lock.png" style="width:15px; margin-right:5px;"/>${ dto.qna_title }</a></td>
				<td>${ dto.qna_name }</td>
				<td><fmt:formatDate value="${ dto.qna_date }" pattern="yyyy.MM.dd" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="d-flex flex-row justify-content-center">
			<c:if test="${page.prev}">
				<span>[ <a
					href="/user_qna?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					]
				</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
				var="num">
				<span> <c:if test="${select != num}">
						<a href="/user_qna?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if> <c:if test="${select == num}">
						<b>${num}</b>
					</c:if>

				</span>
			</c:forEach>

			<c:if test="${page.next}">
				<span>[ <a
					href="/user_qna?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					]
				</span>
			</c:if>
</div>




<div id="btn" class="container container-fluid" style="margin-top:30px;">
	<a href="qna_write?member_id=<%=member_id%>">
		<input type="button" value="글쓰기" id="qna_write" />
	</a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function popup(idx)
		{
			var pw = $('#pw'+idx).val();
			console.log(pw);
			var input_pw = prompt('비밀번호를 입력하세요.');
			console.log(input_pw);
			
			if(pw==input_pw){
				location.href = 'qna_view?qna_idx='+idx;
			}
			else{
				alert('비밀번호가 틀렸습니다.');
			}
		
		}

	document.getElementById("searchButton").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "/user_qna?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>

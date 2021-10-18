<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String member_id = (String) session.getAttribute("member_id");
%>

<div class="" style="margin-top: 200px;"></div>
<div
	class="d-flex flex-row justify-content-center loginForm container text-center">
	<div class="findMain">
		<table class="main1" style="text-align: center;">
			<tr>
				<td colspan="2"><h1>주문이 완료되었습니다</h1><h5>해당 주문은 주문내역에서 확인하실 수 있습니다.</h5> <br /></td>
			</tr>

			<tr>
				<td style="padding: 20px;" colspan="2"><a
					href="order_list?member_id=<%=member_id%>"><button
							class="btn btn-secondary">주문내역</button></a> <br /></td>
			</tr>

		</table>
	</div>
</div>


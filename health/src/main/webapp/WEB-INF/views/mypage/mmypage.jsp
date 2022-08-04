<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.PTSDto"%>
<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
MembersDto member = (MembersDto)request.getAttribute("member");
List<PTSDto> today = (List<PTSDto>)request.getAttribute("today");
List<PTSDto> upcoming = (List<PTSDto>)request.getAttribute("upcoming");
List<PTSDto> past = (List<PTSDto>)request.getAttribute("past");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table.type1 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;

}
table.type1 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type1 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

table.type2 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	width:600px;
}
table.type2 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type2 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	text-align: left;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>

<h1>고객 마이페이지</h1>

<div align="center">

<table class="type1">

<tr>
	<th>아이디</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getId()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getName()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>나이</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getAge()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getEmail()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>
		<input type="text" size="50px" value="<%=user.getPhone()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>PT 포인트</th>
	<td>
		<input type="text" size="50px" value="<%=member.getPtpoint()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>필라테스 포인트</th>
	<td>
		<input type="text" size="50px" value="<%=member.getFlpoint()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>결제정보</th>
	<td>
		<input type="text" size="50px" value="<%=member.getPrice()%>원" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" onclick="updateMember('<%=user.getId() %>')">정보수정</button>
	</td>
</tr>
</table>
<!-- ----------------------------------------------------------------------------- -->
<br>
금일 예약 현황
<table class="type2" border="1">
	<tr>
		<th>예약번호</th>
		<th>강사ID</th>
		<th>예약일</th>
		<th>시간</th>
	</tr>
	<%
	for(int i=0;i<today.size();i++)
	{
		%>
		<tr>
			<td><%=today.get(i).getSnum() %></td>
			<td><%=today.get(i).getTid() %></td>
			<td><%=today.get(i).getPtdate().substring(0,10) %></td>
			<td><%=today.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</table>
<br>
<!-- ----------------------------------------------------------------------------- -->
예정된 예약 현황
<table class="type2" border="1" style="size:600px;">
	<tr>
		<th>예약번호</th>
		<th>강사ID</th>
		<th>예약일</th>
		<th>시간</th>
	</tr>
	<%
	for(int i=0;i<upcoming.size();i++)
	{
		%>
		<tr>
			<td><%=upcoming.get(i).getSnum() %></td>
			<td><%=upcoming.get(i).getTid() %></td>
			<td><%=upcoming.get(i).getPtdate().substring(0,10) %></td>
			<td><%=upcoming.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</table><br>
<!-- ----------------------------------------------------------------------------- -->
지나간 예약 현황
<table class="type2" border="1">
	<tr>
		<th>예약번호</th>
		<th>강사ID</th>
		<th>예약일</th>
		<th>시간</th>
	</tr>
	<%
	for(int i=0;i<past.size();i++)
	{
		%>
		<tr>
			<td><%=past.get(i).getSnum() %></td>
			<td><%=past.get(i).getTid() %></td>
			<td><%=past.get(i).getPtdate().substring(0,10) %></td>
			<td><%=past.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</table>
<!-- ----------------------------------------------------------------------------- -->
</div>

<script type="text/javascript">
function updateMember(id){

    let password = prompt('비밀번호를 입력해주세요.');
    if(password==="<%=user.getPw()%>"){
  	 	alert('인증 되었습니다');
		location.href = "moveUpdateMember.do?id="+id;
    } else {
		alert('인증에 실패 했습니다');
		location.href = "moveMemberMypage.do";
    }
    
}

</script>

</body>
</html>
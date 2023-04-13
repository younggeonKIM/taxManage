<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, payer.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="taxStyle.css">
</head>
<body>
<header>
	<h1 align="center">세금 관리 시스템 ver1.0</h1>
</header>
<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
	<h2 align="center">회원 전체 목록</h2>
	<div align="center">
	<table border="1"><tr><th>계정</th><th>비밀번호</th><th>성명</th></tr>
<%
ArrayList als=(ArrayList) request.getAttribute("AL");
int count=als.size();
for (int i=0; i<count; i++) {
	Members mems=(Members)als.get(i);

%>
		<tr><td><%= mems.getId() %></td>
		<td><%= mems.getPwd() %></td>
		<td><%= mems.getName() %></td></tr>
	
<%} %>
	</table>
	</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>
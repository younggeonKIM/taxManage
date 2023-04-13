<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, amount.*" %>
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
	<h2 align="center">납부액 번호및연도 조회 결과</h2>
	
<%
ArrayList al=(ArrayList)request.getAttribute("AL");
ArrayList all=(ArrayList)request.getAttribute("ALL");

if(al != null && al.size() != 0){ 
%>	
<h3 align="center">조건에 맞는 검색 결과</h3>
<table border="1"><tr><th>납세자번호</th><th>납부번호</th><th>과세표준</th>
						<th>세율</th><th>계산세액</th><th>공제액</th><th>납부액</th>
						<th>귀속연도</th></tr>
<%
		int count=al.size();
		for (int i=0; i<count ; i++) {
			Amount amts=(Amount)al.get(i);
%>
		<tr><td><%= amts.getPayrnum() %></td>
			<td><a href="amoSelect.do?PYN=<%= amts.getPayno() %>
									&PYRN=<%= amts.getPayrnum() %>">
				<%= amts.getPayno() %></a></td>
			<td><%= amts.getStdd() %>
			<td><%= amts.getRate() %></td>
			<td><%= amts.getEstim() %></td>
			<td><%= amts.getDeduc() %></td>
			<td><%= amts.getPayed() %></td>
			<td><%= amts.getYear() %></td></tr>
<%
	}//end of for
	%>
</table>
<%
}else if (all != null && all.size() != 0){
%>
<h3 align="center">조건에 맞는 검색 결과</h3>
<table border="1"><tr><th>납세자명</th><th>납세자번호</th><th>납부번호</th><th>과세표준</th>
						<th>세율</th><th>계산세액</th><th>공제액</th><th>납부액</th>
						<th>귀속연도</th></tr>
<%	
		int counting=all.size();
		for (int i=0; i<counting ; i++) {
			Join joi=(Join)all.get(i);
%>
			<tr><td><%= joi.getName() %></td>
			<td>
				<%= joi.getPayrno() %></td>
			<td><a href="amoSelect.do?PYN=<%= joi.getPaynum() %>
									&PYRN=<%= joi.getPayrno() %>">
									<%= joi.getPaynum() %></a></td>
			<td><%= joi.getStdd() %></td>
			<td><%= joi.getRate() %></td>
			<td><%= joi.getEstm() %></td>
			<td><%= joi.getDeduc() %></td>
			<td><%= joi.getPayed() %></td>
			<td><%= joi.getYear() %></td></tr>
<%
	}//end of for
}else {
%>
	<div align="center" class="btns">
	<h3>검색결과가 없습니다.</h3>
	<input type="button" value="다시조회" onClick="goAmountSel()"/></div>
<%} %>
</table>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function goAmountSel() {
	if(confirm("납부액을 다시 조회하시겠습니까?")){
		location.href="amountSelect.jsp";
	}
}
</script>
</body>
</html>
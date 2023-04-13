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
	<h1 align="center">���� ���� �ý��� ver1.0</h1>
</header>
<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
	<h2 align="center">������ ����</h2>
	<div align="center">
	<table border="1"><tr><th>�����ڹ�ȣ</th><th>�����ڸ�</th><th>������</th>
				<th>���α���</th><th>������</th></tr>
<%
	ArrayList al=(ArrayList)request.getAttribute("AL");
	int count=al.size();
	for (int i=0; i<count ; i++) {
		Payers payr=(Payers)al.get(i);
%>
			<tr><td><a href="payerSelect.do?NUM=<%= payr.getPayrno() %>"><%= payr.getPayrno() %></a></td>
				<td><%= payr.getPayrnam() %></td>
				<td><%= payr.getPadate() %></td>
				<td><%= payr.getDudate() %></td>
				<td><%= payr.getPayplac() %></td></tr>
<%
} 
%>			
	</table>
	</div>
	<div align="right" class="btns">
	<input type="button" onClick="goPayerIns()" value="�����ڵ��"/>
	</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function goPayerIns() {
	location.href="payerInsert.do";
}
</script>
</body>
</html>
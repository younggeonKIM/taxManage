<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="payer.*" %>
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
	<h2 align="center">������ ���� �� ��ȸ</h2>
	<div align="center">
	<form action="payerUpdate.do" method="post" name="frm" 
			onSubmit="return check(this)">
	<table border="1">
		<tr><th>�����ڹ�ȣ</th><th>�����ڸ�</th><th>��������ȭ</th>
			<th>�������ּ�</th><th>������</th><th>���α���</th><th>������</th>
		</tr>
<%
		Payers payr=(Payers)request.getAttribute("PAYER");
%>
		<tr><td><input type="text" name="NUM" readonly value="<%= payr.getPayrno() %>"/></td>
			<td><input type="text" name="NAME" value="<%= payr.getPayrnam() %>"/></td>
			<td><input type="text" name="TEL" value="<%= payr.getTel() %>"/></td>
			<td><input type="text" name="ADDR" value="<%= payr.getAddr() %>"/></td>
			<td><input type="date" name="PAYDAT" value="<%= payr.getPadate() %>"/></td>
			<td><input type="date" name="DUEDAT" readonly value="<%= payr.getDudate() %>"/></td>
			<td><input type="text" name="PLACE" readonly value="<%= payr.getPayplac() %>"/></td></tr>
	</table>
				<br/><input type="submit" value="����"/>
	</form>
	</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function check(f) {
	if(confirm("�����Ͻðڽ��ϱ�?")){
		return true;
	}
	else {return false;}
}
</script>
</body>
</html>
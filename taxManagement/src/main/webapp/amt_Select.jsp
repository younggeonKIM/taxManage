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
	<h1 align="center">���� ���� �ý��� ver1.0</h1>
</header>

<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
	<h2 align="center">���ξ� ��ȣ�׿��� ��ȸ ���</h2>
	
<%
ArrayList al=(ArrayList)request.getAttribute("AL");
ArrayList all=(ArrayList)request.getAttribute("ALL");

if(al != null && al.size() != 0){ 
%>	
<h3 align="center">���ǿ� �´� �˻� ���</h3>
<table border="1"><tr><th>�����ڹ�ȣ</th><th>���ι�ȣ</th><th>����ǥ��</th>
						<th>����</th><th>��꼼��</th><th>������</th><th>���ξ�</th>
						<th>�ͼӿ���</th></tr>
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
<h3 align="center">���ǿ� �´� �˻� ���</h3>
<table border="1"><tr><th>�����ڸ�</th><th>�����ڹ�ȣ</th><th>���ι�ȣ</th><th>����ǥ��</th>
						<th>����</th><th>��꼼��</th><th>������</th><th>���ξ�</th>
						<th>�ͼӿ���</th></tr>
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
	<h3>�˻������ �����ϴ�.</h3>
	<input type="button" value="�ٽ���ȸ" onClick="goAmountSel()"/></div>
<%} %>
</table>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function goAmountSel() {
	if(confirm("���ξ��� �ٽ� ��ȸ�Ͻðڽ��ϱ�?")){
		location.href="amountSelect.jsp";
	}
}
</script>
</body>
</html>
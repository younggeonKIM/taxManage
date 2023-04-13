<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%
String payerno=request.getParameter("PYRN");
%>
	<h2 align="center">������ ����ϱ�</h2>
	<form action="taxInsert.do" method="post" onSubmit="return check(this)">
	<table>
	<tr><th>�����ڹ�ȣ</th><td><input type="text" name="NUM" value="<%=payerno %>" readonly/></td></tr>
	<tr><th>�����ڸ�</th><td><input type="text" name="NAME"/></td></tr>
	<tr><th>��������ȭ(-�����Է�)</th><td><input type="text" name="TEL"/></td></tr>
	<tr><th>�������ּ�</th><td><input type="text" name="ADDR"/></td></tr>
	<tr><th>������</th><td><input type="date" name="PADATE"/></td></tr>
	<tr><th>���α���</th><td><input type="date" name="DUDATE"/></td></tr>
	<tr><th>������</th><td><input type="text" name="PLACE"/></td></tr>
	
	</table><br/>
	<div align="right"><input type="submit" name="subm" value="����ϱ�"/></div>
	</form>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function check(f){
	if(! f.PADATE.includes("2021."){
		alert("2021�� ���������� ����� �����մϴ�.");
		return false;
	}
	if(! f.DUDATE.includes("2021."){
		alert("2021�� ���������� ����� �����մϴ�.");
		return false;
	}
	if(confirm("������ 2021�� ������ ������ ����Ͻðڽ��ϱ�?")){
		return true;
	} else{
		return false;
	}
}
</script>
</body>
</html>
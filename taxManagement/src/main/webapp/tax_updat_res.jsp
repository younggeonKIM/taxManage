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
	<h2 align="center">������ �������� ��ȸ �� ���� ���</h2>
	<div align="center" class="btns3">
	<h3 id="HTHT"></h3>
	<br/>
	<input type="button" value="Ȩ����" onClick="toHome()"/><br/><br/>
	����� ������ ��ȸ�Ϸ��� <input type="button" value="Ŭ��" onClick="toPayerAll()"/>
	</div>
<%
	String mess=request.getParameter("M");
	String res=request.getParameter("R");
	if ("OK".equals(res)) {
%>
<script type="text/javascript">
		alert("�������� ������ �Ϸ�ƽ��ϴ�.");
		document.getElementById("HTHT").innerHTML="���������� ����ƽ��ϴ�."
</script>
<%}else if ("NOK".equals(res)){
	%>
<script type="text/javascript">
		alert("�������� �����ϴ� ���� �����߽��ϴ�.");
		document.getElementById("HTHT").innerHTML="���������� ������ �� �����ϴ�."
</script>
<%
}else if (mess.equals("N")) {
	%>
<script type="text/javascript">
	alert("���������� ��ȸ�ϰ� ������ ������ �����ϴ�.");
	document.getElementById("HTHT").innerHTML="���������� ��ȸ�� �� �����ϴ�."
</script>
<%
}
%>

<script type="text/javascript">
function toHome() {
	if(confirm("���� ȭ������ ���ư��ðڽ��ϱ�?")) {
		location.href="tax_index.jsp";
	}
}
function toPayerAll() {
	location.href="payerAll.do";
}
</script>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>
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
	<h2 align="center">���ξ� �����Ű�װ���û�� ���</h2>
	<div align="center" class="btns">
	<h3 id="HTHT"></h3>
	<input type="button" name="HOME" id="HOME" value="��������"
			onClick="gobackHome()"/><br/>
	����� ������ ��ȸ�Ϸ��� <input type="button" value="Ŭ��" onClick="toAmountSelect()"/>
	</div>
<%
String mes=request.getParameter("M");
String resu=request.getParameter("R");
if ("OK".equals(resu)) {
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
									"�����Ű� �� ����û�� ó���� �Ϸ�ƽ��ϴ�.";
</script>
<%
} else if("NOK".equals(resu)){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"�����Ű� �� ����û�� ó������ �ʾҽ��ϴ�. <br/>"+
		"�����ڿ��� �����ϼ���.";
</script>
<%
} else if (mes.equals("N")){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"���� ������ �����Ű� �� ����û�� ������ �����ϴ�.";
</script>
<%
}
%>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function gobackHome() {
	if (confirm("Ȩ���� ���ư��ðڽ��ϱ�?")) {
		location.href="tax_index.jsp";
	}
}
function toAmountSelect() {
	location.href="amountSelect.jsp";
}
</script>
</body>
</html>
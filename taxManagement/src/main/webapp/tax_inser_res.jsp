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
	<h2 align="center">������ ��� ���</h2>
	<div align="center" >
	<h3 id="HTHT"></h3><br/><br/>
	���ο� ������ ����Ϸ� ���� : <input type="button" value="Ŭ��" onClick="toPayerIns()" name="btn"/>
	</div>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"������ ����� ���������� �Ϸ�ƽ��ϴ�.";
</script>
<%
} else if(result.equals("NOK")){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"������ ��Ͽ� �����߽��ϴ�.";
</script>
<%
}
%>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function toPayerIns() {
	if(confirm("�ٽ� ������ ��� ȭ������ �̵��Ͻðڽ��ϱ�?")) {
		location.href="payerInsert.do";
	}
}
</script>
</body>
</html>
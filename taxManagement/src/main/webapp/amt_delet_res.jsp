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
	<h2 align="center">������ ���� ��� ���� �Ϸ�</h2>
	<div align="center" class="btns">
	<h3 id="HTHT"></h3>
	<input type="button" name="HOME" id="HOME" value="��������"
			onClick="gobackHome()"/>
	</div>
<%
	String resul=request.getParameter("R");
	if (resul.equals("OK")){
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
										"������ �Ϸ�ƽ��ϴ�.";
	function gobackHome() {
		if (confirm("Ȩ���� ���ư��ðڽ��ϱ�?")) {
			location.href="tax_index.jsp";
		}
	}
</script>		
<%		
	}else if (resul.equals("NOK")) {
%>
<script type="text/javascript">
document.getElementById("HTHT").innerHTML=
							"���� ó������ �ʾҽ��ϴ�. <br/>"+
							"�����ڿ��� �����ϼ���.";
</script>
<%} %>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>

</body>
</html>
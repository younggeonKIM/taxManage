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
	<h2 align="center">ȸ�� ��� ���</h2>
	<div align="center" class="btns3" id="HTHTHT">
	<h3 id="HTHT"></h3>
	�α��� �Ϸ����� : <input type="button" value="Ŭ��" onClick="toLogin()"/><br/>
	ȸ����� �Ϸ����� : <input type="button" value="ȸ�����" onClick="toMemRegi()"/>
	</div>
<%
String mes=request.getParameter("M");
String res=(String)request.getAttribute("RES");
if ("OK".equals(res)){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"ȸ������� �Ϸ�ƽ��ϴ�. �α����� �ּ���.";
	
</script>
<%	
} else if ("NOK".equals(res)){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"ȸ����Ͽ� �����߽��ϴ�. �ٽ� ȸ�� ����� �� �ּ���.";
</script>
<%	
} else if ("DOUBL".equals(res)){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"�̹� ������ �Ϸ�� ȸ���Դϴ�. �α����� �ּ���.";
</script>
<%
} else if ("N".equals(mes)){
%>	
<script type="text/javascript">
	document.getElementById("HTHTHT").innerHTML=
		"������ ���� ���θ��� ȸ������ ��ϰ����մϴ�. �α׾ƿ��� �ּ���.";
</script>
<%} %>
<script type="text/javascript">
function toLogin() {
	if(confirm("�α��� ȭ������ �̵��Ͻðڽ��ϱ�?")) {
		location.href="tax_login.jsp";
	}
}
function toMemRegi(){
	if(confirm("ȸ����� ȭ������ �̵��Ͻðڽ��ϱ�?")){
		location.href="memRegi.do";
	}
}
</script>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>
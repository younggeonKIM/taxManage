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
	<h2 align="center">�α��� ���</h2>
	<div align="center" class="btns2" id="HTHTHT">
	<h3 id="HTHT"></h3>
	
	�ٽ� �α��� �Ϸ����� : <input type="button" value="Ŭ��" onClick="toLogin()"/><br/>
	ȸ����� �Ϸ����� : <input type="button" value="ȸ�����" onClick="toMemRegi()"/>
	</div>
<%
String res=request.getParameter("R");

System.out.println("�Ѱܹ��� ��: "+res);
if (res.equals("OK")){
	String id=(String)session.getAttribute("LOGID");
	System.out.println(id);

%>
<script type="text/javascript">
	document.getElementById("HTHTHT").innerHTML="�α��ο� �����߽��ϴ�. ȯ���մϴ�." + <%= id %> +"��";
	
</script>
<%
}else if(res.equals("NOID")){
	
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML="��ġ�ϴ� ������ �����ϴ�. ���� ȸ������� ���ּ���.";
</script>
<% 
}else if(res.equals("NOPWD")){
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML="��й�ȣ�� �ùٸ��� �ʽ��ϴ�. ��й�ȣ�� Ȯ�� �� �ٽ� �α������ּ���.";
</script>
<%	
}
%>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
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
</body>
</html>
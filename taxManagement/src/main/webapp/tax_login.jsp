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
	String m=request.getParameter("M");
	if("Y".equals(m)) {
%>
<script type="text/javascript">
		alert("���񽺸� �̿��Ͻ÷���, �α����ؾ� �մϴ�.");
</script>
<%
} else if("ADM".equals(m)){
%>
<script type="text/javascript">
		alert("�����ڸ��� ��� �����մϴ�.");
		location.href="tax_logout.do";
		location.href="tax_login.jsp";
</script>
<%
			
}
%>
	<h2 align="center">�α��� ���ֽʽÿ�.</h2>
	<div class="btns">
	<form action="loginMemSel.do" name="frm" method="post" onSubmit="return check(this)">
	���� : <input type="text" name="ID" size="15"/><br/>
	��й�ȣ : <input type="password" name="PWD" size="10"/><br/><input type="submit" name="btn" value="�α���"/>
	</form>
	</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function check(f) {
		
	if(f.ID.value=="") {
		alert("������ �Է����ּ���.");
		return false;
	}
	if(f.PWD.value=="") {
		alert("��й�ȣ�� �Է����ּ���.");
		return false;
	}

	
	
}
</script>
</body>
</html>
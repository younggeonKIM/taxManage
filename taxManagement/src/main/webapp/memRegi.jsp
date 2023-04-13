<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, payer.*" %>
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
	<h2 align="center">ȸ�� ����Ϸ� ���̱���!</h2>
<%
Members mems=(Members)request.getAttribute("MEM");
%>
<div class="btns4">
<form action="memInsert.do" method="post" name="frm" onSubmit="return checkck(this)">
<input type="hidden" name="NAMECFM" value="<%= mems.getName() %>"/>
<table>
	<tr><th>���� : </th><td><input type="text" name="ID" value="<%= mems.getId() %>" readonly/></td></tr>
	<tr><th>��й�ȣ : </th><td><input type="password" name="PWD" id="PWD"/></td></tr>
	<tr><th>��й�ȣ Ȯ�� : </th><td><input type="password" name="PWDCHK" id="PWDCHK"/></td></tr>
	<tr><th>���� : </th><td><input type="text" name="NAME" id="NAME" value="<%= mems.getName() %>" /></td></tr>
	<tr><td colspan="2"><input type="submit" value="ȸ�����"/></td></tr>
</table>
</form>
</div>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
function checkck(f) {
	if(f.PWD.value=='') {
		alert("����Ͻ� ��й�ȣ�� �Է����ּ���.");
		return false;
	}
	if(isNaN(f.PWD.value)==true){
		alert("��й�ȣ�� ���ڸ� �Է� �����մϴ�.");
		return false;
	}
	if(f.PWD.value!=f.PWDCHK.value) {
		alert("��й�ȣ�� Ȯ�����ּ���.");
		return false;
	}
	if(f.NAME.value==''){
		alert("������ �Է����ּ���.");
		return false;
	}
	if(f.NAME.value!=f.NAMECFM.value){
		alert("������ ����� �ִ� �и� ȸ������ ����� �� �ֽ��ϴ�.");
		return false;
	}
	if(confirm("������ ����Ͻðڽ��ϱ�?")){
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>
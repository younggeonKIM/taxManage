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
HttpSession sess=request.getSession();
String logId=(String)sess.getAttribute("LOGID");
%>
	<h2 align="center">���κ� 3�Ⱓ ���ξ� ��ȸ</h2>
	<div align="center" class="btns2">
	<form action="amountSelect.do" method="post" name="frm">
	<table>
		<tr>
		<td>�����ڹ�ȣ : <input type="text" name="NUM"/></td>
		<td><input type="submit" value="��ȣ�� ��ȸ" name="btn"/></td>
		</tr>
		<tr>
		<td>�����ڸ� : <input type="text" name="NAME"/></td>
		</tr>
		<tr><td>�ͼӿ��� : <input type="text" name="YEAR"/></td>
			<td><input type="submit" value="�̸��׿������� ��ȸ" name="btn"/></td>
		</tr>
	</table>
	
	</form>
	</div>
<!-- 	<form method="post" name="inser" > -->
<!-- 	<input type="hidden" name="NUM"/> -->
<!-- 	<input type="hidden" name="BTN" value="�������� ���"/> -->
<!-- 	</form> -->
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
<script type="text/javascript">
// function doAmountInsert() {
// 	var f = document.inser;
// 	f.action="amountInsert.do";
// 	f.NUM.value = document.frm.NUM.value;
<%-- 	if(!<% logId.contains("admin"); %>){ --%>
// 		alert("�����ڸ��� ���� ������ �Է��� ������ �ֽ��ϴ�.");
// 		return false;
<%-- 	} else if (<% logId.contains("admin"); %>) { --%>
// 		return true;
// 	}
// 	f.submit();
// }

</script>
</body>
</html>
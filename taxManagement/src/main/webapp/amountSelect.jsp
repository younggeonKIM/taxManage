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
	<h1 align="center">세금 관리 시스템 ver1.0</h1>
</header>
<menu>
	<jsp:include page="tax_menu.jsp"/>
</menu>
<section>
<% 
HttpSession sess=request.getSession();
String logId=(String)sess.getAttribute("LOGID");
%>
	<h2 align="center">개인별 3년간 납부액 조회</h2>
	<div align="center" class="btns2">
	<form action="amountSelect.do" method="post" name="frm">
	<table>
		<tr>
		<td>납세자번호 : <input type="text" name="NUM"/></td>
		<td><input type="submit" value="번호로 조회" name="btn"/></td>
		</tr>
		<tr>
		<td>납세자명 : <input type="text" name="NAME"/></td>
		</tr>
		<tr><td>귀속연도 : <input type="text" name="YEAR"/></td>
			<td><input type="submit" value="이름및연도별로 조회" name="btn"/></td>
		</tr>
	</table>
	
	</form>
	</div>
<!-- 	<form method="post" name="inser" > -->
<!-- 	<input type="hidden" name="NUM"/> -->
<!-- 	<input type="hidden" name="BTN" value="납부정보 등록"/> -->
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
// 		alert("관리자만이 납부 정보를 입력할 권한이 있습니다.");
// 		return false;
<%-- 	} else if (<% logId.contains("admin"); %>) { --%>
// 		return true;
// 	}
// 	f.submit();
// }

</script>
</body>
</html>
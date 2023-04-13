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
	<h2 align="center">납부액 수정신고및경정청구 결과</h2>
	<div align="center" class="btns">
	<h3 id="HTHT"></h3>
	<input type="button" name="HOME" id="HOME" value="메인으로"
			onClick="gobackHome()"/><br/>
	변경된 정보를 조회하려면 <input type="button" value="클릭" onClick="toAmountSelect()"/>
	</div>
<%
String mes=request.getParameter("M");
String resu=request.getParameter("R");
if ("OK".equals(resu)) {
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
									"수정신고 및 경정청구 처리가 완료됐습니다.";
</script>
<%
} else if("NOK".equals(resu)){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"수정신고 및 경정청구 처리되지 않았습니다. <br/>"+
		"관리자에게 문의하세요.";
</script>
<%
} else if (mes.equals("N")){
%>	
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
		"현재 계정은 수정신고 및 경정청구 권한이 없습니다.";
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
	if (confirm("홈으로 돌아가시겠습니까?")) {
		location.href="tax_index.jsp";
	}
}
function toAmountSelect() {
	location.href="amountSelect.jsp";
}
</script>
</body>
</html>
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
	<h2 align="center">납세자 개인정보 조회 및 수정 결과</h2>
	<div align="center" class="btns3">
	<h3 id="HTHT"></h3>
	<br/>
	<input type="button" value="홈으로" onClick="toHome()"/><br/><br/>
	변경된 정보를 조회하려면 <input type="button" value="클릭" onClick="toPayerAll()"/>
	</div>
<%
	String mess=request.getParameter("M");
	String res=request.getParameter("R");
	if ("OK".equals(res)) {
%>
<script type="text/javascript">
		alert("개인정보 수정이 완료됐습니다.");
		document.getElementById("HTHT").innerHTML="개인정보가 변경됐습니다."
</script>
<%}else if ("NOK".equals(res)){
	%>
<script type="text/javascript">
		alert("개인정보 수정하는 데에 실패했습니다.");
		document.getElementById("HTHT").innerHTML="개인정보를 변경할 수 없습니다."
</script>
<%
}else if (mess.equals("N")) {
	%>
<script type="text/javascript">
	alert("개인정보를 조회하고 수정할 권한이 없습니다.");
	document.getElementById("HTHT").innerHTML="개인정보를 조회할 수 없습니다."
</script>
<%
}
%>

<script type="text/javascript">
function toHome() {
	if(confirm("메인 화면으로 돌아가시겠습니까?")) {
		location.href="tax_index.jsp";
	}
}
function toPayerAll() {
	location.href="payerAll.do";
}
</script>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>
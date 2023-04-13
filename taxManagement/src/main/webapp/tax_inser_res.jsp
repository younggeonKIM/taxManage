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
	<h2 align="center">납세자 등록 결과</h2>
	<div align="center" >
	<h3 id="HTHT"></h3><br/><br/>
	새로운 납세자 등록하러 가기 : <input type="button" value="클릭" onClick="toPayerIns()" name="btn"/>
	</div>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"납세자 등록이 성공적으로 완료됐습니다.";
</script>
<%
} else if(result.equals("NOK")){
%>
<script type="text/javascript">
		document.getElementById("HTHT").innerHTML=
			"납세자 등록에 실패했습니다.";
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
	if(confirm("다시 납세자 등록 화면으로 이동하시겠습니까?")) {
		location.href="payerInsert.do";
	}
}
</script>
</body>
</html>
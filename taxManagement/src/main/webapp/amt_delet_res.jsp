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
	<h2 align="center">데이터 보존 기록 삭제 완료</h2>
	<div align="center" class="btns">
	<h3 id="HTHT"></h3>
	<input type="button" name="HOME" id="HOME" value="메인으로"
			onClick="gobackHome()"/>
	</div>
<%
	String resul=request.getParameter("R");
	if (resul.equals("OK")){
%>
<script type="text/javascript">
	document.getElementById("HTHT").innerHTML=
										"삭제가 완료됐습니다.";
	function gobackHome() {
		if (confirm("홈으로 돌아가시겠습니까?")) {
			location.href="tax_index.jsp";
		}
	}
</script>		
<%		
	}else if (resul.equals("NOK")) {
%>
<script type="text/javascript">
document.getElementById("HTHT").innerHTML=
							"삭제 처리되지 않았습니다. <br/>"+
							"관리자에게 문의하세요.";
</script>
<%} %>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>

</body>
</html>
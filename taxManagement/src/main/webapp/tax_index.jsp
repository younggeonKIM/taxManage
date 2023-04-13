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
	<h2 align="center">세금 관리 시스템을 방문해주셔서 감사합니다.</h2>
	<p>저희 시스템에서는 <b>소득세</b>나 <b>법인세</b>를 납부하신 개인들에게만 서비스를 제공해드리고
	있습니다.<br/>서비스를 이용하기 위해서는 국내 183일 이상 주소를 두고 국내원천소득이 
	존재하며 본인의 명의로 납세의무가 성립하여 확정된 후에 납부한 사실이 있는 분들에 한하여
	회원으로 등록할 수 있습니다.<br/>
	관리자 계정으로만 로그인할 수 있으며 방문 고객님들께서는 자신의 납세자번호를 입력하여  
	신고된 개인정보와 신고된 과세표준 및 납부된 세액 등을 확인할 수 있습니다.<br/> 
	현재 제공되는 서비스 :<br/>
	1. 납세자 정보 조회 및 개인 상세정보 수정<br/>
	2. 최근 3년 연별 납부액 산정 정보 조회, 수정, 삭제<br/></p>
</section>
<footer>
	<h3 align="center">YounggeonKim copyright 2022 All right reserved</h3>
</footer>
</body>
</html>
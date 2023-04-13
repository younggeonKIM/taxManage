<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="txm">
<a href="tax_index.jsp">홈으로</a>&nbsp;&nbsp;
<a href="payerAll.do">납세자 조회하기</a>&nbsp;&nbsp;
<a href="amountSelect.jsp">납부액 상세 조회하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="memRegi.do">회원등록</a>&nbsp;&nbsp;&nbsp;
<a href="memSelect.do">전체 회원 조회하기</a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div class="log" align="right">
<%
	String id=(String)session.getAttribute("LOGID");
	if(id==null) {
%>
<a href="tax_login.jsp">● 로그인</a>
<%
} else if (id!=null) { 
%>
<a href="tax_logout.do">● 로그아웃</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font>환영합니다~<%= id %>님</font>
<%
} 
%>
</div>
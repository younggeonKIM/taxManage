<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="txm">
<a href="tax_index.jsp">Ȩ����</a>&nbsp;&nbsp;
<a href="payerAll.do">������ ��ȸ�ϱ�</a>&nbsp;&nbsp;
<a href="amountSelect.jsp">���ξ� �� ��ȸ�ϱ�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="memRegi.do">ȸ�����</a>&nbsp;&nbsp;&nbsp;
<a href="memSelect.do">��ü ȸ�� ��ȸ�ϱ�</a>
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
<a href="tax_login.jsp">�� �α���</a>
<%
} else if (id!=null) { 
%>
<a href="tax_logout.do">�� �α׾ƿ�</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font>ȯ���մϴ�~<%= id %>��</font>
<%
} 
%>
</div>
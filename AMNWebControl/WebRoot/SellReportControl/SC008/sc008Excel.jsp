<%@page import="com.amani.bean.SC017Bean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.io.OutputStream"/>
<jsp:directive.page import="com.amani.bean.CompMoreTradeAnlysis"/>
<jsp:directive.page import="com.amani.action.SellReportControl.SC008Action"/>
<%
String path = request.getContextPath();
%>
<%
	try{
	
		SC008Action action=new SC008Action();
		String fname="门店业绩指标分析";
		OutputStream os = response.getOutputStream();//取得输出流
		response.reset();//清空输出流
		action.setLsDataSet((List<CompMoreTradeAnlysis>)request.getAttribute("lsDataSet"));
    	//下面是对中文文件名的处理
		response.setCharacterEncoding("UTF-8");
    	fname = java.net.URLEncoder.encode(fname, "UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename="+ new String(fname.getBytes("UTF-8"), "GBK") + ".xls");
    	response.setContentType("application/msexcel");//定义输出类型
		//传入os
    	action.setOs(os);
		action.createExcel();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<body>
	
	</body>
</html>

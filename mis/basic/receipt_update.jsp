<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%
	// 相關參數設定
	String code 		= "receipt";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "繳款紀錄維護";		// 功能標題
	Integer fSize = 1; 							// 設定圖檔上傳 MB 數

	try {
		String action = StringTool.validString(request.getParameter("action"));	// A:新增,M:修改,C:等級設定
		String rs_id = StringTool.validString(request.getParameter("rs_id"));

		// Conditions.
	    String qname = StringTool.validString(request.getParameter("_qname"));
		String qtitle = StringTool.validString(request.getParameter("_qtitle"));	// 抬頭
	   	String qaddress = StringTool.validString(request.getParameter("_qaddress"));
	   	String qcode = StringTool.validString(request.getParameter("_qcode")); 	// 繳款類別
	   	String qcollect = StringTool.validString(request.getParameter("_qcollect")); 	// 付款狀態
	
	 	// Names and values.
	   	String[] names = new String[] { "npage", "_qname", "_qaddress", "_qtitle", "_qcode", "_qcollect"};
	   	String[] values = new String[] { String.valueOf(pageno), qname, qaddress, qtitle, qcode, qcollect};	
	
	   	if("collect".equals(action)){
	   		// 修改付款狀態
	   		TableRecord rs = app_sm.select(tblrs, "rs_id=?", new Object[]{rs_id});
	   		rs.setUpdate(app_account);
	   		rs.setValue("rs_pay", "Y".equals(StringTool.validString(rs.getString("rs_pay")))?"N":"Y");
			app_sm.update(rs);
			
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('付款狀態修改成功!!');listpage.submit(); </script> ");
			return;
	   	}

	} catch(Exception e) {
		System.out.println("Project:" + projectName + ", Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
		out.println("<script> alert('處理失敗'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>
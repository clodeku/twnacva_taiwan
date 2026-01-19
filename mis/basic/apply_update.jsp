<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/config.jspf"%>
<%@ include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%
String aa_code 		= StringTool.validString(request.getParameter("aa_code"));	// 識別碼
String db_names 	= tblaa; 													// 使用哪張資料表
String show_title 	= "報名資訊維護";												// 功能標題

//
try{
	String code = StringTool.validString(request.getParameter("code"));		//A:新增,M:修改,D:刪除,S:排序
	String aa_id = StringTool.validString(request.getParameter("aa_id"));
	String ai_id = StringTool.validString(request.getParameter("ai_id"));

	// Conditions.

 	String qactivity = StringTool.validString(request.getParameter("_qactivity"));
	String qname 	 = StringTool.validString(request.getParameter("_qname"));
	String qphone 	 = StringTool.validString(request.getParameter("_qphone"));
	String qcollect	 = StringTool.validString(request.getParameter("_qcollect"));
	String qstatus	 = StringTool.validString(request.getParameter("_qstatus"));
	String qrecord	 = StringTool.validString(request.getParameter("_qrecord"));
	String qemail	 = StringTool.validString(request.getParameter("_qemail"));
	String qcode	 = StringTool.validString(request.getParameter("_qcode"));
	
	
	// Names and values.
	String[] names = new String[] { "npage"                ,"_qactivity","_qname","_qphone","_qcollect","_qstatus","_qrecord","_qemail","_qcode" };
	String[] values = new String[] { String.valueOf(pageno),  qactivity,   qname ,  qphone ,  qcollect ,   qstatus ,  qrecord,  qemail, qcode};
	
	out.println(HtmlCoder.form("backdata", "apply.jsp", names, values));
	  
	//---//
	if("D".equals(code)){//刪除
		app_sm.delete(db_names, "aa_id=?", new Object[] { aa_id });
		app_sm.close();
		out.println("<script> alert('刪除成功!!'); backdata.submit();  </script>");
		return;
	}
	
	if("POP3".equals(code)){//設定收件者
		// Tiltes.
		String[] titles = new String[] { show_title+"正本收件者",show_title+"副本收件者" };
		// Keywords.
		String[] keywords = new String[] { "original" , "duplicate" };
		// Get records.
		Vector smtps = new Vector();
		for (int i = 0; i < titles.length; i++) {
		    TableRecord ss = SiteSetup.getSetup(keywords[i]+"."+aa_code+"."+lang);
		    ss.setUpdate(app_account);
		    String value = StringTool.validString(request.getParameter(keywords[i]));
		    ss.setValue("ss_value", value);
		    ss.setUpdate(app_account);
		    app_sm.update(ss);
		}
		out.println("<script> alert('收件者設定成功!!'); backdata.submit();  </script>");
		return;
	}else if("record".equals(code)){//變更處理狀態
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		aa.setValue("aa_record_status", "Y".equals(aa.getString("aa_record_status"))?"N":"Y");
		aa.setUpdate(app_account);
		app_sm.update(aa);
		out.println("<script> alert('報名紀錄狀態已變更!!'); backdata.submit();  </script>");
		return;
	}else if("Status".equals(code)){//變更處理狀態
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		aa.setValue("aa_status", "Y".equals(StringTool.validString(request.getParameter("aa_status")))?"Y":"N");
		aa.setUpdate(app_account);
		app_sm.update(aa);
		out.println("<script> alert('報名狀態已變更!!'); backdata.submit();  </script>");
		return;
	}else  if("Collect".equals(code)){
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		TableRecord rs = app_sm.select(tblrs, "aa_id=?", new Object[]{aa_id});	// 對應的收據紀錄
		
		aa.setValue("aa_collect", "Y".equals(StringTool.validString(request.getParameter("aa_collect")))?"Y":"N");
		aa.setUpdate(app_account);
		app_sm.update(aa);
		
		rs.setValue("rs_pay", aa.getString("aa_collect"));
		rs.setUpdate(app_account);
		app_sm.update(rs);
		
		out.println("<script> alert('付款狀態已變更!!'); backdata.submit();  </script>");
		return;
	}else if("img_check".equals(code)){
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		aa.setValue("aa_image_check", "Y".equals(StringTool.validString(request.getParameter("aa_image_check")))?"Y":"N");
		aa.setUpdate(app_account);
		app_sm.update(aa);
		out.println("<script> alert('證件照確認已經變更!!'); backdata.submit();  </script>");
		return;
	}else if("memo".equals(code)){
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		aa.setValue("aa_memo", StringTool.validString(request.getParameter("aa_memo")));
		aa.setUpdate(app_account);
		app_sm.update(aa);
		out.println("<script> alert('備註已經修改!!'); backdata.submit();  </script>");		
	}else if("memo2".equals(code)){
		TableRecord aa = app_sm.select(db_names, "aa_id=?", new Object[]{aa_id});
		aa.setValue("aa_memo", StringTool.validString(request.getParameter("aa_memo")));
		aa.setUpdate(app_account);
		app_sm.update(aa);
		out.println("<script> alert('備註已經修改!!'); backonlineb.submit();  </script>");	
	}

}catch(Exception e){
	System.out.println("Error info:["+e+"]Project name[" + projectName + "]File name edit.jsp for ["+aa_code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>
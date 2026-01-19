<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	/*-- 針對各語系設定欄位 --*/
	// Tiltes.
	String[] titles = new String[] {
		"網站前台名稱", "地址", "電話", "傳真", "統編", "索引", "信箱", "Facebook 連結", "Instagram 連結",
		"來訪週期", "關鍵字", "版權說明", "內容簡介", "追踪碼", "公司名稱"
	};

	// Keywords.
	String[] keywords = new String[] { 
		"web_title", "cp.address","cp.phone", "cp.fax", "cp.companyno", "seo.robots", "cp.email", "cp.facebook", "cp.instagram",
		"seo.revisit_after", "seo.keywords", "seo.copyright", "seo.description", "seo.track", "cp.company"
	};

	// Get records.
	Vector misimages = new Vector();
	for (int i = 0; i < titles.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords[i] + "." + lang);
		ss.setUpdate(app_account);
		String value = StringTool.validString(request.getParameter(keywords[i]));
		ss.setValue("ss_text", value);
		ss.setUpdate(app_account);
		app_sm.update(ss);
	}

	/*-- 針對不分語系共通設定欄位 --*/
	// Tiltes.
	String[] titles_1 = new String[] { "載入頁", "分頁設定", "全站瀏覽人數" };

	// Keywords.
	String[] keywords_1 = new String[] { "ss.loading", "ss.pageno", "ss.visits" };

	// Get records.
	Vector misimages_1 = new Vector();
	for (int i = 0; i < titles_1.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords_1[i]);
		ss.setUpdate(app_account);
		String value = StringTool.validString(request.getParameter(keywords_1[i]));
		ss.setValue("ss_value", value);
		ss.setUpdate(app_account);
		app_sm.update(ss);
	}

	if (app_sm.success()) {
		out.println("<script> alert('資料修改成功!!'); location='websetup_c.jsp'; </script>");
	} else {
		out.println("<script> alert('資料修改失敗，失敗原因："+app_sm.getMessage().replace("'", "\"")+"'); history.back(); </script>");
	}
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
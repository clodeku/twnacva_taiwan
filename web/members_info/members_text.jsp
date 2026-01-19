<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "members_text", 				  		// 頁面識別碼
		   banner_code	= "members_info",						// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
    // 資料內容
	TableRecord cp = app_sm.select(tblcp , "cp_code=? and cp_lang=?" , new Object[]{page_code, lang});

    // 會員資訊類別
	Vector<TableRecord> left_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=?", 
            new Object[]{"members_info_category", lang}, "dm_showseq ASC, dm_createdate DESC");

    // 內頁banner
	TableRecord inbanner_ap = app_sm.select(tblap,"ap_code=? and ap_lang=? and ap_category=?"
			, new Object[]{"sub_banner", lang, banner_code});
	if(!"".equals(inbanner_ap.getString("ap_image"))) {
		bannerImg = app_fetchpath+"/sub_banner/"+lang+"/"+inbanner_ap.getString("ap_image");
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/in.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <title><%=app_webtitle %></title>
	
	<%-- SEO 讀取關鍵字設定值 --%>
	<meta name="Robots" content="<%=cp.getString("cp_robots") %>" />
	<meta name="revisit-after" content="<%=cp.getString("cp_revisit_after") %> days" />
	<meta name="keywords" content="<%=cp.getString("cp_keywords") %>" />
	<meta name="copyright" content="<%=cp.getString("cp_copyright") %>" />
	<meta name="description" content="<%=cp.getString("cp_description") %>" />
	<%-- 追蹤碼 --%><%=cp.getString("cp_seo_track") %>
	
	<%-- OG 設定 --%>
	<%
	// Server name.	
	String servername = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	if(request.getServerPort() == 80 || request.getServerPort() == 443) {
		servername = request.getScheme()+"://"+request.getServerName();
	}
	String localname = request.getScheme()+"://"+request.getLocalName()+":"+request.getLocalPort();
	String url = servername + request.getContextPath();
	%>
	<meta property="og:url"           content="<%=request.getRequestURL()+(request.getQueryString()!=null&&!request.getQueryString().isEmpty()?"?"+request.getQueryString():"")%>" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="<%=app_webtitle %>" />
	<meta property="og:description"   content="<%=cp.getString("cp_description")  %>" />
	<meta property="og:image"         content="<%=url+"/web/images/icon.png" %>" />
	
	<%-- 共用設定 --%>
	<%@include file="../include/head.jsp" %>
</head>

<body>
    <%-- 版頭設定 --%>
    <%@include file="../include/top_menu.jsp" %>
    
    
    <!--main-->
    <div class="main">
    	
        <!--內頁banner-->
        <div class="in_Banner">
        	<img src="<%=bannerImg %>" width="1280" height="288" />
        </div>
        
        <div class="wrap">
		<!-- InstanceBeginEditable name="main" -->
            
            <!--左側-->     
            <div class="left">
                <!--左側標題-->
                <div class="left_tit">
                    <%=show_str.get("member_info."+lang) %>
                </div>
                <!--左側選單區塊-->
                <div class="left_list_area">
                <%for(TableRecord left_dm:left_dms){ %>
                    <div class="left_list">
                        <a href="../members_info/members_info.jsp?dm_id=<%=left_dm.getString("dm_id") %>">
                            <%=left_dm.getString("dm_title") %>
                        </a>	
                    </div>
                <%} %>
                    <div class="left_list active">
                        <a href="../members_info/members_text.jsp">
                            <%=show_str.get("related_links."+lang) %>
                        </a>	
                    </div>
                </div>
            </div>
            
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                    <%=show_str.get("related_links."+lang) %>
                </div>
                
                <!--網編區-->
                <section class="text_area">
                    <%=cp.getString("cp_content") %>
                </section>
            </div>
            
            
        	<div class="clearfloat">
            </div>
   		<!-- InstanceEndEditable -->    
        </div>
        
        
    </div>

    <%-- 版腳 --%>
    <%@include file="../include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
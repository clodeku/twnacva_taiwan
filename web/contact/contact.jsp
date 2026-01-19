<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "contact_info", 				  	// 頁面識別碼
		   banner_code	= "contact",						// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
    // 資料內容
	TableRecord cp = app_sm.select(tblcp , "cp_code=? and cp_lang=?" , new Object[]{page_code, lang});

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
        <div class="wrap">
            
            <!--右側-->
            <div class="right no_left">
                <!--右側標題-->
                <div class="right_tit">
                    <%=show_str.get("contact."+lang) %>
                </div>
                
                 <!-- 網編區 -->
                <section class="text_area">
                    <%=cp.getString("cp_content") %>
                </section>
            </div>
            
            
        	<div class="clearfloat">
            </div>
        </div>
   	<!-- InstanceEndEditable -->    
        </div>
        
        
    </div>

    <%-- 版腳 --%>
    <%@include file="../include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
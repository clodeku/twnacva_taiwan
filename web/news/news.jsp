<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "news", 				  	        // 頁面識別碼
		   banner_code	= "news",					        // banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
	// 最新消息類別
	Vector<TableRecord> left_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? and dm_category=?", 
            new Object[]{page_code+"_category", lang, ""}, "dm_showseq ASC, dm_createdate DESC");
	
	// 資料編號
	String dm_id = StringTool.validString(request.getParameter("dm_id"));
				   
	// 資料內容
	TableRecord dm = app_sm.select(tbldm , dm_id);
		
	if(dm.getString("dm_id").equals("") && left_dms.size()>0){
		dm = left_dms.get(0);
		dm_id=dm.getString("dm_id");
	}
		
	// 最新消息列表
	Vector<TableRecord> nps = app_sm.selectAll(tblnp, "np_code=? and np_lang=? and np_category like? and not (np_emitdate>? OR np_restdate<?)"
			, new Object[]{page_code, lang, "%"+dm_id+"%", app_today, app_today}, "np_showseq ASC, np_createdate DESC");
    
	// 內頁banner
	TableRecord inbanner_ap = app_sm.select(tblap,"ap_code=? and ap_lang=? and ap_category=?"
			, new Object[]{"sub_banner", lang, banner_code});
	if(!"".equals(inbanner_ap.getString("ap_image"))) {
		bannerImg = app_fetchpath+"/sub_banner/"+lang+"/"+inbanner_ap.getString("ap_image");
	}

    // 分頁
	int page_items	= 10; 	// 列表分頁筆數設定
	String pageSet = SiteSetup.getSetup("ss.pageno").getString("ss_value").trim();
			
	if("N".equals(pageSet))  page_items = 9999;    // 預設列表分頁筆數設定
			
	app_dp = new DataPager(nps, page_items);    	//設定資料分頁每頁筆數
	nps = app_dp.getPageContent(pageno);
%>

<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/in.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <title><%=app_webtitle %></title>

    <%-- SEO 讀取關鍵字設定值 (讀取首頁共用值) --%>
	<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
	<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
	<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
	<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
	<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
	<%-- 追蹤碼 --%><%=SiteSetup.getText("seo.track."+lang) %>
	
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
	<meta property="og:description"   content="<%=SiteSetup.getText("seo.description."+lang) %>" />
	<meta property="og:image"         content="<%=url+"/web/images/icon.png" %>" />
	
	<%-- 共用設定 --%>
	<%@include file="../include/head.jsp" %>
    <%-- 分頁處理--%>
	<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
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
                    <%=show_str.get("news."+lang) %>
                </div>
                <!--左側選單區塊-->
                <div class="left_list_area">
                <%for(TableRecord left_dm:left_dms){ %>
                    <!-- 更改名字 modify by david 20220822 start -->
                    <div class="left_list <%=left_dm.getString("dm_id").equals(dm_id)?"active":"" %>"><!--當前模式class加active-->
                        <a href="../news/news.jsp?dm_id=<%=left_dm.getString("dm_id") %>">
                            <!-- 最新活動 -->
                            <%=left_dm.getString("dm_title") %>
                        </a>	
                    </div>
                    <!-- modify by david 20220822 end -->
                <%} %>
                </div>
            </div>
            
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                    <!-- 最新活動 -->
                    <%=dm.getString("dm_title") %>
                </div>
                
                
                <!--最新消息列表-->
                <div class="news_list_area">
                <%for(TableRecord np:nps){ %>
                    <div class="nLA_list">
                        <div class="nLA_list_date">
                            <%=np.getString("np_emitdate") %>
                        </div>
                        <div class="nLA_list_tit">
                            <a href="../news/news_in.jsp?np_id=<%=np.getString("np_id") %>">
                                <%=np.getString("np_title") %> 
                            </a>
                        </div>
                    </div>
                <%} %> 
                </div>    
                
                <!--頁碼 RWD版-->
                <div class="page_area_rwd">
                    <%@include file="/WEB-INF/jspf/web/rwd_pager.jspf"%>
					<form name="pageform" id="pageform" method="post" action="<%=request.getRequestURI()%>">
						<input type="hidden" name="npage" id="npage" value="<%=pageno%>" />
					</form>
                    <div class="clearfloat">
                    </div>
                </div>
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
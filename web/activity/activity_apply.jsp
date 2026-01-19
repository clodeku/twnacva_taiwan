<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "activity", 				  	    // 頁面識別碼
		   banner_code	= "activity",					    // banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
	// 課程介紹列表
	Vector<TableRecord> ais = app_sm.selectAll(tblai, "ai_code=? and ai_lang=? and ai_category=? and ai_restdate >=?"
			, new Object[]{page_code, lang, "", app_today}, "ai_showseq ASC, ai_createdate DESC");
    
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
                    <%=show_str.get("activity."+lang) %>
                </div>
                <!--左側選單區塊-->
                <div class="left_list_area">
                    <!-- 更改名字 modify by david 20220822 start -->
                    <div class="left_list"><!--當前模式class加active-->
                        <a href="../activity/activity.jsp">
                            <!-- 最新活動 -->
                            <%=show_str.get("activity_info."+lang) %>
                        </a>	
                    </div>
                    <div class="left_list active">
                        <a href="../activity/activity_apply.jsp">
                            <!-- 教育訓練 -->
                            <%=show_str.get("activity_apply."+lang) %>
                        </a>	
                    </div>
                    <!-- modify by david 20220822 end -->
                </div>
            </div>
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                	<!-- 最新活動 - 報名資料填寫 -->
                    <%=show_str.get("activity_apply."+lang) %>
                </div>
                
                <div class="CourseAll">
                <%for(TableRecord ai:ais){ %>
                    <!--首頁_Course列表 -->        
                    <div class="index_CList">
                    
                        <!--首頁_Course日期 -->
                        <div class="index_CListDate">
                            <%=ai.getString("ai_emitdate").substring(0, 10) %>
                        </div> 
                        
                        <!--首頁_Course標題 -->                
                        <div class="index_CListTit">
                                <div class="index_CListTit_name"><%=ai.getString("ai_title") %></div>      
                                <div class="index_CListTit_date"><%=show_str.get("course_date."+lang) %> : 
                                    <span><%=ai.getString("ai_date") %>~<%=ai.getString("ai_date_end") %></span> 
                                </div>
                        </div>                          
                        
                    
                    <%if("Y".equals(ai.getString("ai_status"))){ 
                    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					    Date end_day = sdf.parse(ai.getString("ai_endday")),
                             today = sdf.parse(app_today);
					    
					 	// 報名是否截止
					    if(end_day.before(today)){  %>              
	                    	<div class="index_CListAdd CListAddNone">
	                            <a href="javascript:void(0);">
	                                <%=show_str.get("expired."+lang) %>
	                            </a> 
	                        </div>
                    <%  } else { %>
	                        <!--首頁_Course報名 -->  
	                        <div class="index_CListAdd">
	                            <a href="../activity/activity_apply_in.jsp?ai_id=<%=ai.getString("ai_id") %>">
	                                <%=show_str.get("apply."+lang) %>
	                            </a>
	                        </div>
	                <%  } 
	                  } else {%>
                        <div class="index_CListAdd CListAddNone full">
                            <a href="javascript:void(0);">
                                <%=show_str.get("full."+lang) %>
                            </a> 
                        </div>
                    <%} %>
                    </div> 
                <%} %>
                </div>
                
                <div class="form_btn_area one">
                    <input type="button" value="<%=show_str.get("goback."+lang) %>" onclick="location='javascript:window.history.back(-1);'">
                    
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
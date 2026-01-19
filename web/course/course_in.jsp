<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "course", 				  			// 頁面識別碼
		   banner_code	= "course",							// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	        // 內頁banner預設圖

	// 資料編號
	String ai_id = StringTool.validString(request.getParameter("ai_id"));
								   
	// 資料內容
	TableRecord ai = app_sm.select(tblai , ai_id);

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
	<meta name="Robots" content="<%=ai.getString("ai_robots") %>" />
	<meta name="revisit-after" content="<%=ai.getString("ai_revisit_after") %> days" />
	<meta name="keywords" content="<%=ai.getString("ai_keywords") %>" />
	<meta name="copyright" content="<%=ai.getString("ai_copyright") %>" />
	<meta name="description" content="<%=ai.getString("ai_description") %>" />
	<%-- 追蹤碼 --%><%=ai.getString("ai_seo_track") %>
	
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
	<meta property="og:description"   content="<%=ai.getString("ai_description")  %>" />
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
                    <%=show_str.get("course."+lang) %>
                </div>
                <!--左側選單區塊-->
                <div class="left_list_area">
                    <!-- 更改名字 modify by david 20220822 start -->
                    <div class="left_list active"><!--當前模式class加active-->
                        <a href="../course/course.jsp">
                            <!-- 最新活動 -->
                            <%=show_str.get("course_info."+lang) %>
                        </a>	
                    </div>
                    <div class="left_list">
                        <a href="../course/course_apply.jsp">
                            <!-- 教育訓練 -->
                            <%=show_str.get("course_apply."+lang) %>
                        </a>	
                    </div>
                    <!-- modify by david 20220822 end -->
                </div>
            </div>
            
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                	<!-- 最新活動 -->
                    <%=show_str.get("course_info."+lang) %>
                </div>
                
                <!--最新消息內頁標題-->
                <div class="newsInTit">
                    <div class="nIT_time">
                        <%=ai.getString("ai_emitdate") %>
                    </div>
                    <!--內頁標題-->
                    <div class="nIT_tit">
                    	<%=ai.getString("ai_title") %> 
                    </div>
                </div>
                
                <!--網編區-->
                <section class="text_area">
					<%=ai.getString("ai_content") %>
                </section>
                
                <div class="form_btn_area one">
                    <input type="button" value="<%=show_str.get("goback."+lang) %>" onclick="location='javascript:window.history.back(-1);'">
                    <!-- <input type="button" value="我要報名" onclick="location='../news/news_form.html'"> -->
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
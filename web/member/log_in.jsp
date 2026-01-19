<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
    //參數設定
	String page_code 	= "member", 				  		// 頁面識別碼
		   banner_code	= "member",							// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖

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

    <script language="JavaScript" type="text/JavaScript">
        function checkform(F) {
            // 密碼長度需為 8-30 位，其中必須包含1個數字、1個大寫字母、1個小寫字母
            var safe_pwd_type = /^.*(?=.{8,30})(?=.*\d)(?=.*[A-Z]{1,})(?=.*[a-z]{1,}).*$/;
            var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true

            if (F.mp_account.value == "" || !isEmail.test(F.mp_account.value)) {
                alert('<%=alert_str.get("account."+lang) %>');
                F.mp_account.focus();
                return false;
            } else if(F.mp_password.value == "" || !safe_pwd_type.test(F.mp_password.value)) {
                alert('<%=alert_str.get("password."+lang) %>');
                F.mp_password.focus();
                return false;
            } else {
                return true;
            }
        }

        function loadimage() { 
            document.getElementById("randImage").src = "../../comm/image.jsp?"+Math.random(); 
        }
    </script>
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
                    <div class="right_contentBg">

                        <!-- 登入內容區塊 -->
                        <div class="login_contentBg">
                            <div class="login_contentIn">

                                <!--右側標題-->
                                <div class="right_title">
                                    <h2><%=show_str.get("login."+lang) %></h2>
                                </div>

                                <!-- 表單區塊 -->
                                <form name="loginForm" id="loginForm" method="post" action="<%=page_code %>_update.jsp?action=login" onsubmit="return checkform(this);">
                                    <div class="form_listBg">
                                        <div class="form_listArea">

                                            <!-- 列表 -->
                                            <div class="form_list">
                                                <!-- 標題 -->
                                                <div class="title">
                                                    <%=field_str.get("account."+lang) %>：
                                                </div>
                                                
                                                <!-- 內容 -->
                                                <div class="content">
                                                    <input type="text" name="mp_account" id="mp_account" placeholder="<%=field_str.get("account_text."+lang) %>">
                                                </div>
                                            </div>

                                            <!-- 列表 -->
                                            <div class="form_list">
                                                <!-- 標題 -->
                                                <div class="title">
                                                    <%=field_str.get("password."+lang) %>：
                                                </div>
                                                
                                                <!-- 內容 -->
                                                <div class="content">
                                                    <input type="password" name="mp_password" id="mp_password" placeholder="<%=field_str.get("password_text."+lang) %>">
                                                </div>
                                            </div>


                                            
                                            <!-- 列表 --><!-- 登入按鈕 -->
                                            <div class="form_list login_button two">
                                                <input type="submit" value="<%=field_str.get("login."+lang) %>" class="login">
                                                <input type="button" value="<%=field_str.get("register."+lang) %>" class="register" onclick="location='../member/add.jsp'">
                                            </div>

                                        </div>
                                    </div>
                                </form>

                                <!-- 裝飾區塊 -->
                                <div class="deco_bg">
                                    <div class="content">
                                    </div>
                                </div>

                                <!-- 其他功能區塊 -->
                                <div class="other_bg">
                                        <div class="other_list">
                                            <a href="../member/forgot.jsp"><%=field_str.get("forget."+lang) %></a>
                                        </div>
                                </div>

                            </div>
                        </div>
                    
                    </div>
                        
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
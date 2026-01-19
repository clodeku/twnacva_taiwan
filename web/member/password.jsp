<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
    //參數設定
	String page_code 	= "member", 				    // 頁面識別碼
		   left_menu_code = "modifypwd",						// 左側選單用
		   banner_code	= "member",							// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	// 內頁banner預設圖
    
    // 登入狀態檢查
    TableRecord member = (TableRecord) session.getAttribute("member");
    boolean is_member = false;
    
    if(member != null){     //避免未登入時，後續程式NullPointerException
        if(!member.getString("mp_id").isEmpty()){       // 已登入
            member = app_sm.select(tblmp, member.getString("mp_id"));
            is_member = true;
        } else {
            out.println("<script>alert('"+alert_str.get("idle."+lang)+"'); location.href='../../home.jsp';</script>");
            return;
        }
    } else {
        out.println("<script>alert('"+alert_str.get("idle."+lang)+"'); location.href='../../home.jsp';</script>");
        return;
    }

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
    <%@include file="/WEB-INF/jspf/norobots.jspf"%>

    <script language="JavaScript" type="text/JavaScript">
        function checkform(F) {
            // 密碼長度需為 8-30 位，其中必須包含1個數字、1個大寫字母、1個小寫字母
            var safe_pwd_type = /^.*(?=.{8,30})(?=.*\d)(?=.*[A-Z]{1,})(?=.*[a-z]{1,}).*$/;
            var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true

            $(".form_btn_area input").attr("disabled", true);

            if(F.mp_password.value.trim() == "" || !safe_pwd_type.test(F.mp_password.value)){
                alert('<%=alert_str.get("not_valid."+lang) %>');
                F.mp_password.focus();
            } else if(F.mp_password.value != F.mp_pswd.value) {
                alert('<%=alert_str.get("not_same."+lang) %>');
                F.mp_pswd.focus();
            } else {
                $(".form_btn_area input").attr("disabled", false);
                return true;
            }

            $(".form_btn_area input").attr("disabled", false);
            return false;
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
                
                <%--左側--%>
				<%@include file="include/left_menu.jsp"%>
                
                <!--右側-->
                <div class="right">
                    <!--右側標題-->
                    <div class="right_tit">
                        <%=show_str.get("modifypwd."+lang) %>
                    </div>
                    <!--備註-->
                    <div class="form_remark" style="padding-top:25px;">
                        <!--必填icon-->
                        <div class="required_icon">
                            *
                        </div>
                        <span style="color:#c13e42;">
                            <%=show_str.get("required."+lang) %>
                        </span>
                    </div>
                    <form name="form_edit" method="post" action="<%=page_code %>_update.jsp?action=modifypwd" onsubmit="return checkform(this);">
                            
                        <div class="white_bg">
                            <!--表單區-->
                            <div class="form_area">
                                
                                <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                    <div class="fL_tit">
                                        <%=field_str.get("new_password."+lang) %>:
                                        <div class="required_icon">
                                            *
                                        </div>
                                    </div>
                                    <div class="fLR_info">
                                        <input type="text" name="mp_password" id="mp_password" placeholder="<%=field_str.get("password_info."+lang) %>">
                                    </div>
                                </div>

                                <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                    <div class="fL_tit">
                                        <%=field_str.get("new_password2."+lang) %>:
                                        <div class="required_icon">
                                            *
                                        </div>
                                    </div>
                                    <div class="fLR_info">
                                        <input type="text" name="mp_pswd" id="mp_pswd">
                                    </div>
                                </div>
                                <div class="clearfloat">
                                </div>
                            </div>
                        </div>
                        <div class="form_btn_area one">
                            <input class="confirm" type="submit" value="<%=field_str.get("submit."+lang) %>">
                            <div class="clearfloat">
                            </div>
                        </div>
                    </form>

                        
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
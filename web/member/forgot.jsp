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

	<%-- 共用設定 --%>
	<%@include file="../include/head.jsp" %>

    <script language="JavaScript" type="text/JavaScript">
        function validLiteral(INPUT) {
            var litExp = /\W+/;		// non numeral or letter or underscore
            var invalid = litExp.test(INPUT);
            return !invalid;
        }

        function checkform(F) {
            var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true

            $(".btn_area input").attr("disabled", true);

            if(F.mp_account.value == "" || !isEmail.test(F.mp_account.value)) {
                alert("請輸入有效的帳號");
                F.mp_account.focus();
            } else {
                $(".btn_area input").attr("disabled", false);
                return true;
            }

            $(".btn_area input").attr("disabled", false);
            
            return false;
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
                                    <h2><%=show_str.get("forget."+lang) %></h2>
                                </div>

                                <!-- 表單區塊 -->
                                <form name="form_forget" method="post" action="<%=page_code %>_update.jsp?action=forget" onsubmit="return checkform(this);">
                        
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

                                            
                                            <!-- 列表 --><!-- 登入按鈕 -->
                                            <div class="form_list login_button one">
                                                <input type="submit" value="<%=field_str.get("submit."+lang) %>" class="login">
                                                
                                            </div>

                                        </div>
                                    </div>
                                </form>

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
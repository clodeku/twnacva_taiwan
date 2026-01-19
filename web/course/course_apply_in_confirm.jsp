<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "course", 				  	    // 頁面識別碼
		   banner_code	= "course",					        // banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
    // 取得會員資料
    TableRecord member = (TableRecord) session.getAttribute("member");
    boolean is_member = (member != null)?true:false;  // 判別是否登入

	// 報名資料編號
	String aa_id = StringTool.validString(request.getParameter("aa_id"));
    TableRecord aa = app_sm.select(tblaa , aa_id);
								   
	// 活動資料內容
	TableRecord ai = app_sm.select(tblai , aa.getString("ai_id"));
	// 活動報名收據資料內容
    TableRecord rs = app_sm.select(tblrs , "aa_id=?", new Object[]{aa_id});

    // 協會帳戶資料
    TableRecord account_cp = app_sm.select(tblcp, "cp_code=? and cp_lang=?", new Object[]{"account", lang});
    
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
        	<img src="../images/inBanner.jpg" width="1280" height="288" />
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
                    <div class="left_list"><!--當前模式class加active-->
                        <a href="../course/course.jsp">
                            <!-- 最新活動 -->
                            <%=show_str.get("course_info."+lang) %>
                        </a>	
                    </div>
                    <div class="left_list active">
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
                    <%=show_str.get("apply_data."+lang) %>
                </div>
                
                <!--最新消息內頁標題-->
                <div class="newsInTit">
                    <!-- <div class="nIT_time">
                        2022-11-28
                    </div> -->
                    <!--內頁標題-->
                    <!-- <div class="nIT_tit">
                    	報名項目: <span>107年優良創新老店選拔暨表揚活動開始囉，歡迎滿六十年以上的店家踴躍報名參加</span>
                    </div> -->
                </div>
                
                
                <div class="white_bg">
                    <!--表單區-->
                    <div class="form_area">
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("course_title."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_title") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("course_date."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_date") %>~<%=ai.getString("ai_date_end") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("course_code."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_no") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("deadline."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_endday") %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="white_bg">
                    <br>
                    <strong style="padding-left: 6px; font-size: 15px;"><%=show_str.get("association_account."+lang) %>:</strong>
                    <section class="text_area">
                        <%=account_cp.getString("cp_content") %>
                    </section>
                </div>
                <div class="white_bg">
                    <!--表單區-->
                    <div class="form_area">
                    
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("name."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_name") %>
                            </div>
                        </div>
                    	
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("phone."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_phone") %>
                            </div>
                        </div>

                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("unit."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_unit") %>
                            </div>
                        </div>
                        
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("job."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_job") %>
                                
                            </div>
                        </div>
                       
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("is_member."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%="Y".equals(aa.getString("aa_identity"))?"是":"否" %>
                            </div>
                        </div> 

                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("payment_type2."+lang) %>: 
                                <%="tw".equals(lang)?"上課繳款單":rs.getString("rs_type") %>
                            </div>
                            <div class="fLR_info">
                                NTD <span><%=String.valueOf(aa.getInt("aa_cost")) %></span> 元
                            </div>
                        </div>

                        <div class="form_list fLType2">
                            <div class="fL_tit">
                                <%=field_str.get("receipt_name."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=rs.getString("rs_title") %>
                            </div>
                        </div>

                        <div class="form_list fLType2">
                            <div class="fL_tit">
                                <%=field_str.get("receipt_address."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=rs.getString("rs_address") %>
                                
                            </div>
                        </div>
                        <div class="form_list fLType2">
                            <div class="fL_tit">
                                <%=field_str.get("recipient."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=rs.getString("rs_name") %>
                            </div>
                        </div>
                        <div class="form_list fLType2">
                            <div class="fL_tit">
                                E-mail:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_email") %>
                            </div>
                        </div>
                        <div class="form_list ">
                            <div class="fL_tit">
                                <%=field_str.get("address."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=aa.getString("aa_address") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("is_paid."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%="Y".equals(aa.getString("aa_collect"))?"是":"否" %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit">
                                <%=field_str.get("digits."+lang) %>:
                            </div>
                            <div class="fLR_info">
                                <%=rs.getString("rs_digits") %>
                            </div>
                        </div>
                        <div class="clearfloat">
                        </div>
                    </div>
                </div>
                
                <div class="form_btn_area one">
                    <input type="button" value="<%=show_str.get("goback."+lang) %>" onclick="location='javascript:window.history.back(-1);'">
                    <input type="submit" value="<%=field_str.get("submit."+lang) %>" onclick="location='../course/course_apply.jsp'">
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
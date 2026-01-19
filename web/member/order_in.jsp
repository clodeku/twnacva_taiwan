<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
    //參數設定
	String page_code 	= "member", 				  		// 頁面識別碼
		   left_menu_code = "order",						// 左側選單用
		   banner_code	= "member",							// banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
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
	
	// 資料編號
	String aa_id = StringTool.validString(request.getParameter("aa_id"));
									   
	// 資料內容
	TableRecord aa = app_sm.select(tblaa , aa_id);
	// 活動資料內容
	TableRecord ai = app_sm.select(tblai , aa.getString("ai_id"));
	// 活動報名收據資料內容
	TableRecord rs = app_sm.select(tblrs , "aa_id=?", new Object[]{aa_id});

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
            
			<%--左側--%>
            <%@include file="include/left_menu.jsp"%>                 
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                    <%=show_str.get("order."+lang) %>
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
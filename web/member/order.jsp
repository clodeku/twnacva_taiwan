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
	
	
	
	// 搜尋欄位(日期範圍)
	String qyear_s = StringTool.validString(request.getParameter("qyear_s"), String.valueOf(DateTimeTool.getYear()-1));
	String qmonth_s = StringTool.validString(request.getParameter("qmonth_s"), "1");
	String qday_s = StringTool.validString(request.getParameter("qday_s"), "1");
	String qyear_e = StringTool.validString(request.getParameter("qyear_e"), String.valueOf(DateTimeTool.getYear()));
	String qmonth_e = StringTool.validString(request.getParameter("qmonth_e"), "12");
	String qday_e = StringTool.validString(request.getParameter("qday_e"), "31");
	
	StringBuffer sb = new StringBuffer();
	Vector keys = new Vector();
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	sb.append("mp_id=? and aa_createdate >=? and aa_createdate<=?");
	keys.add(member.getString("mp_id"));
	keys.add(qyear_s+"/"+(Integer.parseInt(qmonth_s)<10?"0":"")+qmonth_s+"/"+(Integer.parseInt(qday_s)<10?"0":"")+qday_s);
	keys.add(qyear_e+"/"+(Integer.parseInt(qmonth_e)<10?"0":"")+qmonth_e+"/"+(Integer.parseInt(qday_e)<10?"0":"")+qday_e);
	
	// 報名紀錄列表 
	Vector<TableRecord> aas = app_sm.selectAll(tblaa, sb.toString(), keys.toArray(), "aa_createdate DESC");
	
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
    
    <script>
	    function searchResult(){
	    	var _qyear_s = $("#qyear_s").val();
	    	var _qmonth_s = $("#qmonth_s").val();
	    	var _qday_s = $("#qday_s").val();
	    	var _qyear_e = $("#qyear_e").val();
	    	var _qmonth_e = $("#qmonth_e").val();
	    	var _qday_e = $("#qday_e").val();
	    	
	    	
	    	location.href = 'order.jsp?qyear_s='+_qyear_s+'&qmonth_s='+_qmonth_s+'&qday_s='+_qday_s+'&qyear_e='+_qyear_e+'&qmonth_e='+_qmonth_e+'&qday_e='+_qday_e;
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
                    	<%=show_str.get("order."+lang) %>
                    </div>

                    <!-- 表格區塊 -->
                    <!-- 訂單頁面 class 加 order -->
                    <div class="table_contentBg order">
                        <div class="table_contentArea">
                            <!-- 時間搜尋 -->
	                            <div class="time_search_area">
	        
	                                <div class="time_search">
	                                    <select name="qyear_s" id="qyear_s">
	                                    <%for(int i=1911;i<DateTimeTool.getYear()+1;i++){ %>
	                                        <option value="<%=i %>" <%=qyear_s.equals(String.valueOf(i))?"selected":"" %>><%=i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"年":"/" %>
	                                    <select name="qmonth_s" id="qmonth_s">
	                                    <%for(int i=1;i<=12;i++){ %>
	                                        <option value="<%=i %>" <%=qmonth_s.equals(String.valueOf(i))?"selected":"" %>><%=(i<10?"0":"")+i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"月":"/" %>
	                                    <select name="qday_s" id="qday_s">
	                                    <%for(int i=1;i<=31;i++){ %>
	                                        <option value="<%=i %>" <%=qday_s.equals(String.valueOf(i))?"selected":"" %>><%=(i<10?"0":"")+i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"日":"" %>
	                                </div>
	                                <span>
	                                    <%="tw".equals(lang)?"至":"To" %>
	                                </span>
	                                <div class="time_search">
	                                    <select name="qyear_e" id="qyear_e">
	                                    <%for(int i=1911;i<DateTimeTool.getYear()+1;i++){ %>
	                                        <option value="<%=i %>" <%=qyear_e.equals(String.valueOf(i))?"selected":"" %>><%=i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"年":"/" %>
	                                    <select name="qmonth_e" id="qmonth_e">
	                                    <%for(int i=1;i<=12;i++){ %>
	                                        <option value="<%=i %>" <%=qmonth_e.equals(String.valueOf(i))?"selected":"" %>><%=(i<10?"0":"")+i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"月":"/" %>
	                                    <select name="qday_e" id="qday_e">
	                                    <%for(int i=1;i<=31;i++){ %>
	                                        <option value="<%=i %>" <%=qday_e.equals(String.valueOf(i))?"selected":"" %>><%=(i<10?"0":"")+i %></option>
	                                    <%} %>
	                                    </select>
	                                    <%="tw".equals(lang)?"日":"" %>
	                                </div>
	                                
	                                <label class="lsf">
	                                    search
	                                    <input type="submit" value="" onclick="searchResult()">
	                                </label>
	                                
	                            </div>
                            </form>
                            
                            <!-- 表格 -->
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <%=show_str.get("apply_date."+lang) %>
                                        </td>
                                        <td>
                                            <%=show_str.get("apply_no."+lang) %>
                                        </td>
                                        <td>
                                            <%=show_str.get("payment_status."+lang) %>
                                        </td>
                                        <td>
                                            <%=show_str.get("apply_detail."+lang) %>
                                        </td>
                                    </tr>
                                    <%for(TableRecord aa:aas){ %>
	                                    <tr>
	                                        <td  data-name="<%=show_str.get("apply_date."+lang) %>： ">
	                                            <%=aa.getString("aa_createdate").substring(0, 10) %>
	                                        </td>
	                                        <td  data-name="<%=show_str.get("apply_no."+lang) %>： ">
	                                            <%=aa.getString("aa_no") %>
	                                        </td>
	                                        <td  data-name="<%=show_str.get("payment_status."+lang) %>： ">
	                                        <%if("Y".equals(aa.getString("aa_collect"))){ %>
	                                            <span class="increase"><%=show_str.get("paid."+lang) %></span>
	                                        <%} else { %>
	                                        	<span class="decrease"><%=show_str.get("not_paid."+lang) %></span>
	                                        <%}  %>
	                                        </td>
	                                        <td  data-name="<%=show_str.get("apply_detail."+lang) %>： ">
	                                            <input type="button" value="<%=show_str.get("details."+lang) %>" class="order_search"
	                                            	   onclick="location='order_in.jsp?aa_id=<%=aa.getString("aa_id") %>'">
	                                            <div class="clearfloat"></div>
	                                        </td>
	                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                            
                        </div>
                        <div class="clearfloat"></div>
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
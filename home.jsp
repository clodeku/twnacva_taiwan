<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "home";		// 頁面識別碼
	
	// 資料讀取 
	Vector<TableRecord> banner_aps = app_sm.selectAll(tblap, "ap_code=? and ap_lang=?", 
            new Object[]{"banner", lang}, "ap_showseq ASC, ap_createdate DESC");
	Vector<TableRecord> nps = app_sm.selectAll(tblnp, "np_code=? and np_lang=? and not (np_emitdate>? OR np_restdate<?)", 
            new Object[]{"news", lang, app_today, app_today}, "np_showseq ASC, np_createdate DESC limit 3");
	Vector<TableRecord> ais = app_sm.selectAll(tblai, "ai_code=? and ai_lang=?",
			new Object[]{"activity", lang}, "ai_showseq ASC, ai_createdate DESC");
	
	// 讀取版頭資料
    Vector<TableRecord> nav_about_cps = app_sm.selectAll(tblcp, "cp_code=? and cp_lang=?",
			new Object[]{"about", lang}, "cp_showseq ASC, cp_createdate DESC");
    Vector<TableRecord> nav_member_info_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"members_info_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_evaluate_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"evaluate_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_law_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"law_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_publications_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"publications_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_research_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"research_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_link_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
            new Object[]{"link_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    
    TableRecord subscribe_cp = app_sm.select(tblcp, "cp_code=?", new Object[]{"newsletter"}); 
    String subscribe_link = subscribe_cp.getString("cp_url"),
           subscribe_target = "_blank";
    
    if("".equals(subscribe_link)){
      subscribe_link = "javascript:void(0);";
      subscribe_target = "";
    }

    /*-- 登入判斷 --*/
    // 取得會員資料
    TableRecord member_check = (TableRecord) session.getAttribute("member");

    // 判別是否登入
    boolean is_member = (member_check != null)?true:false;
    String member_link = is_member?"web/member/modify.jsp":"web/member/log_in.jsp";

    
    /*-- 瀏覽人次-Strat --*/
	int visits = 0;
	
    try {
		visits = Integer.valueOf(SiteSetup.getSetup("ss.visits").getString("ss_value")) + 1;	
	} catch(Exception e) {
		// Error
	}
	
    // 更新瀏覽人數
	TableRecord ss = SiteSetup.getSetup("ss.visits");
	ss.setUpdate("Web_User");
	ss.setValue("ss_value", visits);
	app_sm.update(ss);
	/*-- 瀏覽人次-End --*/

    
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/><!--讓ie在切換瀏覽器模式時 文件模式會使用最新的版本-->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!--RWD用-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--RWD用-->

    <!--android 手機板主題顏色用 更改網址列顏色-->
    <meta name="theme-color" content="#007440">
    <!--android 手機板主題顏色用-->

    <meta name="format-detection" content="telephone=no"><!--取消行動版 safari 自動偵測數字成電話號碼-->

    <title><%=app_webtitle %></title>
    <link rel="shortcut icon" href="web/images/favicon.png" /><!--電腦版icon-->
    <link rel="apple-touch-icon" href="web/images/icon.png" /><!--手機版icon  57x57px-->
    <link rel="apple-touch-icon" sizes="72x72" href="web/images/icon-72.png" /><!--手機版icon  72x72px-->
    <link rel="apple-touch-icon" sizes="114x114" href="web/images/icon@2.png" /><!--手機版icon  114x114px-->

    <link href="web/css/style.css" rel="stylesheet" type="text/css" />

    <!--google material icon-->
    <link rel="stylesheet" href="web/icon_fonts/material_icons/material-icons.css">

    <script src="web/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="web/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

    <script src="web/js/common.js" type="text/javascript"></script><!--JavaScript共用區-->

    <!--漣漪效果 第一塊 start-->
    <link href="web/js/ripples/ripples.css" rel="stylesheet" type="text/css" />
    <script src="web/js/ripples/material.js" type="text/javascript"></script>
    <script src="web/js/ripples/ripples.min.js" type="text/javascript"></script>
    <!--漣漪效果 第一塊 end-->
        
    <!--輪播特效 第一塊 開始-->
    <link rel="stylesheet" href="web/js/swiper/idangerous.swiper.css" />
    <!--輪播特效 第一塊 結束-->
        

    <!--新增banner套件 modify by feather 20211027 start-->    
    <!--輪播特效 第一塊 開始-->
    <link rel="stylesheet" type="text/css" href="web/js/swiper-master/css/swiper.css"/>
    <!--輪播特效 第一塊 結束-->
    <!--新增banner套件 modify by feather 20211027 end-->


    <!-- 輪播 Swiper's CSS_Swiper 8.4.2 -->
    <link rel="stylesheet" href="web/js/swiper-master/css/swiper.min.css"        type="text/css" />
    <link rel="stylesheet" href="web/js/swiper-master/css/swiper-bundle.min.css" type="text/css" />
    <!-- 輪播 Swiper's JS_Swiper 8.4.2 -->
    <script src="web/js/swiper-master/js/swiper-bundle.min.js"></script>

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
	<%-- <meta property="og:image"         content="<%=url+"/web/images/og_logo.png" %>" /> --%>

</head>

<body>
	<!--Google站內搜尋-->
    <% String qsearch_1 = StringTool.validString(request.getParameter("_qsearch")); %>
    <script>
    var searchID = '<%=SiteSetup.getText("cp.google_searchID."+lang) %>';
    function checkForm(F){	
        if(F.as_q.value==""){
            alert("No empty input!")
            return false;
        }else if(searchID != ""){
            var element = google.search.cse.element.getElement('search');
            element.execute(F.as_q.value);
            return false;
        }else{
            return true;
        }
    }
    </script>

    <div style="display:none;">
    <%
    // 搜尋結果頁
    String top_servername = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    if (request.getServerPort() == 80) {
        top_servername = request.getScheme() + "://" + request.getServerName();
    }
    String search_url = top_servername + request.getContextPath() + "/web/search/search.jsp";
    %>
    <%if(!SiteSetup.getText("cp.google_searchID."+lang).equals("")){ %>	
        <script>
            (function() {
            var cx = '<%=SiteSetup.getText("cp.google_searchID."+lang) %>';
            var gcse = document.createElement('script');
            gcse.type = 'text/javascript';
            gcse.async = true;
            gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(gcse, s);
            })();		
            
        </script>
        <gcse:searchbox-only gname="search" resultsUrl="<%=search_url %>"></gcse:searchbox-only>
    <%} %>
    </div>
    
    <!--電腦版搜尋框效果-->
    <script>
        $(document).ready(function(){
            $("#search_btnPC").click(function () {
                $("#searchArea_inPC").slideToggle(200);
                $(".pc_cart_listArea").removeClass("show");
            });
            
            $("#search_closePC").click(function () {
                $("#searchArea_inPC").slideUp(200);
            });

            $(window).resize(function(e) {
                var win_W = $(window).width(); //螢幕寬度
                if ( win_W > 860 ) {
                    $(".searchArea_inPC").hide();
                }
            });
        });
    </script>
    
    <!--版頭-->
    <div class="header" id="top">
    	<div class="wrap">
        	
            <!--logo-->
            <div class="logo">
            	<a href="home.jsp">
                	<img src="web/images/logo.png"  />
                </a>
            </div>
            
            <!--手機menu按鍵-->
            <div class="menu_btn">
                <span>
                </span>
                <span>
                </span>
                <span>
                </span>
            </div>
            
            <!--版頭手機板語系-->
            <div class="lang_phone">
                     
                <div class="nL_inphone">
                    <div class="nLI_listphone">
                        <a href="home.jsp?lang=tw">
                            繁中
                        </a>
                    </div>

                    <div class="nLI_listphone">
                        <a href="home.jsp?lang=en">
                            EN
                        </a>
                    </div>
                </div>
            </div>
            
            <!---版頭右-->
            <div class="headerRight">
                <!--版頭右上-->
                <div class="headerRightTop">

                    <!--PC版語系-->
                    <div class="lang_pc">
                        <div class="nL_in">
                            <div class="nLI_list">
                                <!--<a href="web/index/index.jsp?lang=tw">-->
                                <a href="home.jsp?lang=tw">
                                    繁中
                                </a>
                            </div>

                            <div class="nLI_list">
                                <!--<a href="web/index/index.jsp?lang=en">-->
                                <a href="home.jsp?lang=en">
                                    EN
                                </a>
                            </div>
                        </div>
                    </div>


                    <!-- 新增圖示 modfiy by david 20220822 start -->
                    <!--小連結區塊-->
                    <div class="smallLink_area">
                        <!--新增 連結文字 modify by pekey 20190329 start-->

                        <!--新增 連結文字 modify by pekey 20190329 end-->

                        <div class="smallLink_list">
                            <a href="web/news/news.jsp">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon02.png">
                                </div>
                                <%=show_str.get("news."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="web/publications/publications.jsp">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon06.png">
                                </div>
                                <%=show_str.get("publications."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="web/research/research.jsp">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon04.png">
                                </div>
                                <%=show_str.get("research."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                        	<a href="<%=subscribe_link %>" target="<%=subscribe_target %>">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon01.png">
                                </div>
                                <%=show_str.get("newsletter."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="web/activity/activity_apply.jsp">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon03.png">
                                </div>
                                <%=show_str.get("activity_apply."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="<%=member_link %>">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon05.png">
                                </div>
                                <%=show_str.get("member."+lang) %>
                            </a>
                        </div>
                        

                        <div class="smallLink_list lastlist">
                            <a href="web/link/link.jsp">
                                <div class="smallLink_listImg">
                                    <img src="web/images/icon07.png">
                                </div>
                                <%=show_str.get("links."+lang) %>
                            </a>
                        </div>

                        <!-- 搜尋框 -->
                        <div class="search_areaPC">

                            <!--搜尋icon-->
                            <div class="search_iconPC">
                                <label id="search_btnPC">
                                    <!--<i class="material-icons">search</i>-->
                                    <div><img src="web/images/search_icon.png"></div>
                                </label>
                            </div>


                            <!--搜尋框-->
                            <div class="search_inAreaPC" id="searchArea_inPC">
                                <div class="search_inBoxPC">
                                    <input type="text" placeholder="Search" name="_qsearch" id="_qsearch" value="">
                                    <a href="javascrip:void(0);" id="search_closePC">
                                        <span class="close_iconPC"> × </span>
                                        <span><%=show_str.get("close."+lang) %></span>
                                    </a>
                                </div>

                                <div class="clearfloat">
                                </div>
                            </div>

                        </div>

                        <!-- 版頭社群 -->
                        <!-- <div class="headerRightTop_socialLinkArea"> -->
                        <!-- 社群連結 -->
                        <!-- <div class="hRT_socialLink igColor">
                                <a href="https://www.instagram.com/roccoc_org/?=zh-tw" target="_blank">
                                    <img src="web/images/ig@.png" width="20" height="20">
                                </a> -->

                        <!--標籤說明-->
                        <!-- <div class="tab_description">
                                    Instagram
                                </div>
                            </div> -->

                        <!-- 社群連結 -->
                        <!-- <div class="hRT_socialLink blue">
                                <a href="https://www.facebook.com/roccoc.org" target="_blank">
                                    <img src="web/images/fb_icon.png" width="20" height="20">
                                </a> -->

                        <!--標籤說明-->
                        <!-- <div class="tab_description">
                                    臉書
                                </div>
                            </div>

                        </div> -->



                        <div class="clearfloat">
                        </div>
                    </div>

                    <div class="clearfloat">
                    </div>
                </div>
                <!-- modfiy by david 20220822 end -->

                <!--主按鍵-->
                <div class="navbar">
                    

                    <!-- modify by david 20220822 start -->
                    <div class="header_search_area">
                        <div class="header_search">
                            <input type="text" placeholder="<%=show_str.get("search."+lang) %>" id="search">

                            <label>
                                <i class="material-icons"></i>
                                <input type="submit" value="" onclick="location='#'">
                            </label>
                        </div>
                    </div>
                    <!-- modify by david 20220822 end -->

                    <!--新增 社群連結  modify by feather 20211027 start-->
                    <div class="nav MB socialLink_MB">

                        <!-- 社群連結 -->
                        <%if(!"".equals(SiteSetup.getText("cp.instagram."+lang))){ %>
                        <div class="hRT_socialLink igColor">
                            <a href="<%=SiteSetup.getText("cp.instagram."+lang) %>" target="_blank">
                                <img src="web/images/ig@.png" width="20" height="20">
                            </a>

                            <!--標籤說明-->
                            <div class="tab_description">
                                <%=show_str.get("instagram."+lang) %>
                            </div>
                        </div>
                        <%} %>

                        <!-- 社群連結 -->
                        <%if(!"".equals(SiteSetup.getText("cp.facebook."+lang))){ %>
                        <div class="hRT_socialLink blue">
                            <a href="<%=SiteSetup.getText("cp.facebook."+lang) %>" target="_blank">
                                <img src="web/images/fb_icon.png" width="20" height="20">
                            </a>

                            <!--標籤說明-->
                            <div class="tab_description">
                                <%=show_str.get("facebook."+lang) %>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <!--新增 社群連結  modify by feather 20211027 end-->
                    <!--新增 連結文字  modify by pekey 20190329 start-->
                    <!-- <div class="nav MB">
                    	<a href="web/news/news.jsp">
                        	線上報名
                        </a>     
					</div> -->
                    <!--新增 連結文字 modify by pekey 20190329 end-->

                    <div class="nav">
                        <a href="javascript:void(0);">
                            <%=show_str.get("about."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_about_cp:nav_about_cps){ %>
                                <div class="navOpenList">
                                    <a href="web/about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
                                        <%=nav_about_cp.getString("cp_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_about_cp:nav_about_cps){ %>
                                <div class="navOpenList">
                                    <a href="web/about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
                                        <%=nav_about_cp.getString("cp_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>
                    </div>

                    <div class="nav">
                        <a href="javascript:void(0);">
                            <%=show_str.get("member_info."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_member_info_dm:nav_member_info_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/members_info/members_info.jsp?dm_id=<%=nav_member_info_dm.getString("dm_id") %>">
                                        <%=nav_member_info_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/members_info/members_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_member_info_dm:nav_member_info_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/members_info/members_info.jsp?dm_id=<%=nav_member_info_dm.getString("dm_id") %>">
                                        <%=nav_member_info_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/members_info/members_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="nav">
                        <a href="javascript:void(0);">
                            <%=show_str.get("course."+lang) %>
                        </a>
                        <!-- modify by david 20220822 start -->
                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="web/course/course.jsp">
                                        <%=show_str.get("course_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="web/course/course_apply.jsp">
                                        <%=show_str.get("course_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="web/course/course.jsp">
                                        <%=show_str.get("course_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="web/course/course_apply.jsp">
                                        <%=show_str.get("course_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- modify by david 20220822 end -->
                    </div>

                    <div class="nav">
                        <a href="javascript:void(0);">
                            <%=show_str.get("activity."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="web/activity/activity.jsp">
                                        <%=show_str.get("activity_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="web/activity/activity_apply.jsp">
                                        <%=show_str.get("activity_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="web/activity/activity.jsp">
                                        <%=show_str.get("activity_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="web/activity/activity_apply.jsp">
                                        <%=show_str.get("activity_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="nav"> 
                        <a href="javascript:void(0);">
                            <%=show_str.get("evaluate."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_evaluate_dm:nav_evaluate_dms){ %>
                            	<div class="navOpenList">
                                    <a href="web/evaluate/evaluate.jsp?dm_id=<%=nav_evaluate_dm.getString("dm_id") %>">
                                        <%=nav_evaluate_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/evaluate/evaluate_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                                
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_evaluate_dm:nav_evaluate_dms){ %>
                            	<div class="navOpenList">
                                    <a href="web/evaluate/evaluate.jsp?dm_id=<%=nav_evaluate_dm.getString("dm_id") %>">
                                        <%=nav_evaluate_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/evaluate/evaluate_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="nav">
                        <a href="javascript:void(0);">
                            <%=show_str.get("law."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_law_dm:nav_law_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                        <%=nav_law_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/law/law_text.jsp">
                                        <%=show_str.get("related_links2."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_law_dm:nav_law_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                        <%=nav_law_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="web/law/law_text.jsp">
                                        <%=show_str.get("related_links2."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="nav">
                        <a href="web/contact/contact.jsp">
                            <%=show_str.get("contact."+lang) %>
                        </a>
                    </div>

                    <!-- modify by david 20220824 start -->


                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="web/news/news.jsp">
                            <%=show_str.get("news."+lang) %>
                        </a>
                    </div>
                    <!-- modify by david 20220824 end -->
                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="javascript:void(0);">
                            <%=show_str.get("publications."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_publications_dm:nav_publications_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
                                        <%=nav_publications_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_publications_dm:nav_publications_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
                                        <%=nav_publications_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>
                    </div>
                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="javascript:void(0);">
                            <%=show_str.get("research."+lang) %>
                        </a>

                        <!--主按鍵展開-->
                        <div class="navOpen pc">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_research_dm:nav_research_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
                                        <%=nav_research_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_research_dm:nav_research_dms){ %>
                                <div class="navOpenList">
                                    <a href="web/research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
                                        <%=nav_research_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                            </div>
                        </div>
                    </div>

                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="<%=subscribe_link %>" target="<%=subscribe_target %>">
                            <%=show_str.get("newsletter."+lang) %>
                        </a>
                    </div>

                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="web/activity/activity_apply.jsp">
                            <%=show_str.get("activity_apply."+lang) %>
                        </a>
                    </div>
                    
                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="<%=member_link %>">
                            <%=show_str.get("member."+lang) %>
                        </a>
                    </div>
                    

                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="web/link/link.jsp">
                            <%=show_str.get("links."+lang) %>
                        </a>
                    </div>

                    <div class="clearfloat">
                    </div>
                </div>
            </div>
            
            <div class="clearfloat">
            </div>
        </div>
    </div>
    
    
    <!--main-->
    <div class="main indexMain">

        <!--banner輪播-->
        <div class="banner">

            <div class="wrap">
                <!-- Swiper -->
                <div class="swiper mySwiper swiper-container_pc">
                    <div class="swiper-wrapper">
                    <%for(TableRecord ap:banner_aps){ 
                    	String banner_url = ap.getString("ap_url"),
                    		   banner_target = ap.getString("ap_target");
                    	
                    	if("".equals(banner_url) || "none".equals(banner_target)){
                    		banner_url = "javascript:void(0);";
                    		banner_target = "";
                    	}
                    %>
                        <div class="swiper-slide">
                            <a href="<%=banner_url %>" target="<%=banner_target %>" class="banner_img">
                                    <img  src="<%=app_fetchpath+"/banner/"+lang+"/"+ap.getString("ap_image") %>" class="pcBanner" alt="">                                    
                                    <%-- <img src="<%=app_fetchpath+"/banner/"+lang+"/"+ap.getString("ap_mobile") %>" class="mobileBanner" /> --%>
                            </a>
                        </div> 
                    <%} %> 
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <!-- <div class="swiper-pagination"></div> -->
                    
                </div>
                
                <!-- Initialize Swiper -->
                <script>
                    var swiper_pc = new Swiper(".swiper-container_pc", {
                        //輪播一次顯示幾張
                        slidesPerView: 1,
                        
                        //輪播位置啟始值為置中
                        centeredSlides: true,
                        
                        //自動輪播
                        autoplay: {
                            // delay: 5000,
                            delay: 10000,
                            disableOnInteraction: false,
                        },
                        
                        speed: 3000,

                        //無限循環
                        loop: true,

                        //高度自適應
                        // autoHeight: true,

                        //手動滑動
                        allowTouchMove: true,  

                        grabCursor: true,

                        //視差效果
                        // parallax : true,

                        //輪播點點顯示
                        pagination: {
                            el: ".swiper-container_pc .swiper-pagination",
                            clickable: true,
                        },
                        //左右按鍵點擊效果
                        navigation: {
                            nextEl: '.swiper-container_pc .swiper-button-next',
                            prevEl: '.swiper-container_pc .swiper-button-prev',
                        },

                    });
                </script>
            </div>

        </div>
        
        
        <!-- 最新消息輪播 -->
        <div class="index_bottomAD">
            <div class="wrap">
                <div class="index_tilte">
                    <h2><%=show_str.get("news."+lang) %></h2>
                </div>
                <div class="index_AdBg_right">
                    <div class="inner_wrap">
                        <div class="swiper mySwiper swiper-container_ad">
                            <div class="swiper-wrapper">
                            <%for(TableRecord np:nps){ %>
                                <div class="swiper-slide">
                                    <div class="ad_card">
                                        <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id") %>">
                                            <div class="card_img">
                                                <img src="<%=app_fetchpath+"/news/"+lang+"/"+np.getString("np_image") %>" alt="">
                                            </div>
                                            <div class="card_title_wrap">
                                                <div class="card_date"><%=np.getString("np_emitdate") %></div>
                                                <div class="card_title">
                                                    <%=np.getString("np_title") %>
                                                </div>
                                                <p><%=np.getString("np_desc") %></p>
                                            </div>
                                        </a>
                                    </div>
                                </div>                
                            <%} %> 
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-prev_ad"></div>
                    <div class="swiper-button-next_ad"></div>

                    <!-- Initialize Swiper -->
                    <script>
                        var swiper_ad = new Swiper(".swiper-container_ad", {
                            //輪播一次顯示幾張
                            slidesPerView: 1,
                            spaceBetween: 0,
                            //輪播位置啟始值為置中
                            centeredSlides: false,
                            
                            //自動輪播
                            // autoplay: {
                            //     // delay: 5000,
                            //     delay: 10000,
                            //     disableOnInteraction: false,
                            // },
                            
                            // speed: 3000,

                            //無限循環
                            loop: <%=nps.size()>2?"true":"false" %>,

                            //高度自適應
                            // autoHeight: true,

                            //手動滑動
                            allowTouchMove: true,  

                            grabCursor: true,

                            //視差效果
                            // parallax : true,
                            //左右按鍵點擊效果
                            navigation: {
                                nextEl: '.swiper-button-prev_ad',
                                prevEl: '.swiper-button-next_ad',
                            },
                            breakpoints: {
                                //當寬度大於等於640
                                641: {
                                    slidesPerView: 2,
                                    spaceBetween: 5,
                                },
                                //當寬度大於等於990
                                991: {
                                    slidesPerView: 3,
                                    spaceBetween: 20,
                                },
                            }, 

                        });
                    </script>
                </div> 
            </div>
        </div>

        <!-- 活動專區輪播 -->
        <div class="index_class_bg">

            <div class="wrap">   
                <div class="index_tilte">
                    <h2><%=show_str.get("activity."+lang) %></h2>
                </div>   
                <div class="index_class_bg_in">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>       
                    <div class="index_class_area">                    
                        <!-- Swiper -->
                        <div class="swiper mySwiper_class">
                            <div class="swiper-wrapper">
                            <%for(TableRecord ai:ais){ %>
                                <div class="swiper-slide">
                                    <div class="class_img">
                                        <a href="web/activity/activity_in.jsp?ai_id=<%=ai.getString("ai_id") %>">
                                            <div class="class_img_in">
                                                <img src="<%=app_fetchpath+"/activity/"+lang+"/"+ai.getString("ai_image") %>" alt="">
                                            </div>
                                            <div class="class_tilte"><%=ai.getString("ai_title") %></div>
                                        </a>
                                    </div>
                                </div>
                            <%} %> 
                            </div>
                            <!-- <div class="swiper-pagination"></div> -->
                        </div>
                    </div>  
                </div>              
            </div>
            

            <!-- Initialize Swiper -->
            <script>
                var index_class_swiper = new Swiper(".mySwiper_class", {
                    slidesPerView: 1,
                    spaceBetween: 0,
                    //自動輪播
                    autoplay: {
                        delay: 5000,
                        disableOnInteraction: false,
                    },
                    
                    //無限循環
                    loop: <%=ais.size()>3?"true":"false" %>,

                    //高度自適應
                    autoHeight: true,
                    
                    pagination: {
                        el: ".index_class_bg .swiper-pagination",
                        clickable: true,
                    },
                    //左右按鍵點擊效果
                    navigation: {
                        nextEl: '.index_class_bg .swiper-button-prev',
                        prevEl: '.index_class_bg .swiper-button-next',
                    },
                    breakpoints: {
                        //當寬度大於等於640
                        641: {
                            slidesPerView: 2,
                            spaceBetween: 5,
                        },
                        //當寬度大於等於990
                        991: {
                            slidesPerView: 3,
                            spaceBetween: 10,
                        },
                        //當寬度大於等於1024
                        1025: {
                            slidesPerView: 4,
                            spaceBetween: 20,
                        },
                    }, 
                });
            </script>

        </div>
            
    </div>

    <!--footer-->
	<div class="footer">
    	
        
    	<!--返回最上面-->
        <!--<div class="topBtn">
            <a href="#top">
                <span>TOP</span>
            </a>
        </div>-->

        <!--新增修改 右側浮動按鈕 modify by pekey 20190329 start-->
    	<!--浮動按鈕區塊-->
        
        <div class="topBtn_area">

            
            <!--新增ig浮動按鍵 modify by feather 20211027 start-->
            
            <!--浮動按鍵-->
            <%if(!"".equals(SiteSetup.getText("cp.instagram."+lang))){ %>
            <div class="topBtn_list igColor">
				<a href="<%=SiteSetup.getText("cp.instagram."+lang) %>" target="_blank">
                    <img src="web/images/ig@.png" width="64" height="64">
                </a>
                
                <!--標籤說明-->    
                <div class="tab_description">
                    <%=show_str.get("instagram."+lang) %>
                </div>
            </div>
            <%} %> 
            <!--新增ig浮動按鍵 modify by feather 20211027 end-->

            <!--浮動按鍵-->
            <!-- <div class="topBtn_list green">
				<a href="#" target="_blank">
                    <img src="web/images/line@.png" width="64" height="64">
                </a> -->
                
                <!--標籤說明-->    
                <!-- <div class="tab_description">
                    LINE@
                </div>
            </div> -->
            
            <!--浮動按鍵-->
            <%if(!"".equals(SiteSetup.getText("cp.facebook."+lang))){ %>
            <div class="topBtn_list blue">
				<a href="<%=SiteSetup.getText("cp.facebook."+lang) %>" target="_blank">
                    <img src="web/images/fb_icon.png" width="64" height="64">
                </a>
                
                <!--標籤說明-->    
                <div class="tab_description">
                    <%=show_str.get("facebook."+lang) %>
                </div>
            </div>
            <%} %> 

            <!--浮動top鍵-->
            <div class="topBtn">
                <a href="#top">
                    <span>TOP</span>
                </a>
                
                <!--標籤說明-->    
                <div class="tab_description">
                    <%=show_str.get("top."+lang) %>
                </div>
            </div>
        </div>

        <!--新增修改 右側浮動按鈕 modify by pekey 20190329 end-->

        
        
        <!--版腳主按鍵收合按鈕-->
        <div class="footerNavbarBtn">
            <div class="btn">
            </div>
        </div>
        <!--版腳主按鍵-->
        <div class="footer_navbar">
    		<div class="wrap">
            
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("about."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_about_cp:nav_about_cps){ %>
                        <div class="footer_navList">
                            <a href="web/about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
                                <%=nav_about_cp.getString("cp_title") %>
                            </a>
                        </div>
                    <%} %>  
                    </div>
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("member_info."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_member_info_dm:nav_member_info_dms){ %>
                        <div class="footer_navList">
                            <a href="web/members_info/members_info.jsp">
                                <%=nav_member_info_dm.getString("dm_title") %>
                            </a>
                        </div>    
                    <%} %>
                        <div class="footer_navList">
                            <a href="web/members_info/members_text.jsp">
                                <%=show_str.get("related_links."+lang) %>
                            </a>
                        </div>    
                    </div>
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("course."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                        <!-- modify by david 20220822 start -->
                        <div class="footer_navList">
                            <a href="web/course/course.jsp">
                                <%=show_str.get("course_info."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/course/course_apply.jsp">
                                <%=show_str.get("course_apply."+lang) %>
                            </a>
                        </div> 
                        <!-- modify by david 20220822 end -->
                	</div>           
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("activity."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                        <div class="footer_navList">
                            <a href="web/activity/activity.jsp">
                                <%=show_str.get("activity_info."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/activity/activity_apply.jsp">
                                <%=show_str.get("activity_apply."+lang) %>
                            </a>
                        </div>
                	</div>           
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("evaluate."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_evaluate_dm:nav_evaluate_dms){ %>
                        <div class="footer_navList">
                            <a href="web/evaluate/evaluate.jsp">
                                <%=nav_evaluate_dm.getString("dm_title") %>
                            </a>
                        </div> 
                    <%} %>
                        <div class="footer_navList">
                            <a href="web/evaluate/evaluate_text.jsp">
                                <%=show_str.get("related_links."+lang) %>
                            </a>
                        </div> 
                	</div>           
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("law."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_law_dm:nav_law_dms){ %>
                        <div class="footer_navList">
                            <a href="web/law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                <%=nav_law_dm.getString("dm_title") %>
                            </a>
                        </div>
                    <%} %>
                        <div class="footer_navList">
                            <a href="web/law/law_text.jsp">
                                <%=show_str.get("related_links2."+lang) %>
                            </a>
                        </div> 
                	</div>           
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("publications."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_publications_dm:nav_publications_dms){ %>
                        <div class="footer_navList">
                            <a href="web/publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
                                <%=nav_publications_dm.getString("dm_title") %>
                            </a>
                        </div> 
                    <%} %>
                	</div>    
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("research."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_research_dm:nav_research_dms){ %>
                        <div class="footer_navList">
                            <a href="web/research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
                                <%=nav_research_dm.getString("dm_title") %>
                            </a>
                        </div> 
                    <%} %>
                	</div>    
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("member."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%if(!is_member) { %>
                        <div class="footer_navList">
                            <a href="web/member/add.jsp">
                                <%=show_str.get("add."+lang) %>
                            </a>
                        </div> 
                    <%} else { %>
                        <div class="footer_navList">
                            <a href="web/member/modify.jsp">
                                <%=show_str.get("modify."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/member/password.jsp">
                                <%=show_str.get("modifypwd."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/member/order.jsp">
                                <%=show_str.get("order."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/member/announce.jsp">
                                <%=show_str.get("announce."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/member/tacva.jsp">
                                <%=show_str.get("tacva."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="web/member/nacva.jsp">
                                <%=show_str.get("nacva."+lang) %>
                            </a>
                        </div>
                    <%} %>
                	</div>    
                </div>
                
                <div class="footer_nav">
                	<a href="javascript:void(0);">
                        <%=show_str.get("links."+lang) %>
                    </a>
                    <div class="footer_navOpen">
                    <%for(TableRecord nav_link_dm:nav_link_dms){ %>
                        <div class="footer_navList">
                            <a href="web/link/link.jsp?dm_id=<%=nav_link_dm.getString("dm_id") %>">
                                <%=nav_link_dm.getString("dm_title") %>
                            </a>
                        </div>
                    <%} %>
                	</div>   
                </div>
                
                
                <div class="clearfloat">
                </div>
			</div> 
        </div>
        <script>
            $(document).ready(function(e) {
	
                $(".footerNavbarBtn").children(".btn").click(function(e) {
                    $(".footer_navbar").slideToggle(500);
                    $(this).parent(".footerNavbarBtn").toggleClass("active");
                    e.stopPropagation();
                });
            });


        </script>
        <!--版腳內容區塊-->
        <div class="footer_inArea">
            <div class="wrap">
                
                <!-- modify by david 20220822 start -->
                <div class="footer_viewer">
                    <%=show_str.get("visits."+lang) %>:<%=SiteSetup.getSetup("ss.visits").getString("ss_value") %>
                </div>
                <!-- modify by david 20220822 end -->
                <div class="footerInfoArea">
                    <span><%=SiteSetup.getText("cp.company."+lang) %></span>
                    <% if(!SiteSetup.getText("cp.address."+lang).isEmpty()){ %>       
                    <span data-title="ADD："><%=SiteSetup.getText("cp.address."+lang) %></span>
                    <% } %>
                    <% if(!SiteSetup.getText("cp.phone."+lang).isEmpty()){ %>  
                    <span data-title="TEL：" class="pc_type"><%=SiteSetup.getText("cp.phone."+lang) %></span><!--pc版出現 class 加 pc_type-->
                    <span data-title="TEL：" class="mobile_type"><a href="tel:<%=SiteSetup.getText("cp.phone."+lang) %>;"><%=SiteSetup.getText("cp.phone."+lang) %></a></span><!--mobile版出現 class 加 mobile_type-->
                    <% } %>
                    <% if(!SiteSetup.getText("cp.email."+lang).isEmpty()){ %>  
                    <span data-title="E-MAIL："><%=SiteSetup.getText("cp.email."+lang) %></span>
                	<% } %>
                </div>
                
                <div class="copyright">
                    © <%=DateTimeTool.getYear() %>&nbsp;<a href="http://www.geneinfo.com.tw">Greatest Idea Strategy Co.,Ltd</a> All rights reserved.
                </div>
                
            </div>
        </div>
        
    </div>
    
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
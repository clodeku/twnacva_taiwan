<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 讀取版頭資料
    Vector<TableRecord> nav_about_cps = app_sm.selectAll(tblcp, "cp_code=? and cp_lang=?",
			new Object[]{"about", lang}, "cp_showseq ASC, cp_createdate DESC");
    Vector<TableRecord> nav_member_info_dms = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ",
            new Object[]{"members_info_category", lang}, "dm_showseq ASC, dm_createdate DESC");
    Vector<TableRecord> nav_evaluate_dms  = app_sm.selectAll(tbldm, "dm_code=? and dm_lang=? ", 
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

    // 判別是否登入(版頭用)
    boolean is_member_top = (member_check != null)?true:false;
    String member_link = is_member_top?"../member/modify.jsp":"../member/log_in.jsp";

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
            	<a href="../../home.jsp">
                	<img src="../images/logo.png" width="150" />
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
                        <a href="../../home.jsp?lang=tw">
                            繁中
                        </a>
                    </div>

                    <div class="nLI_listphone">
                        <a href="../../home.jsp?lang=en">
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
                                <a href="../../home.jsp?lang=tw">
                                    繁中
                                </a>
                            </div>
                            
                            <div class="nLI_list">
                                <a href="../../home.jsp?lang=en">
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
                            <a href="../news/news.jsp">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon02.png">
                                </div>
                                <%=show_str.get("news."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="../publications/publications.jsp">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon06.png">
                                </div>
                                <%=show_str.get("publications."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="../research/research.jsp">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon04.png">
                                </div>
                                <%=show_str.get("research."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                        	<a href="<%=subscribe_link %>" target="<%=subscribe_target %>">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon01.png">
                                </div>
                                <%=show_str.get("newsletter."+lang) %>
                            </a>
                        </div>
                        
                        <div class="smallLink_list">
                            <a href="../activity/activity_apply.jsp">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon03.png">
                                </div>
                                <%=show_str.get("activity_apply."+lang) %>
                            </a>
                        </div>

                        <div class="smallLink_list">
                            <a href="<%=member_link %>">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon05.png">
                                </div>
                                <%=show_str.get("member."+lang) %>
                            </a>
                        </div>
                        

                        <div class="smallLink_list lastlist">
                            <a href="../link/link.jsp">
                                <div class="smallLink_listImg">
                                    <img src="../images/icon07.png">
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
                                    <div><img src="../images/search_icon.png"></div>
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
                                    <img src="../images/ig@.png" width="20" height="20">
                                </a> -->

                        <!--標籤說明-->
                        <!-- <div class="tab_description">
                                    Instagram
                                </div>
                            </div> -->

                        <!-- 社群連結 -->
                        <!-- <div class="hRT_socialLink blue">
                                <a href="https://www.facebook.com/roccoc.org" target="_blank">
                                    <img src="../images/fb_icon.png" width="20" height="20">
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
                
                <!--主按鍵 -->
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
                                <img src="../images/ig@.png" width="20" height="20">
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
                                <img src="../images/fb_icon.png" width="20" height="20">
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
                    	<a href="../../news/news.jsp">
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
                                    <a href="../about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
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
                                    <a href="../about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
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
                                    <a href="../members_info/members_info.jsp?dm_id=<%=nav_member_info_dm.getString("dm_id") %>">
                                        <%=nav_member_info_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../members_info/members_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_member_info_dm:nav_member_info_dms){ %>
                                <div class="navOpenList">
                                    <a href="../members_info/members_info.jsp?dm_id=<%=nav_member_info_dm.getString("dm_id") %>">
                                        <%=nav_member_info_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../members_info/members_text.jsp">
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
                                    <a href="../course/course.jsp">
                                        <%=show_str.get("course_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="../course/course_apply.jsp">
                                        <%=show_str.get("course_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="../course/course.jsp">
                                        <%=show_str.get("course_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="../course/course_apply.jsp">
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
                                    <a href="../activity/activity.jsp">
                                        <%=show_str.get("activity_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="../activity/activity_apply.jsp">
                                        <%=show_str.get("activity_apply."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                                <div class="navOpenList">
                                    <a href="../activity/activity.jsp">
                                        <%=show_str.get("activity_info."+lang) %>
                                    </a>
                                </div>
                                <div class="navOpenList">
                                    <a href="../activity/activity_apply.jsp">
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
                                    <a href="../evaluate/evaluate.jsp?dm_id=<%=nav_evaluate_dm.getString("dm_id") %>">
                                        <%=nav_evaluate_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../evaluate/evaluate_text.jsp">
                                        <%=show_str.get("related_links."+lang) %>
                                    </a>
                                </div>
                                
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_evaluate_dm:nav_evaluate_dms){ %>
                            	<div class="navOpenList">
                                    <a href="../evaluate/evaluate.jsp?dm_id=<%=nav_evaluate_dm.getString("dm_id") %>">
                                        <%=nav_evaluate_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../evaluate/evaluate_text.jsp">
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
                                    <a href="../law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                        <%=nav_law_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../law/law_text.jsp">
                                        <%=show_str.get("related_links2."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="navOpen mobile">
                            <div class="navOpenBg">
                            <%for(TableRecord nav_law_dm:nav_law_dms){ %>
                                <div class="navOpenList">
                                    <a href="../law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                        <%=nav_law_dm.getString("dm_title") %>
                                    </a>
                                </div>
                            <%} %>
                                <div class="navOpenList">
                                    <a href="../law/law_text.jsp">
                                        <%=show_str.get("related_links2."+lang) %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="nav">
                        <a href="../contact/contact.jsp">
                            <%=show_str.get("contact."+lang) %>
                        </a>
                    </div>

                    <!-- modify by david 20220824 start -->


                    <div class="nav MB">
                        <!--當螢幕 990px 才會出現-->
                        <a href="../news/news.jsp">
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
                                    <a href="../publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
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
                                    <a href="../publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
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
                                    <a href="../research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
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
                                    <a href="../research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
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
                        <a href="../activity/activity_apply.jsp">
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
                        <a href="../link/link.jsp">
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
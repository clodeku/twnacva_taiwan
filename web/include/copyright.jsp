<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <img src="../images/ig@.png" width="64" height="64">
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
                    <img src="../images/line@.png" width="64" height="64">
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
                    <img src="../images/fb_icon.png" width="64" height="64">
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
                            <a href="../about/about.jsp?cp_id=<%=nav_about_cp.getString("cp_id") %>">
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
                            <a href="../members_info/members_info.jsp">
                                <%=nav_member_info_dm.getString("dm_title") %>
                            </a>
                        </div>    
                    <%} %>
                        <div class="footer_navList">
                            <a href="../members_info/members_text.jsp">
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
                            <a href="../course/course.jsp">
                                <%=show_str.get("course_info."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../course/course_apply.jsp">
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
                            <a href="../activity/activity.jsp">
                                <%=show_str.get("activity_info."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../activity/activity_apply.jsp">
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
                            <a href="../evaluate/evaluate.jsp">
                                <%=nav_evaluate_dm.getString("dm_title") %>
                            </a>
                        </div> 
                    <%} %>
                        <div class="footer_navList">
                            <a href="../evaluate/evaluate_text.jsp">
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
                            <a href="../law/law.jsp?dm_id=<%=nav_law_dm.getString("dm_id") %>">
                                <%=nav_law_dm.getString("dm_title") %>
                            </a>
                        </div>
                    <%} %>
                        <div class="footer_navList">
                            <a href="../law/law_text.jsp">
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
                            <a href="../publications/publications.jsp?dm_id=<%=nav_publications_dm.getString("dm_id") %>">
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
                            <a href="../research/research.jsp?dm_id=<%=nav_research_dm.getString("dm_id") %>">
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
                    <%if(!is_member_top) { %>
                        <div class="footer_navList">
                            <a href="../member/add.jsp">
                                <%=show_str.get("add."+lang) %>
                            </a>
                        </div> 
                    <%} else { %>
                        <div class="footer_navList">
                            <a href="../member/modify.jsp">
                                <%=show_str.get("modify."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../member/password.jsp">
                                <%=show_str.get("modifypwd."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../member/order.jsp">
                                <%=show_str.get("order."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../member/announce.jsp">
                                <%=show_str.get("announce."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../member/tacva.jsp">
                                <%=show_str.get("tacva."+lang) %>
                            </a>
                        </div> 
                        <div class="footer_navList">
                            <a href="../member/nacva.jsp">
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
                            <a href="../link/link.jsp?dm_id=<%=nav_link_dm.getString("dm_id") %>">
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
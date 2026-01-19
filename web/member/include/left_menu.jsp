<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!--左側-->     
    <div class="left">
        <!--左側標題-->
        <div class="left_tit">
            <%=show_str.get("member."+lang) %>
        </div>
        <!--左側選單區塊-->
        <div class="left_list_area">
        <%if(!is_member) { %>
            <div class="left_list active"><!--當前模式class加active-->
                <a href="add.jsp">
                    <%=show_str.get("add."+lang) %>
                </a>	
            </div>
        <%} else { %>
            <div class="left_list <%="modify".equals(left_menu_code)?"active":"" %>">
                <a href="modify.jsp">
                    <%=show_str.get("modify."+lang) %>
                </a>	
            </div>
            <div class="left_list <%="modifypwd".equals(left_menu_code)?"active":"" %>">
                <a href="password.jsp">
                    <%=show_str.get("modifypwd."+lang) %>
                </a>	
            </div>
            <div class="left_list <%="order".equals(left_menu_code)?"active":"" %>">
                <a href="order.jsp">
                    <%=show_str.get("order."+lang) %>
                </a>	
            </div>
            <div class="left_list <%="announce".equals(left_menu_code)?"active":"" %>">
                <a href="announce.jsp">
                    <%=show_str.get("announce."+lang) %>
                </a>	
            </div>
            <div class="left_list <%="tacva".equals(left_menu_code)?"active":"" %>">
                <a href="tacva.jsp">
                    <%=show_str.get("tacva."+lang) %>
                </a>	
            </div>
            <div class="left_list <%="nacva".equals(left_menu_code)?"active":"" %>">
                <a href="nacva.jsp">
                    <%=show_str.get("nacva."+lang) %>
                </a>	
            </div>
            <div class="left_list">
                <a href="member_update.jsp?action=logout">
                    <%=show_str.get("logout."+lang) %>
                </a>	
            </div>
        <%} %>
        </div>
    </div>
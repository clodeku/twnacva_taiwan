<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code			= "menu";			// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "後台選單標籤";		// 功能標題
	
	// 在不是 root 帳號或是本機時無法登錄本功能
	if(!app_account.equals("root") && !request.getServerName().equals("localhost")){
		out.write("<script>alert('無修改權限');history.back();</script>");
		return;
	}
	
	Vector mfs = app_sm.selectAll(tblmf, "mf_upfunction=? AND mf_type=?", new String[]{"","1"}, "mf_priority");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
function goaction(FORM,JSP){
    FORM.action = JSP;
    FORM.submit();
}

function godelete(FORM,JSP){
    if (confirm("確定刪除嗎？")) {
        FORM.action = JSP;
        FORM.submit();
    }
}
</script>
</head>
<body>
<div align="center">
  <table width="1280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><table width="1280" border="0" cellspacing="0" cellpadding="0">        
<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
      </table></td>
    </tr>
    <tr>
      <td width="3" align="center" valign="top" class="system_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="system_bk-2b">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="60" align="left" valign="middle"><img src="../images/system_icon_1.gif" width="55" height="48"></td>
            <td align="left" valign="middle" class="system_bigword"><%=show_title %>設定</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr align="center" class="system_title-1">
                        <td colspan="5" class="titlebg">
                        	<span class="system_title-1"><%=show_title %>設定</span>&nbsp;&nbsp;
                        	<span><input type="button" value="<%=show_title %>新增" onclick="javascript:location.href='menu_a.jsp'" /></span>&nbsp;
            				<span><input type="button" value="<%=show_title %>列表" onclick="javascript:location.href='menu.jsp'" /></span>&nbsp;
							<input type="button" value="<%=show_title %>排序" onclick="javascript:location.href='menu_sort.jsp?code=<%=code %>'" />
                        </td>
                      </tr>
                      <tr align="center" class="system_bk-2">
                        <td width="5%" class="tablebg">項次</td>
                        <td width="20%" class="tablebg">選單標籤名稱</td>
                        <td width="30%" class="tablebg">標籤圖示</td>
                        <td width="15%" class="tablebg">顯示狀態</td>
                        <td width="30%"  class="tablebg"><div align="center">功能</div></td>
                      </tr>
                      
					  <%for (int i = 0; i < mfs.size(); i++) {
					       TableRecord mf = (TableRecord)mfs.get(i);
					  %>
					  <form name="form<%=i+1%>" method="post">
  						<input type="hidden" name="mf_id" value="<%=mf.getString("mf_id") %>">
  						<input type="hidden" name="mf_type" value="<%=mf.getString("mf_type") %>">
  						<input type="hidden" name="code" value="<%=code %>">
                      <tr align="center" class="system_table-2-1">
                        <td class="tablebg"><%=i+1 %></td>
                        <td class="tablebg"><%=mf.getString("mf_name")%></td>
                        <td class="tablebg"><img src="../images/<%=mf.getString("mf_image1")%>" width="90" height="28" border="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/<%=mf.getString("mf_image2")%>" width="90" height="28" border="0"></td>
                        <td class="tablebg">
                        	<input type="radio" name="mf_status" value="N" <%="N".equals(mf.getString("mf_status"))?"checked":"" %> onclick="goaction(this.form, 'menu_update.jsp?action=REPLY');" />顯示
							<input type="radio" name="mf_status" value="H" <%="H".equals(mf.getString("mf_status"))?"checked":"" %> onclick="goaction(this.form, 'menu_update.jsp?action=REPLY');" />隱藏
						</td>
                        <td class="tablebg"><div align="center">
                          <input name="detail<%=i+1%>" type="button"  value="下層選單設定" onClick="goaction(this.form, 'menu_sub.jsp?mf_upfunction=<%=mf.getString("mf_id") %>');">                            
                          <input name="modify<%=i+1%>" type="button"  value="修改" onClick="goaction(this.form, 'menu_c.jsp');">                            
                          <input name="delete<%=i+1%>" type="button"  value="刪除" onClick="godelete(this.form, 'menu_update.jsp?action=D');">
                        </div></td>
                      </tr>
					  </form>
					  <% } %>
					  
                  </table></td></tr>
            </table>
            </td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <br>
</div></td>
          </tr>
          <tr>
            <td colspan="2" class="system_bk-2b">&nbsp;</td>
          </tr>
        </table>
        <p>&nbsp;</p>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "smtp_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用

   // Left side type.
   String lefttype = "system";

		// Tiltes.
		String[] titles = new String[] {  "郵件伺服器名稱", "郵件伺服器埠號",  "認證狀態",          "認證帳號",           "認證密碼",           "管理者名稱",         "管理者信箱"};
		// Keywords.
		String[] keywords = new String[] {"smtp.host.name", "smtp.auth.port", "smtp.auth.status", "smtp.auth.account", "smtp.auth.password", "service.email.name", "service.email.address" };
	   // Get records.
	   Vector misimages = new Vector();
	   for (int i = 0; i < titles.length; i++) {
	       TableRecord ss = SiteSetup.getSetup(keywords[i]);
	       if (ss.getString("ss_id").equals("")) {
	           ss = new TableRecord(tblss);
	           ss.setInsert(app_account);
	           ss.setValue("ss_title", titles[i]);
	           ss.setValue("ss_keyword", keywords[i]);
	           app_sm.insert(ss);
	       }
	       misimages.add(ss);
	   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
	/*-- --*/
</script>
</head>
<body style="background-color: rgb(255, 255, 255);">
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
          <td><IFRAME HEIGHT=500 width=20 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no
                id="show"  name="show" SRC="../leftmenu.jsp"></IFRAME></td>
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
            <td align="left" valign="middle" class="system_bigword">外送郵件伺服器設定</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="smtp_c_update.jsp" onsubmit="return checkform(this);">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr align="center">
                        <td colspan="6" class="system_title-1">外送郵件伺服器設定</td>
                      </tr>
                      <tr align="center" class="system_table-2-1">
                        <td colspan="6" class="system_table-2-1"><strong>SMTP說明</strong>（SMTP-是處理外送郵件的伺服器，請輸入發送郵件時的基本設定）</td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">外送郵件伺服器名稱(SMTP)</td>
                        <td colspan="4" align="left" class="system_table-2-1">
                        	<input name="smtp.host.name" type="text" value="<%=SiteSetup.getSetup("smtp.host.name").getString("ss_value") %>" size="50" />
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">埠號(Port)</td>
                        <td colspan="4" align="left" class="system_table-2-1">
                        	<input name="smtp.auth.port" type="text" value="<%=SiteSetup.getSetup("smtp.auth.port").getString("ss_value") %>" size="50" />
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">認證狀態</td>
                        <td colspan="4" align="left" class="system_table-2-1"><input name="smtp.auth.status" type="radio" value="Y" <%="Y".equals(SiteSetup.getSetup("smtp.auth.status").getString("ss_value").trim())?"checked":"" %> />
                          	是
                          <input name="smtp.auth.status" type="radio" value="N" <%="N".equals(SiteSetup.getSetup("smtp.auth.status").getString("ss_value").trim())?"checked":"" %>/>
                          	否
                          <%-- 不建議客戶使用 ,除非客戶堅持才開啟 --%>
                          <input name="smtp.auth.status" type="radio" value="G" <%="G".equals(SiteSetup.getSetup("smtp.auth.status").getString("ss_value").trim())?"checked":"" %>/>
                          	使用 GMail SMTP Server (465 Port)
                          
                          <input name="smtp.auth.status" type="radio" value="O" <%="O".equals(SiteSetup.getSetup("smtp.auth.status").getString("ss_value").trim())?"checked":"" %>/>
                          	使用 Office SMTP Server (587 Port)                         	
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">認證帳號</td>
                        <td colspan="4" align="left" class="system_table-2-1"><input name="smtp.auth.account" type="text" value="<%=SiteSetup.getSetup("smtp.auth.account").getString("ss_value") %>" /></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">認證密碼</td>
                        <td colspan="4" align="left" class="system_table-2-1"><input name="smtp.auth.password" type="password" value="<%=SiteSetup.getSetup("smtp.auth.password").getString("ss_value") %>" /></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">寄件者名稱</td>
                        <td colspan="4" align="left" class="system_table-2-1"><input name="service.email.name" type="text" value="<%=SiteSetup.getSetup("service.email.name").getString("ss_value") %>" size="50" /></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td colspan="2" align="right" class="admini_bk-2">寄件者信箱</td>
                        <td colspan="4" align="left" class="system_table-2-1"><input name="service.email.address" type="text" value="<%=SiteSetup.getSetup("service.email.address").getString("ss_value") %>" size="50" /></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td width="25%" colspan="2" align="right" class="admini_bk-2">最後修改人員</td>
                        <td width="25%" align="left" class="system_table-2-1"><%=SiteSetup.getSetup("smtp.host.name").getString("ss_modifyuser") %></td>
                        <td colspan="2" align="right" class="admini_bk-2">最後修改日期</td>
                        <td width="25%" align="left" class="system_table-2-1"><%=SiteSetup.getSetup("smtp.host.name").getString("ss_modifydate") %></td>
                      </tr>

                  </table></td>
                </tr>
            </table><br>
              <input type="submit"  name="update" value="確定送出">&nbsp;
              <input type="reset"  name="cancel" value="放棄修改"></td>
          </tr>
</form>
          <tr>
            <td colspan="2"><div align="center"><br>
			</div></td>
          </tr>
          <tr>
            <td colspan="2" class="system_bk-2b">&nbsp;</td>
          </tr>
        </table>
        <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<script>
<!--
function checkform(F) {
        return true;
}
//-->
</script>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
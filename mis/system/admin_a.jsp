<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%	String code	= "admin_a";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用 %>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
function validLiteral(INPUT) {
    var litExp = /\W+/;  // non numeral or letter or underscore
    var invalid = litExp.test(INPUT);
    return !invalid;
}
function isEmail(EMAIL) {
    var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return filter.test(EMAIL);
}
function checkEMAIL(EMAIL) {
    return isEmail(EMAIL);
}
function checkform(F){
    if (F.au_account.value == "" || F.au_account.value.length < 3 || F.au_account.value.length > 16 || !validLiteral(F.au_account.value)) {
        alert("請輸入有效的帳號(3至16個英數字)!!");
        F.au_account.value = "";
        F.au_account.focus();
        return false;
    } else if (F.au_name.value == "") {
        alert("請輸入姓名!!");
        F.au_name.focus();
        return false;
    } else if (F.au_password.value == "" || F.au_password.value.length < 4 || F.au_password.value.length > 16 || !validLiteral(F.au_password.value)) {
        alert("請輸入有效的密碼(4至16個英數字)!!");
        F.au_password.value = "";
        F.au_passwordagain.value = "";
        F.au_password.focus();
        return false;
    } else if (F.au_password.value != F.au_passwordagain.value) {
        alert("兩次密碼不一致!!");
        F.au_password.value = "";
        F.au_passwordagain.value = "";
        F.au_passwordagain.focus();
        return false;   
    } else if (F.au_email.value != "" && !checkEMAIL(F.au_email.value)) {
        alert("請輸入有效的電子信箱!!");
        F.au_email.value = "";
        F.au_email.focus();
        return false;
    } else {
        return true;
    }
}
</script>
<!--密碼強度檢測 開始-->
<link rel="stylesheet" type="text/css" href="../js/password_strength/style.css" />
<script type="text/javascript" src="../js/password_strength/jquery.passwordStrength.js"></script>
<script type="text/javascript">
	$(function(){
		$('#au_password').passwordStrength();
	});
</script>
<!--密碼強度檢測 結束-->
<%@include file="/WEB-INF/jspf/mis/authorities.jspf"%>
</head>
<body onload="document.form0.au_account.focus();" style="background-color: rgb(255, 255, 255);">
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
            <td align="left" valign="middle" class="system_bigword">帳號權限設定</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="admin_a_add.jsp" onsubmit="return checkform(this);">
  <input type="hidden" name="node" value="<%=node%>">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="4" class="system_title-1"><span class="system_title-1">帳號權限設定</span>－新增</td>
                    </tr>
                    <tr class="system_table-2-1">
                      <td width="20%" align="right" class="system_table-2-1"><font color='red'>＊</font>&nbsp;帳　　號</td>
                      <td width="30%" align="left" class="system_table-2-1"><input name="au_account" type="text" size="20"></td>
                      <td width="20%" align="right" class="system_table-2-1"><font color='red'>＊</font>&nbsp;姓　　名</td>
                      <td width="30%" align="left" class="system_table-2-1"><input name="au_name" type="text" size="20"></td>
                    </tr>
                    <tr class="system_table-2-1">
                      <td align="right" class="system_table-2-1"><font color='red'>＊</font>&nbsp;密　　碼</td>
                      <td align="left" class="system_table-2-1"><input name="au_password" id="au_password" type="password" size="20" placeholder="6-10 個英數字">
                      	<div id="passwordStrengthDiv" class="is0"></div>
                      </td>
                      <td align="right" class="system_table-2-1"><font color='red'>＊</font>&nbsp;再次輸入密碼</td>
                      <td align="left" class="system_table-2-1"><input name="au_passwordagain" type="password" size="20"></td>
                    </tr>
                    <tr class="system_table-2-1">
                      <td align="right" class="system_table-2-1">E-Mail</td>
                      <td colspan="3" align="left" class="system_table-2-1"><input name="au_email" type="text" size="40" maxlength="50"></td>
                    </tr>
                    <tr class="system_table-2-1">
                      <td colspan="1" align="right" class="system_table-2-1">權限設定</td>
                      <td colspan="3" align="left" class="system_table-2-1"><input name="open" type="button"  value="全部開啟" onClick="selectall(this.form,'0');">&nbsp;
						<input name="close" type="button"  value="全部關閉" onClick="selectall(this.form,'1');">
                      </td>
                    </tr>
                    <tr>
                      <td colspan="1" align="right" class="system_table-2-1">權限個別設定</td>
                      <td colspan="3" align="left" valign="top"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
<% // First level functions.
   for (int i = 0; i < app_tmfs.size(); i++) {
       TableRecord tmf = (TableRecord)app_tmfs.get(i);
%>
                        <tr class="system_table-2-1">
                          <td width="20" align="left" class="system_table-2-1"><input type="checkbox" name="<%=tmf.getString("mf_id")%>" value="1" onclick="change<%=tmf.getString("mf_id")%>(this.form)"></td>
                          <td colspan="3" align="left" class="system_table-2-1"><%=tmf.getString("mf_name")%></td>
                        </tr>
<% // Second level functions.
   Vector mfs2 = app_sm.selectAll("mis_function", "mf_status='N' and mf_upfunction=? and mf_type='2'", new Object[] { tmf.getValue("mf_id") }, "mf_priority");
   for (int j = 0; j < mfs2.size(); j++) {
       TableRecord mf2 = (TableRecord)mfs2.get(j);
%>
                        <tr class="system_table-2-1">
                          <td align="left" class="system_table-2-1">&nbsp;</td>
                          <td width="20" align="left" class="system_table-2-1"><input type="checkbox" name="<%=mf2.getString("mf_id")%>" value="2" onclick="change<%=mf2.getString("mf_id")%>(this.form)"></td>
                          <td colspan="2" align="left" class="system_table-2-1"><%=mf2.getString("mf_name")%></td>
                        </tr>
<% // Third level functions.
   Vector mfs3 = app_sm.selectAll("mis_function", "mf_status='N' and mf_upfunction=? and mf_type='3'", new Object[] { mf2.getValue("mf_id") }, "mf_priority");
   for (int k = 0; k < mfs3.size(); k++) {
       TableRecord mf3 = (TableRecord)mfs3.get(k);
%>
                        <tr class="system_table-2-1">
                          <td align="left" class="system_table-2-1">&nbsp;</td>
                          <td align="left" class="system_table-2-1">&nbsp;</td>
                          <td width="20" align="left" class="system_table-2-1"><input type="checkbox" name="<%=mf3.getString("mf_id")%>" value="3" onclick="change<%=mf3.getString("mf_id")%>(this.form)"></td>
                          <td align="left" class="system_table-2-1"><%=mf3.getString("mf_name")%></td>
                        </tr>
<% } %>
<% } %>
<% } %>
                      </table></td>
                    </tr>
                    <tr class="system_table-2-1">
                      <td align="right" class="system_table-2-1">建檔人員</td>
                      <td align="left" class="system_table-2-1"><%=app_user.getString("au_account")%></td>
                      <td align="right" class="system_table-2-1">建檔日期</td>
                      <td align="left" class="system_table-2-1"><%=DateTimeTool.dateString()%></td>
                    </tr>
                </table></td>
              </tr>
            </table><br>
              <input name="save" type="submit" value="確定送出">&nbsp;&nbsp;&nbsp;&nbsp;
              <input name="reset" type="reset" value="重新填寫">
            </td>
          </tr>
</form>
          <tr>
            <td colspan="2"><div align="center">            
              <p><br>
              </p>
              </div></td>
          </tr>
          <tr>
            <td colspan="2" class="system_bk-2b">&nbsp;</td>
          </tr>
        </table>
        <br>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
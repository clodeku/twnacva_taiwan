<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "password_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
	/*-- --*/
</script>
<!--密碼強度檢測 開始-->
<%@include file="../../JQuery/jquery.jsp" %>
<link rel="stylesheet" type="text/css" href="../js/password_strength/style.css" />
<script type="text/javascript" src="../js/password_strength/jquery.passwordStrength.js"></script>
<script type="text/javascript">
	$(function(){
		$('#au_password').passwordStrength();
		
	});
</script>
<!--密碼強度檢測 結束-->
</head>
<body style="background-color: rgb(255, 255, 255);" onload="form0.au_password.focus();">
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
          <td><IFRAME HEIGHT=500 width=155 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no
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
            <td align="left" valign="middle" class="system_bigword">個人密碼修改</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="password_c_update.jsp" onsubmit="return checkform(this);">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
                      <tr align="center" class="system_title-1">
                        <td colspan="4" class="system_title-1">個人密碼修改</td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td width="30%" align="right" class="admini_bk-2">帳號</td>
                        <td align="left" class="system_table-2-1"><%=app_user.getValue("au_account")%></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td align="right" class="admini_bk-2">姓名</td>
                        <td width="65%" align="left" class="system_table-2-1"><span class="tablebg style5"><%=app_user.getValue("au_name")%></span>
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td align="right" class="admini_bk-2">密碼設定</td>
                        <td align="left" class="system_table-2-1"><input name="au_password" id="au_password" type="password" value="<%=app_user.getValue("au_password")%>" size="15" placeholder="6-10 個英數字">
                        	<div id="passwordStrengthDiv" class="is0"></div>
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td align="right" class="admini_bk-2">再次輸入密碼</td>
                        <td align="left" class="system_table-2-1"><input name="au_passwordagain" type="password" value="<%=app_user.getValue("au_password")%>" size="15"></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td align="right" colspan="4" class="system_table-2-1">&nbsp;</td>
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
function validLiteral(INPUT) {
    var litExp = /\W+/;  // non numeral or letter or underscore
    var invalid = litExp.test(INPUT);
    return !invalid;
}
function checkform(F) {
    if (F.au_password.value == "" || F.au_passwordagain.value == "") {
        alert("請輸入密碼及再次輸入密碼!!");
        F.au_password.focus();
        return false;
    } else if (!validLiteral(F.au_password.value) || !validLiteral(F.au_passwordagain.value)) {
        alert("請輸入有效的密碼!!");
        F.au_password.focus();
        return false;
    } else if (F.au_password.value != F.au_passwordagain.value) {
        alert("請輸入一致的密碼!!");
        F.au_password.focus();
        return false;
    } else {
        return true;
    }
}
</script>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//相關參數設定
	String code 		= "member";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "會員資料維護";		// 功能標題

	// Conditions.
    String qcellphone = StringTool.validString(request.getParameter("_qcellphone"));
    String qaccount = StringTool.validString(request.getParameter("_qaccount"));
    String qname = StringTool.validString(request.getParameter("_qname"));
	
	// Names and values.
	String[] names = new String[] { "npage", "_qname", "_qcellphone", "_qaccount" };
	String[] values = new String[] { String.valueOf(pageno), qname, qcellphone, qaccount };
	
   // Selected id.
   String mp_id = StringTool.validString(request.getParameter("mp_id"));
   // Get record.
   TableRecord mp = app_sm.select(tblmp, mp_id);
%>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
function checkform(F) {
	// 密碼長度需為 12-30 位，其中必須包含1個數字、1個大寫字母、1個小寫字母及1個特殊字符
    var safe_pwd_type = /^.*(?=.{12,30})(?=.*\d)(?=.*[A-Z]{1,})(?=.*[a-z]{1,})(?=.*[!@#$%^&*?\(\)]).*$/;
    // var today = new Date();
    // var thisyear = today.getFullYear();
    // var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
    // validLiteral(欄位)  檢查文數字 , 正確為 true
    // isNaN(欄位)  檢查非數字 , 正確為 true
    // validPhone(欄位) 檢查是否為電話格式 , 正確為 true    

    if (F.mp_password.value == "" || !safe_pwd_type.test(F.mp_password.value)) {
    	alert("請輸入長度至少為12個字元的密碼，並包含1個數字、1個大寫字母、1個小寫字母及1個特殊字符");
        F.mp_password.focus();
        return false;
    else if (F.mp_password.value != F.mp_pswd.value) {
        alert("兩次輸入密碼不相同!!");
        F.mp_password.focus();
        return false;
    } else {
        return true;
    }
}
</script>
<script src="<%=request.getContextPath() %>/js/zip.js"></script>
<style type="text/css">
	.style1 {
		color: #FF0000
	}
</style>
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
      <td width="3" align="center" valign="top" class="web_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="8%" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48" /></td>
            <td width="92%" align="left" valign="middle" class="web_bigword">會員資料</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="<%=code %>_update.jsp?action=M&mp_id=<%=mp_id %>&_qcellphone=<%=qcellphone %>&_qaccount=<%=qaccount %>" enctype="multipart/form-data" onsubmit="return checkform(this);">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="4" class="web_title-1"> 會員資料&nbsp;
                      	<span>
                        	<input name="" type="button" value="會員資料新增" onClick="location='<%=code %>_a.jsp'" />
                      	</span>&nbsp;
                        <span>
                        	<input name="" type="button" value="會員資料查詢" onClick="location='<%=code %>.jsp'" />
                        </span>
                      </td>
                    </tr>
                    <tr align="center" class="web_bk-2">
                      <td colspan="4">會員密碼資料－修改</td>
                    </tr>
                    
					
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>密碼</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_password" type="password" value="<%=mp.getString("mp_password")%>" size="30" maxlength="30">
                      </td>
                      <td class="web_table-2-1" align="right" nowrap><span class="style1">＊</span>再次輸入密碼</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_pswd" type="password" value="<%=mp.getString("mp_password")%>" size="30" maxlength="30">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right" nowrap>最後修改人員</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifyuser")%></td>
                      <td class="web_table-2-1" align="right" nowrap>最後修改日期</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifydate")%></td>
                    </tr>
                </table></td>
              </tr>
            </table> <br>
            <input type="hidden" name="_qname" value="<%=qname %>">
            <input type="submit" value="確定送出">&nbsp;
            <input type="reset" value="重新設定">&nbsp;
            <input type="button" value="放棄修改" onclick="lastpage.submit();">
            </td>
          </tr>
</form>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
        </table>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<script> ResetAll(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city); </script>
<%=HtmlCoder.getForm("lastpage", request.getHeader("referer"), names, values)%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
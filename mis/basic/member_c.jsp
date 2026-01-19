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
   TableRecord rs = app_sm.select(tblrs, "mp_id=? and rs_code=?", new Object[]{mp_id, "add"});
%>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
function checkform(F) {
    var isPhone = /^\(?\d{2}\)?[\s\-]?\d{4}\-?\d{4}$/;								// 驗證連絡電話 
   	
    if(F.mp_phone.value == "" || !isPhone.test(F.mp_phone.value)) {
        alert("請輸入有效的聯絡電話");
        F.mp_phone.focus();
    } else if(F.mp_unit.value == "") {
        alert("請輸入服務單位");
        F.mp_unit.focus();
    } else if(F.mp_job.value == "") {
        alert("請輸入職稱");
        F.mp_job.focus();
    } else {
        return true;
    }
	
    return false;
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
                      <td colspan="4">會員資料－修改</td>
                    </tr>
                    <tr align="center">
                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>姓名</td>
                      <td width="340" class="web_table-2-1" align="left">
                      	<%=mp.getString("mp_name")%>
                      </td>

                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>電話</td>
                      <td width="340" class="web_table-2-1" align="left">
                        <input name="mp_phone" type="text" value="<%=mp.getString("mp_phone")%>" size="30">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>服務單位</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_unit" type="text" size="30" value="<%=mp.getString("mp_unit")%>">
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>職稱</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_job" type="text" size="30" value="<%=mp.getString("mp_job")%>">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1"><div align="right"><span class="style1">＊</span>通訊地址</div></td>
                      <td colspan="3" class="web_table-2-1" align="left">
                        <input name="mp_address" type="text" value="<%=mp.getString("mp_address")%>" size="136" maxlength='100'>
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>是否繳款(是請勾選)</td>
                      <td class="web_table-2-1" align="left">
                        <input type="checkbox" name="rs_pay" value="Y" <%="Y".equals(rs.getString("rs_pay"))?"checked":"" %>>
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>匯款單據帳末五碼</td>
                      <td class="web_table-2-1" align="left">
                        <input name="rs_digits" type="text" size="30" value="<%=rs.getString("rs_digits") %>">
                      </td>
                    </tr>
                    
                    <%--
                    <tr align="center">
                      <td class="web_table-2-1"><div align="right">通訊地址</div></td>
                      <td colspan="3" class="web_table-2-1" align="left">
                        <input type="hidden" name="county" value="<%=mp.getString("mp_county")%>">
                        <input type="hidden" name="city" value="<%=mp.getString("mp_city")%>">
                        縣市<select name="mp_county" id="mp_county" onchange="changeZone(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        鄉鎮區市<select name="mp_city" id="mp_city" onchange="showZipCode(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        郵遞區號<input type="text" name="mp_zipcode" id="mp_zipcode" size="1" value="<%=mp.getString("mp_zipcode")%>" readonly>
                        <input name="mp_address" type="text" value="<%=mp.getString("mp_address")%>" size="60" maxlength='50'>
                        </td>
                    </tr>
                    --%>
                    <%--
                    <tr align="center">
                      <td class="web_table-2-1" align="right">紅利點數</td>
                      <td class="web_table-2-1" align="left"><%=app_df.format(MemberBonus.getTotalBonus(mp.getString("mp_id")))%> 點</td>
                      <td class="web_table-2-1" align="right">加贈紅利點數</td>
                      <td class="web_table-2-1" align="left"><input name="add_bonus" type="text" value="0" size="10" /> 點</td>
                    </tr> 
                    --%>
                                                         
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
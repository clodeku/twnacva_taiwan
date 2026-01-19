<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//相關參數設定
	String code 		= "member";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "會員資料維護";				// 功能標題
	
	// Conditions.
    String qcellphone = StringTool.validString(request.getParameter("_qcellphone"));
    String qaccount = StringTool.validString(request.getParameter("_qaccount"));
    String qname = StringTool.validString(request.getParameter("_qname"));
	
	// Names and values.
	String[] names = new String[] { "npage", "_qname", "_qcellphone", "_qaccount" };
	String[] values = new String[] { String.valueOf(pageno), qname, qcellphone, qaccount };
   
   // Selected id.
   String mpid = StringTool.validString(request.getParameter("mp_id"));
   // Get record.
   TableRecord mp = app_sm.select(tblmp, mpid);
   
   // 取得註冊繳費紀錄
   TableRecord dm = app_sm.select(tbldm, "dm_code=? and dm_lang=?", new Object[]{"add_payment", lang});
   TableRecord rs = app_sm.select(tblrs, "mp_id=? and rs_type=?", new Object[]{mp.getString("mp_id"), dm.getString("dm_id")});
%>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
	/*-- --*/
</script>
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
                      <td colspan="4">會員資料檢視</td>
                    </tr>
                    <tr align="center">
                      <td width="120" class="web_table-2-1" align="right">姓名</td>
                      <td width="200" class="web_table-2-1" align="left"><%=mp.getString("mp_name")%></td>
                      <td width="120" class="web_table-2-1" align="right">帳號(E-mail)</td>
                      <td width="200" class="web_table-2-1" align="left"><%=mp.getString("mp_account")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">服務單位</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_unit")%></td>
                      <td class="web_table-2-1" align="right">職稱</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_job")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">連絡電話</td>
                      <td class="web_table-2-1" align="left" colspan="3"><%=mp.getString("mp_phone")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">通訊地址</td>
                      <td colspan="3" class="web_table-2-1" align="left"><%=mp.getString("mp_county")+mp.getString("mp_zipcode")+mp.getString("mp_city")+mp.getString("mp_address")%></td>
                    </tr>
                    
                    <tr class="web_table-2-1">
					  <td width="10%" align="right" class="tablebg">收據抬頭 ： </td>
                 	  <td width="40%" align="left" class="tablebg"><%=rs.getString("rs_title")%></td>
					  <td width="10%" align="right" class="tablebg">收件人 ： </td>
                 	  <td width="40%" align="left" class="tablebg"><%=rs.getString("rs_name")%></td>
				    </tr>	
				  
				    <tr class="web_table-2-1">
					  <td width="10%" align="right" class="tablebg">收據郵寄地址： </td>
                 	  <td width="40%" colspan="3" align="left" class="tablebg"><%=rs.getString("rs_address") %></td>
				    </tr>
				  
				    <tr class="web_table-2-1">
					  <td width="10%" align="right" class="tablebg">是否繳款 ： </td>
                 	  <td width="40%" align="left" class="tablebg"><%="Y".equals(rs.getString("rs_pay"))?"是":"否" %></td>
					  <td width="10%" align="right" class="tablebg">匯款單末五碼 ： </td>
                 	  <td width="40%" align="left" class="tablebg"><%=rs.getString("rs_digits")%></td>
				    </tr>
				  
                    <tr align="center">
                      <td class="web_table-2-1" align="right">最後修改人員</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifyuser")%></td>
                      <td class="web_table-2-1" align="right">最後修改日期</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifydate")%></td>
                    </tr>
                </table></td>
              </tr>
            </table>              <br>
            <input name="previous" type="button" value="回上一頁" onClick="lastpage.submit();">
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
<%=HtmlCoder.form("lastpage", code + ".jsp", names, values)%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
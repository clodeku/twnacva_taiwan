<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//相關參數設定
	String code 		= "receipt";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "繳款紀錄維護";				// 功能標題
	
	// Conditions.
	String qname = StringTool.validString(request.getParameter("_qname"));
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));	// 抬頭
   	String qaddress = StringTool.validString(request.getParameter("_qaddress"));
   	String qcode = StringTool.validString(request.getParameter("_qcode")); 	// 繳款類別
   
	// Selected id.
	String rs_id = StringTool.validString(request.getParameter("rs_id"));
	// Get record.
	TableRecord rs = app_sm.select(tblrs, rs_id);
	
	// Names and values.
   	String[] names = new String[] { "npage", "_qname", "_qaddress", "_qtitle", "_qcode"};
   	String[] values = new String[] { String.valueOf(pageno), qname, qaddress, qtitle, qcode};
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
            <td width="92%" align="left" valign="middle" class="web_bigword">繳款紀錄</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="4" class="web_title-1"> 繳款紀錄</td>
                    </tr>
                    <tr align="center" class="web_bk-2">
                      <td colspan="4">繳款紀錄檢視</td>
                    </tr>
                    
                    <tr class="web_table-2-1">
						<td width="10%" align="right" class="tablebg">收據抬頭 </td>
	                 	<td width="40%" align="left" class="tablebg"><%=rs.getString("rs_title")%></td>
						<td width="10%" align="right" class="tablebg">收件人  </td>
	                 	<td width="40%" align="left" class="tablebg"><%=rs.getString("rs_name")%></td>
				    </tr>
                    
                    <tr class="web_table-2-1">
					  	<td width="10%" align="right" class="tablebg">收據郵寄地址 </td>
	                 	<td width="40%" colspan="3" align="left" class="tablebg"><%=rs.getString("rs_address") %></td>
					</tr>
					
					<tr class="web_table-2-1">
						<td width="10%" align="right" class="tablebg">繳款項目類別 </td>
	                 	<td width="40%" align="left" class="tablebg">
	                 		<%TableRecord dm = app_sm.select(tbldm, rs.getString("rs_type"));
	                 		  String rs_code = rs.getString("rs_code"); 
	                 		  
	                 		  if("tacva".equals(rs_code)){ %>
	                 			  <%=dm.getString("dm_title")+" "+dm.getString("dm_content") %> / 年
	                 		<%} else if("nacva".equals(rs_code)){ %>
	                 			  <%=dm.getString("dm_title")+" NTD $"+dm.getString("dm_content") %> 元
	                 		<%} %>
	                 	</td>
						<td width="10%" align="right" class="tablebg">是否繳款  </td>
	                 	<td width="40%" align="left" class="tablebg"><%="Y".equals(rs.getString("rs_pay"))?"是":"否" %></td>
				    </tr>
				    
				    <tr class="web_table-2-1">
				    <%if(!"".equals(rs.getString("rs_nacva_code"))){ %>
				    	<td width="10%" align="right" class="tablebg">NACVA 代碼</td>
	                 	<td width="40%" align="left" class="tablebg"><%=rs.getString("rs_nacva_code")%></td>
	                	<td width="10%" align="right" class="tablebg">匯款單末五碼  </td>
	                 	<td width="40%" align="left" class="tablebg"><%=rs.getString("rs_digits")%></td>
	                <%} else {%>
	                	<td width="10%" align="right" class="tablebg">匯款單末五碼  </td>
	                 	<td width="40%" colspan="3" align="left" class="tablebg"><%=rs.getString("rs_digits")%></td>
	                <%} %>
				    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right">最後修改人員</td>
                      <td class="web_table-2-1" align="left"><%=rs.getString("rs_modifyuser")%></td>
                      <td class="web_table-2-1" align="right">最後修改日期</td>
                      <td class="web_table-2-1" align="left"><%=rs.getString("rs_modifydate")%></td>
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
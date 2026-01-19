<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "logs"; 					// 模組識別碼
	String show_title = "系統登入查詢";			// 模組標題
	
	// 功能參數
	int page_items = 15; 			// 列表分頁筆數設定
/*----------------------------------------------------------------------------------*/

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle")).trim();
	String qip = StringTool.validString(request.getParameter("_qip")).trim();
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + DateTimeTool.dateString().substring(4));
		
	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qip", "_qemitdate", "_qrestdate" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qip, qemitdate, qrestdate };

	StringBuffer sb = new StringBuffer();
	Vector keys = new Vector();
	sb.append("al_remoteip like ? and al_createuser like ?");
	keys.add("%" + qip + "%");
	keys.add("%" + qtitle + "%");
	sb.append(" and al_createdate>=? and al_createdate<=? and al_createuser<>?");
	keys.add(qemitdate+" 00:00:00");
	keys.add(qrestdate+" 23:59:59");
	keys.add("root");	
	Vector als = app_sm.selectAll(tblal, sb.toString(), keys.toArray(), "al_createdate DESC");
	
	// 分頁
	out.write(HtmlCoder.getForm("pageform", request.getRequestURI(), names, values));
	// 分頁設定
	app_dp = new DataPager(als, page_items);
	als = app_dp.getPageContent(pageno);
	
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
<script>
function checkform(F) {
    if (F._qemitdate.value > F._qrestdate.value) {
       alert("開始日期不得大於結束日期!!");
       return false;
    } else {
        return true;
    }
}
function clearData(){
	$("#_qtitle").val("");
	$("#_qip").val("");
	$("#_qemitdate").val("<%=DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4)%>");
	$("#_qrestdate").val("<%=DateTimeTool.getYear() + DateTimeTool.dateString().substring(4)%>");
}
</script>
</head>
<body>
<div align="center">
<table width="1280" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
		<table width="1280" border="0" cellspacing="0" cellpadding="0">
			<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
		</table>
		</td>
	</tr>
	<tr>
		<td width="3" align="center" valign="top" class="system_bk-2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0"
					MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0"
					SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
			</tr>
		</table>
		</td>
		<td width="1125" align="center" valign="top" class="system_bk-2p">
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
				<td width="60" align="left" valign="middle"><img
					src="../images/system_icon_1.gif" width="55" height="48"></td>
				<td align="left" valign="middle" class="system_bigword"><%=show_title%></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<td class="system_bk-2bk">
					<table width="100%" border="0" align="center" cellpadding="3"
						cellspacing="1">
						<tr>
							<td align="center" colspan="4" class="system_title-1"><%=show_title%>&nbsp;&nbsp;
							</td>
						</tr>

						<tr align="center" class="system_bk-2">
							<td colspan="4" align="center">條件值搜尋</td>
						</tr>
						<tr class="system_table-2-1">
                 			<td width="30%" align="center" class="tablebg">登入帳號</td>
                 			<td width="30%" align="center" class="tablebg">登入 IP</td>
                 			<td width="20%" align="center" class="tablebg">日期區間</td>
                  			<td width="20%" align="center" class="tablebg">&nbsp;</td>
						</tr>
						
						<form name="list_sea" id="list_sea" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">
						<tr class="system_table-2-1">
							<td align="center"><input name="_qtitle" id="_qtitle" type="text" value="<%=qtitle %>" size="30" /></td>	
							<td align="center"><input name="_qip" id="_qip" type="text" value="<%=qip %>" size="30" /></td>							
		                    <td align="center" class="tablebg">
		                     	<input name="_qemitdate" id="_qemitdate" value="<%=qemitdate %>" readonly type="text" size="9" />
		                     		~
		                       	<input name="_qrestdate" id="_qrestdate" value="<%=qrestdate %>" readonly type="text" size="9" />
	                        </td>
		                    <td align="center">
		                        <input name="query" type="submit" value="查詢">&nbsp;
		            			<input type="button" value="清除" onclick="clearData();" />
		                    </td>
						</tr>
						</form>

					</table>
					</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<td class="system_bk-2bk">
					<table width="100%" border="0" align="center" cellpadding="3"
						cellspacing="1">
						<tr>
							<td align="center" colspan="5" class="system_title-1"><%=show_title%>查詢列表&nbsp;&nbsp;
						</tr>
						<tr align="center" class="system_bk-2">
							<td colspan="5" align="center">標題列表</td>
						</tr>
						<tr class="system_table-2-1">
							<td width="5%" align="center">項目</td>
						    <td width="25%" align="center">登入帳號</td>
						    <td width="30%" align="center">登入 IP</td>
						    <td width="20%" align="center">日期時間</td>
						    <td width="20%" align="center" >狀態</td>
						</tr>
						<%
							for (int i = 0; i < als.size(); i++) {
								TableRecord al = (TableRecord) als.get(i);
						%>
						<tr class="system_table-2-1">
							<td align="center"><%=((pageno - 1) * page_items) + i + 1%></td>
							<td align="center"><%=al.getString("al_createuser") %></td>
							<td align="center"><%=al.getString("al_remoteip") %></td>
							<td align="center"><%=al.getString("al_createdate") %></td>
				            <td align="center"><%=al.getString("al_logtype").equals("1")?"登入":"登出" %></td>
						</tr>
						<%} %>

						<td class="system_bk-2" colspan="5" align="center" height="26px">
							<%=HtmlCoder.hiddenInputs(names, values)%>
							<%@include file="/WEB-INF/jspf/mis/pager.jspf"%>
						</td>

					</table>
					</td>
				</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" class="system_bk-2b">&nbsp;</td>
			</tr>

		</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
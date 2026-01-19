<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "course"; 				// 模組識別碼
	String show_title = "課程介紹維護";		// 模組標題
	
	// 功能參數
	boolean list_switch = true;			// 是否開啟列表功能
	boolean sort_switch = true;			// 是否開啟排序功能
	boolean modify_switch = true;		// 是否開啟修改功能
	boolean search_switch = false;		// 是否開啟搜尋功能
	int page_items = 15; 				// 列表分頁筆數設定
	int add_num = -1;					// 設定可新增的資料筆數 , -1 為無限筆
	int del_num = -1;					// 設定少於幾筆不可刪除 , -1 為無限制

/*--------------------------------------------------------------------------------------------*/

	Vector ais = app_sm.selectAll(tblai, "ai_code=? and ai_lang=?", new Object[] { code, lang }, "ai_showseq ASC , " + "ai_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,ais);
	// 當資料筆數小於設定可刪除的筆數時 , 隱藏刪除按鍵
	boolean delete_switch = num_check(del_num,ais);	
	
	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));

	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle" };
	String[] values = new String[] { String.valueOf(pageno), qtitle };

	if(search_switch) {
		StringBuffer sb = new StringBuffer();
		Vector keys = new Vector();
		sb.append("ai_lang=? and ai_code=? and ai_title like ?");
		keys.add(lang);
		keys.add(code);
		keys.add("%" + qtitle + "%");			
		ais = app_sm.selectAll(tblai, sb.toString(), keys.toArray(), "ai_showseq ASC , ai_createdate DESC");
	}

	// 分頁
	out.write(HtmlCoder.getForm("pageform", request.getRequestURI(), names, values));

	// 分頁設定
	app_dp = new DataPager(ais, page_items);
	ais = app_dp.getPageContent(pageno);	
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
<script>
	function checkform(F) {
		/*
		if (F._qemitdate.value > F._qrestdate.value) {
	    	alert("開始日期不得大於結束日期!!");
		} else {
	    	return true;
		}
	    return false;
		*/
		return true;
	}
	function clearData() {
		$("#_qtitle").val("");
		//$("#_qemitdate").val("<%=DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4)%>");
		//$("#_qrestdate").val("<%=DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4)%>");
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
			<td width="3" align="center" valign="top" class="web_bk-2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0"
								MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0"
								SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
				</tr>
			</table></td>
			<td width="1125" align="center" valign="top" class="system_bk-2p"><table width="95%" border="0" cellspacing="0" cellpadding="0">
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
					<td width="60" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48"></td>
					<td align="left" valign="middle" class="web_bigword"><%=show_title%></td>
				</tr>
				<tr>
					<td colspan="2">
						<hr size="1" noshade />
					</td>
				</tr>
				<%if(search_switch) { %>
				<tr>
					<td align="center" colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr>
								<td align="center" colspan="2" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
									<%if(add_switch) { %>
									<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />&nbsp;
									<%} %>
									<%if(list_switch) { %>
									<input type="button" value="回到列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
									<%} %>
									<%if(sort_switch) { %>
									<input type="button" value="資料排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
									<%} %>
								</td>
							</tr>

							<tr align="center" class="web_bk-2">
								<td colspan="2" align="center">條件值搜尋</td>
							</tr>

							<tr class="web_table-2-1">
								<td width="80%" align="center">標題名稱</td>							
								<td width="20%" align="center">功能</td>
							</tr>

<form name="list_sea" id="list_sea" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">
							<tr class="web_table-2-1">
								<td align="center"><input name="_qtitle" id="_qtitle" type="text" value="<%=qtitle %>" size="123" /></td>							
		                    	<td align="center">
			                        <input name="query" type="submit" value="查詢">&nbsp;
		            				<input type="button" value="清除" onclick="clearData();" />
		                    	</td>
							</tr>
</form>

						</table></td>
					</table></td>
				</tr>
				<%} %>

				<tr>
					<td align="center" colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<%if(!search_switch) { %>
							<tr>
								<td align="center" colspan="3" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
									<%if(add_switch) { %>
									<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />&nbsp;
									<%} %>
									<%if(list_switch) { %>
									<input type="button" value="回到列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
									<%} %>
									<%if(sort_switch) { %>
									<input type="button" value="資料排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
									<%} %>
								</td>
							</tr>
							<%} else { %>
							<tr>
								<td align="center" colspan="3" class="web_title-1"><%=show_title%>查詢列表&nbsp;&nbsp;
							</tr>
							<%} %>

							<tr align="center" class="web_bk-2">
								<td colspan="3" align="center">標題列表</td>
							</tr>

							<tr class="web_table-2-1">
								<td width="5%" align="center">項目</td>
								<td width="75%" align="center">標題名稱</td>						
								<td width="20%" align="center">功能</td>
							</tr>

							<%
							for(int i = 0; i < ais.size(); i++) {
								TableRecord ai = (TableRecord) ais.get(i);
							%>							
<form name="list<%=i + 1%>" id="list<%=i + 1%>" method="post">
							<tr class="web_table-2-1">
								<td align="center"><%=((pageno - 1) * page_items) + i + 1%></td>
								<td align="center"><%=ai.getString("ai_title") %></td>							
								<td align="center">
									<%=HtmlCoder.hiddenInputs(names, values) %>
									<input type="hidden" name="ai_id" id="ai_id" value="<%=ai.getString("ai_id")%>" />
									<%if(modify_switch) { %> 
									<input type="button" value="修改" onclick="goaction(this.form, '<%=code%>_c.jsp');" />&nbsp;
									<%} %>
									<%if(delete_switch) { %>
									<input type="button" value="刪除" onclick="godelete(this.form, '<%=code%>_update.jsp?action=D');" />
									<%} %>
								</td>
							</tr>
</form>
							<%} %>
							<td class="web_bk-2" colspan="3" align="center" height="26px">
								<%@include file="/WEB-INF/jspf/mis/pager.jspf"%>
							</td>
						</table></td>
					</table></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" class="web_bk-2b">&nbsp;</td>
				</tr>
			</table></td>
		</tr>
	</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
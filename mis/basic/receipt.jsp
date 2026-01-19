<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
    //相關參數設定
	String code 		= "receipt";			// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "繳款紀錄維護";			// 功能標題
	int page_items		= 15;					// 列表分頁筆數設定
	
	// Conditions.
	String qname = StringTool.validString(request.getParameter("_qname"));
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));	// 抬頭
   	String qaddress = StringTool.validString(request.getParameter("_qaddress"));
   	String qcode = StringTool.validString(request.getParameter("_qcode")); 	// 繳款類別
   	String qcollect = StringTool.validString(request.getParameter("_qcollect")); 	// 付款狀態
   
//    	String mp_id = StringTool.validString(request.getParameter("mp_id"));
   	
   	if("".equals(qcollect)) {qcollect = "%";}
   
	// Names and values.
   	String[] names = new String[] { "npage", "_qname", "_qaddress", "_qtitle", "_qcode", "_qcollect"};
   	String[] values = new String[] { String.valueOf(pageno), qname, qaddress, qtitle, qcode, qcollect };

   	// Get records.
   	StringBuffer sb = new StringBuffer();
   	Vector keys = new Vector();

   	sb.append("rs_title like? and rs_address like? and rs_name like? and rs_pay like ? and rs_code like ?");
   	keys.add("%"+qtitle+"%");
   	keys.add("%"+qaddress+"%");
   	keys.add("%"+qname+"%");
   	keys.add(qcollect);
   	
   	if(!"".equals(qcode)){
   		keys.add("%"+qcode+"%");
   	} else {
   		keys.add("%acva%");
   	}
   	
   	Vector rss = app_sm.selectAll(tblrs, sb.toString(), keys.toArray()," rs_createdate DESC");

   	// Data paging.
   	app_dp = new DataPager(rss,page_items); 			// 查詢列表筆數
   	rss = app_dp.getPageContent(pageno);
%>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
	function checkform(F) {
		return true;
	}
	function clearData(F) {
		$("#_qname").val("");
		$("#_qtitle").val("");
		$("#_qaddress").val("");
		$("#_qcode").val("");
		$("#_qcollect").val("");
	}
	<%-- 會員資料Excel匯出 --%>
	var timer = "";
	// 啟動檔案匯出功能
	function export_file() {
		var theForm = document.frm1;
		timer = window.setTimeout("exportProgress()", 1500);
		$(".block").show();

		// 查詢資料送出
		theForm.action="export/member_export.jsp";
		theForm.target="_exportFrame";
		theForm.submit();
	}
	// 檢查檔案是否已經匯出完成
	function exportProgress() {
		$.ajax({
			async: false,
			type: "GET",
			url: "export/exportcheck.jsp",
			data: { reportType:"member_export" },
			success: function(res) {
				res = $.trim(res);

				if(res == "start") {
					$(".block").show();
				} else if((res == "end") || (res == "no")) {
					$(".block").hide();
					clearProgress();
					if(res == "end") {
						location.href = "<%=app_fetchpath+"/export/" + app_account + "_member_export.xlsx" %>";
					} else {
						//history.back();
					}
				} else if(res == null || res == "null" || res == "error") {
					alert("匯出失敗 !!");
					$(".block").hide();
					clearProgress();
				}
			},
			error: function(res) {
				res = $.trim(res);
			}
		});
	}
	// 清除檔案匯出完成後之 Session 值
	function clearProgress() {
		$.ajax({
			async:false,
			type:"GET",
			url: "export/exportcheck.jsp",
			data: { reportType:"clear_member_export" },
			success: function(res) {
				clearTimeout(timer);
			}
		});
	}
</script>
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
</head>
<body style="background-color: rgb(255, 255, 255);">
<%-- 黑色遮蔽 --%>
<div class="block" style="width:100%; height:100%; position:fixed; color:#fff; display:none;">
	<img src="export/images/block_bg.png" width="100%" height="100%" style="position:fixed; z-index:99998;" />
	<div style="margin: 0 auto;width: 400px;height: 50px;position: relative;top: 50%; z-index:99999; text-align:center;">
		資料匯出準備中，請稍待片刻 ......
	</div>
</div>
<%-- 黑色遮蔽 --%>
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
            		<td align="left" valign="middle" class="web_bigword"><%=show_title %></td>          
          		</tr>
          		<tr>
            		<td colspan="2"><hr size="1" noshade></td>
          		</tr>
          		<tr align="center">
		            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              			<tr>
	                		<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    			<tr align="center">
                      				<td colspan="6" class="web_title-1"><%=show_title %>&nbsp;
                      					<span>
<%--                         					<input name="" type="button" value="會員資料新增" onClick="location='<%=code %>_a.jsp'" /> --%>
                      					</span>
                      					&nbsp;
                      				</td>
                    			</tr>
                    			<tr align="center" class="web_bk-2">
                      				<td colspan="6">繳款紀錄查詢</td>
                    			</tr>
                   				<tr align="center" class="web_table-2-1">
                   					<td width="18%">繳款項目</td>
                        			<td width="18%">收據抬頭</td>
                        			<td width="18%">收據郵寄地址</td>
                        			<td width="18%">收件人</td>
                        			<td width="10%">是否付款</td>
                        			<td width="18%">&nbsp;</td>
                    			</tr>
								<form name="form0" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">
	                    			<tr class="web_table-2-1">
	                      				<td align="center">
	                      					<select name="_qcode" id="_qcode">
												<option value="">請選擇</option>
												<option value="tacva" <%="tacva".equals(qcode)?"selected":"" %>>常年會費</option>
												<option value="nacva" <%="nacva".equals(qcode)?"selected":"" %>>NACVA 代收</option>
											</select>
	                      				</td>
	                      				<td align="center"><input name="_qtitle" id="_qtitle" value="<%=qtitle %>" type="text" size="27" /></td>
	                      				<td align="center"><input name="_qaddress" id="_qaddress" value="<%=qaddress %>" type="text" size="27" /></td>
	                      				<td align="center"><input name="_qname" id="_qname" value="<%=qname %>" type="text" size="27" /></td>
	                      				<td align="center">
											<select name="_qcollect" id="_qcollect">
												<option value="" <%="".equals(qcollect)?"selected='selected'":"" %>>全 &nbsp;部</option>
												<option value="N" <%="N".equals(qcollect)?"selected='selected'":"" %>>未付款</option>
												<option value="Y" <%="Y".equals(qcollect)?"selected='selected'":"" %>>已付款</option>
											</select>
										</td>
	                      				<td align="center" class="tablebg">
	                        				<input name="query" type="submit" value="查詢">&nbsp;
	            							<input type="button" value="清除" onclick="clearData(this.form);" />
	            							<%-- 
	            							<br /><br />
	            							<input type="button" value="查詢資料匯出" onclick="export_file();" />
	            							--%>
	            						</td>
	                    			</tr>
								</form>
	                    		<tr align="center" class="web_bk-2">
	                      			<td colspan="6">繳款紀錄－查詢列表</td>
	                    		</tr>
	                    		<tr align="center" class="web_table-2-1">
	                        		<td>繳款項目</td>
                        			<td>收據抬頭</td>
                        			<td>收據郵寄地址</td>
                        			<td>收件人</td>
                        			<td>是否付款</td>
	                        		<td>&nbsp;</td>
	                    		</tr>
								<%   
	   							for(int i = 0; i < rss.size(); i++) {
	       							TableRecord rs = (TableRecord)rss.get(i);
								%>
								<form name="form<%=i+1%>" method="post">
		                    		<tr class="web_table-2-1">
		                      			<td align="center"><%="tacva".equals(rs.getString("rs_code"))?"常年會費":"NACVA 代收" %></td>
		                      			<td align="center"><%=rs.getString("rs_title") %></td>
		                      			<td align="center"><%=rs.getString("rs_address") %></td>
		                      			<td align="center"><%=rs.getString("rs_name") %></td>
		                      			<td align="center">
							    			<input type="checkbox" value="Y" name="rs_pay" <%="Y".equals(rs.getString("rs_pay"))?"checked":"" %> onclick="goaction(this.form, '<%=code %>_update.jsp?code=collect');"/>
							    		</td>
		                      			<td align="center">
											<%=HtmlCoder.hiddenInputs(names, values) %>
											<input type="hidden" name="rs_id" value="<%=rs.getString("rs_id") %>" />
		                        			<input name="detail<%=i+1%>" type="button" value="查閱" onClick="goaction(this.form, '<%=code %>_b.jsp');">
		                      			</td>
		                    		</tr>
								</form>
								<%} %>
	                		</table></td>
	              		</tr>
            		</table>
					<%@include file="/WEB-INF/jspf/mis/pager.jspf" %>
            		</td>
          		</tr>
          		<tr>
            		<td colspan="2">&nbsp;</td>
          		</tr>
          		<tr>
		        	<td colspan="2" class="web_bk-2b">&nbsp;</td>
          		</tr>
        	</table></td>
    	</tr>
	</table>
</div>
<iframe name="_exportFrame" width="0" height="0" style="display:none"></iframe>
<form name="frm1" id="frm1" method="post"  >
	<input type="hidden" name="_qname" value="<%=qname %>" />
	<input type="hidden" name="_qtitle" value="<%=qtitle %>" />
	<input type="hidden" name="_qaddress"   value="<%=qaddress %>" />
	<input type="hidden" name="_qcode"   value="<%=qcode %>" />
</form>
</body>
</html>
<%=HtmlCoder.getForm("pageform", request.getRequestURI(), names, values) %>
<%@include file="/WEB-INF/jspf/connclose.jspf" %>
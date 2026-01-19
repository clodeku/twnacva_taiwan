<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "course"; 					// 模組識別碼
	String show_title = "課程介紹維護";			// 模組標題

	// 圖片建議尺寸
	//String image_info = "(建議尺寸1280px * 580px)";
	// 圖片建議尺寸
	//String mobile_info = "(建議尺寸830px * 1300px)";

	// 功能參數
	boolean list_switch = true;				// 是否開啟列表功能
	boolean sort_switch = true;				// 是否開啟排序功能
	boolean keyword_switch = true;			// 是否開啟關鍵字設定
	boolean deadline_switch = true;			// 是否開啟上下架日期	
	int add_num = -1;						// 設定可新增的資料筆數 , -1 為無限筆

/*----------------------------------------------------------------------------------------------*/

	Vector datas = app_sm.selectAll(tblai, "ai_code=? and ai_lang=?", new Object[] { code, lang }, "ai_showseq ASC , ai_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,datas);	
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/htmleditor.jspf"%>
<script>
	<%-- 日期套件用 --%>
	$(document).ready(function() {
		$("#ai_date").dynDateTime({
			ifFormat:"%Y/%m/%d"
		});
		$("#ai_date_end").dynDateTime({
			ifFormat:"%Y/%m/%d"
		});
		$("#ai_endday").dynDateTime({
			ifFormat:"%Y/%m/%d"
		});
	});
	
	function checkform(F) {
		//驗證副檔名
		var file_chk = /([^\/]+\.(?:jpg|jpeg|gif|png|webp))/;
		
		if(F.ai_title.value == "") {
	        alert("請輸入活動標題名稱!!");
	        F.ai_title.focus();
		}else if(F.ai_no.value.trim() == "") {
			alert("請輸入活動代碼");
			F.ai_no.focus();
		}else if(F.ai_date.value.trim() == "") {
			alert("請選擇活動開始日期");
			F.ai_date.focus();
		}else if(F.ai_date_end.value.trim() == "") {
			alert("請選擇活動結束日期");
			F.ai_date_end.focus();
		} else if (F.ai_date.value > F.ai_date_end.value) {
			alert("活動開始日期不可超過活動結束日期!!");
			F.ai_date.focus();
	    }else if(F.ai_num.value.trim() == "") {
			alert("請輸入活動人數");
			F.ai_num.focus();
		}else if(F.ai_endday.value.trim() == "") {
			alert("請選擇報名截止日期");
			F.ai_endday.focus();
		    <%--
	    } else if (F.ai_image.value == "") {
			alert("請上傳圖檔!!");
			F.ai_image.focus();
		} else if (F.ai_image.value != "" && !file_chk.test(F.ai_image.value.toLowerCase())) {
			alert("附檔名限為jpg|jpeg|gif|png|webp!!");
			F.ai_image.focus();
			--%>
		} else {
	        return true;
	    }
		return false;
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
					<td width="60" align="left" valign="middle">
						<img src="../images/web_icon_1.gif" width="55" height="48" />
					</td>
					<td align="left" valign="middle" class="web_bigword"><%=show_title%></td>
				</tr>
				<tr>
					<td colspan="2">
						<hr size="1" noshade />
					</td>
				</tr>
				<tr>
<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=A" onsubmit="javascript:return checkform(this);">
					<td align="center" colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
						<tr>
							<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
								<tr>
									<td align="center" colspan="4" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
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
									<td colspan="4" align="center">新增資訊</td>
								</tr>

								<tr class="web_table-2-1">
									<td width="15%" align="right">活動代碼</td>
									<td colspan="3" width="85%" align="left">
										<input type="text" name="ai_no" id="ai_no" size="50" maxlength="120" />
									</td>
								</tr>
								
								<tr class="web_table-2-1">
									<td width="15%" align="right">活動標題</td>
									<td colspan="3" width="85%" align="left">
										<input type="text" name="ai_title" id="ai_title" size="137" maxlength="120" />
									</td>
								</tr>

								<tr class="web_table-2-1">
									<td align="right" class="web_table-2-1">活動開始日期</td>
									<td align="left" class="tablebg">
										<input name="ai_date" id="ai_date" type="text" value="<%=DateTimeTool.dateString()%>" size="15" readonly>
									</td>
									<td align="right" class="tablebg">活動結束日期</td>
									<td align="left" class="tablebg">
										<input name="ai_date_end" id="ai_date_end" type="text" value="<%=DateTimeTool.dateString()%>" size="15" readonly>
									</td>
								</tr>
								
								<tr class="web_table-2-1">
									<td align="right" class="web_table-2-1">活動人數</td>
									<td align="left" class="tablebg">
										<input name="ai_num" id="ai_num" type="number" size="15">
									</td>
									<td align="right" class="tablebg">報名截止日期</td>
									<td align="left" class="tablebg">
										<input name="ai_endday" id="ai_endday" type="text" value="<%=DateTimeTool.dateString()%>" size="15" readonly>
									</td>
								</tr>

								<tr class="web_table-2-1">
									<td align="right">活動介紹</td>
									<td colspan="3" align="left">
										<textarea name="ai_content" id="ai_content" cols="118" rows="8" class="mceEditor"></textarea>
									</td>
								</tr>

								<%-- 
								<tr class="web_table-2-1">
									<td align="right" class="web_table-2-1">代表圖片</td>
									<td colspan="3" align="left" class="tablebg">
										<input name="ai_image" id="ai_image" type="file" class="button" accept="image/*">
									</td>
								</tr>
								--%>

								<%if(keyword_switch) { %>
								<tr align="center" class="web_bk-2">
									<td colspan="4" align="center">關鍵字設定</td>
								</tr>
								<tr class="web_table-2-1">
									<td align="right">網頁標題</td>
									<td colspan="3" align="left">
										<input type="text" name="ai_webtitle" id="ai_webtitle" size="137" maxlength="255" value="<%=SiteSetup.getSetup("web_title"+"."+lang).getString("ss_text") %>"/>
									</td>
								</tr>
								<tr class="web_table-2-1">
									<td width="15%" align="right">設定索引[Robots]</td>
									<td width="35%" align="left">
										<select name="ai_robots" id="ai_robots">
											<option value="all" <%="all".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>全部-ALL</option>
											<option value="none" <%="none".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>無索引-None</option>
											<option value="index" <%="index".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>索引該網頁-Index</option>
											<option value="noindex" <%="noindex".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>不索引該網頁-NoIndex</option>
											<option value="follow" <%="follow".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>關注特定連結-Follow</option>
											<option value="nofollow" <%="nofollow".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>不關注特定連結-NoFollow</option>
										</select>
									</td>
									<td width="20%" align="right">設定來訪週期</td>
									<td width="30%" align="left">
										<input type="number" name="ai_revisit_after" id="ai_revisit_after" value="<%=SiteSetup.getSetup("seo.revisit_after"+"."+lang).getString("ss_text") %>" size="4" maxlength="4" />天
									</td>
								</tr>
								<tr class="web_table-2-1">
									<td align="right">設定主要關鍵字</td>
									<td align="left">
										<input type="text" name="ai_keywords" id="ai_keywords" size="40" maxlength="255" value="<%=SiteSetup.getSetup("seo.keywords"+"."+lang).getString("ss_text") %>"/>
									</td>
									<td align="right">設定網頁版權說明</td>
									<td align="left">
										<input type="text" name="ai_copyright" id="ai_copyright" size="30" value="<%=SiteSetup.getSetup("seo.copyright"+"."+lang).getString("ss_text") %>"/>
									</td>
								</tr>
								<tr class="web_table-2-1">
									<td align="right">
										網頁內容簡介<br />[建議80-100字]
									</td>
									<td colspan="3" align="left">
										<textarea name="ai_description" id="ai_description" cols="118" rows="3" maxlength="255"><%=SiteSetup.getSetup("seo.description"+"."+lang).getString("ss_text") %></textarea>
									</td>
								</tr>
								<tr class="web_table-2-1">
									<td align="right">設定追蹤碼</td>
									<td colspan="3" align="left">
										<textarea name="ai_seo_track" id="ai_seo_track" cols="118" rows="3"><%=SiteSetup.getSetup("seo.track"+"."+lang).getString("ss_text") %></textarea>
									</td>
								</tr>
								<%} %>
								<%if(deadline_switch) { %>
								<tr align="center" class="web_bk-2">
									<td colspan="4" align="center">上下架時間</td>
								</tr>
								<tr class="web_table-2-1">
									<td align="right" class="web_table-2-1">上架日期</td>
									<td align="left" class="tablebg">
										<input name="ai_emitdate" id="_qemitdate" type="text" value="<%=DateTimeTool.dateString()%>" size="15" readonly>
									</td>
									<td align="right" class="tablebg">下架日期</td>
									<td align="left" class="tablebg">
										<input name="ai_restdate" id="_qrestdate" type="text" value="2099/12/31" size="15" readonly>
									</td>
								</tr>
								<%} %>
								<tr class="web_table-2-1">
									<td align="right">資料建立人員</td>
									<td align="left"><%=app_account%></td>
									<td align="right">資料建立日期</td>
									<td align="left"><%=app_today%></td>
								</tr>
							</table></td>
						</tr>
						<tr align="center">
							<td colspan="4" align="center"><br />
								<input type="submit" value="確定送出" />&nbsp;
								<input type="reset" value="重新設定" />&nbsp;
								<input type="button" value="回上一頁" onClick="location='<%=code%>.jsp';">
							</td>
						</tr>
					</table></td>
</form>
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
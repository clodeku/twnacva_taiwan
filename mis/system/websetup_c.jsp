<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page import="org.apache.commons.io.*"%>
<%
	String code	= "websetup_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用

	// Left side type.
	String lefttype = "system";

	/*-- 針對各語系設定欄位 --*/
	// Tiltes.
	String[] titles = new String[] {
		"網站前台名稱", "地址", "電話", "傳真", "統編", "索引", "信箱", "Facebook 連結", "Instagram 連結",
		"來訪週期", "關鍵字", "版權說明", "內容簡介", "追踪碼", "公司名稱"
	};

	// Keywords.
	String[] keywords = new String[] {
		"web_title", "cp.address", "cp.phone", "cp.fax", "cp.companyno", "seo.robots", "cp.email", "cp.facebook", "cp.instagram",
		"seo.revisit_after", "seo.keywords", "seo.copyright", "seo.description", "seo.track", "cp.company"
	};

	// Get records.
	Vector misimages = new Vector();
	for (int i = 0; i < titles.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords[i] + "." + lang);
		if (ss.getString("ss_id").equals("")) {
			ss = new TableRecord(tblss);
			ss.setInsert(app_account);
			ss.setValue("ss_title", titles[i]);
			ss.setValue("ss_keyword", keywords[i] + "." + lang);
			app_sm.insert(ss);
		}
		misimages.add(ss);
	}

	/*-- 針對不分語系共通設定欄位 --*/
	// Tiltes.
	String[] titles_1 = new String[] { "載入頁", "分頁設定", "全站瀏覽人數" };

	// Keywords.
	String[] keywords_1 = new String[] { "ss.loading", "ss.pageno", "ss.visits" };

	// Get records.
	Vector misimages_1 = new Vector();
	for (int i = 0; i < titles_1.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords_1[i]);
		if (ss.getString("ss_id").equals("")) {
			ss = new TableRecord(tblss);
			ss.setInsert(app_account);
			ss.setValue("ss_title", titles_1[i]);
			ss.setValue("ss_keyword", keywords_1[i]);
			app_sm.insert(ss);
		}
		misimages.add(ss);
	}

	// 計算 uploads 下的資料
	File uploads_f = new File (app_uploadpath);

	long user_size = FileUtils.sizeOfDirectory(uploads_f)/1024/1024;
	String user_size_str = user_size+" MB";
	/*
	System.out.println("file a---"+app_uploadpath);
	System.out.println("uploads_f.getTotalSpace()---"+uploads_f.getTotalSpace());    			// 整個空間大小
	System.out.println("uploads_f.getUsableSpace()---"+uploads_f.getUsableSpace());				// 可用空間大小
	System.out.println("uploads_f.getFreeSpace()---"+uploads_f.getFreeSpace());					// 尚未使用空間大小
	*/
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
	/*-- --*/
</script>
</head>
<body style="background-color: rgb(255, 255, 255);">
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
		<td width="3" align="center" valign="top" class="system_bk-2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><IFRAME HEIGHT="800" width=155 MARGINWIDTH=0 MARGINHEIGHT=0
							HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no id="show" name="show"
							SRC="../leftmenu.jsp"></IFRAME></td>
			</tr>
		</table></td>
		<td width="1125" align="center" valign="top" class="system_bk-2p"><table width="95%" border="0" cellspacing="0" cellpadding="0">
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
				<td align="left" valign="middle" class="system_bigword">系統環境設定</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
<form name="form0" method="post" action="websetup_c_update.jsp" onsubmit="return checkform(this);">
			<tr align="center">
				<td colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr align="center">
								<td colspan="4" class="system_title-1">系統環境設定</td>
							</tr>
							
							<%--
							<tr align="center">
								<td colspan="4" class="market_bk-2">共計使用空間大小:<%=user_size_str %></td>
							</tr>
							--%>								
							
							<tr>
								<td colspan="4" align="center" class="admini_bk-2">網頁標題（Title）設定</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">名稱</td>
								<td width="85%" colspan="3" align="left" class="system_table-2-1">
									<input name="web_title" type="text" size="36" value="<%=SiteSetup.getSetup("web_title" + "." + lang).getString("ss_text")%>" />
								</td>
							</tr>
						</table></td>
					</tr>
				</table></td>
			</tr>

			<tr align="center">
				<td colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">

							<tr align="center">
								<td colspan="4" class="admini_bk-2">頁尾 CopyRight 資訊設定</td>
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">公司名稱</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.company" type="text" value="<%=SiteSetup.getSetup("cp.company" + "." + lang).getString("ss_text")%>" size="42" />
								</td>					
							</tr>
						
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">電話</td>
								<td width="35%" align="left" class="system_table-2-1">
									<input name="cp.phone" type="text" value="<%=SiteSetup.getSetup("cp.phone" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								
								<td width="15%" align="right" class="admini_bk-2">信箱</td>
								<td width="35%" align="left" class="system_table-2-1">
									<input name="cp.email" type="text" value="<%=SiteSetup.getSetup("cp.email" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">地址</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.address" type="text" value="<%=SiteSetup.getSetup("cp.address" + "." + lang).getString("ss_text")%>" size="126" />
								</td>								
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">全站瀏覽人數</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<%=SiteSetup.getSetup("ss.visits").getString("ss_value").trim() %>
								</td>								
							</tr>

							<tr align="center">
								<td colspan="4" class="admini_bk-2">浮動連結設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">Instagram 連結</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.instagram" type="text" value="<%=SiteSetup.getSetup("cp.instagram" + "." + lang).getString("ss_text")%>" size="42" />
								</td>								
							</tr>

							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">Facebook 連結</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.facebook" type="text" value="<%=SiteSetup.getSetup("cp.facebook" + "." + lang).getString("ss_text")%>" size="42" />
								</td>								
							</tr>
							
							<%-- 
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">統編</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.companyno" type="text" value="<%=SiteSetup.getSetup("cp.companyno" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
							</tr>
							--%>

						</table></td>
					</tr>
				</table></td>
			</tr>

			<tr align="center">
				<td colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr align="center">
								<td colspan="4" class="admini_bk-2">系統環境相關參數設定</td>
							</tr>

	                        <tr class="system_table-2-1">
	                          	<td width="15%" align="right" class="admini_bk-2">載入頁 開關設定</td>
	                          	<td width="35%" align="left" class="system_table-2-1">
	                          		<input name="ss.loading" type="radio" value="Y" <%="Y".equals(SiteSetup.getSetup("ss.loading").getString("ss_value").trim())?"checked":"" %> />
	                            	開啟
	                            	<input name="ss.loading" type="radio" value="N" <%=!"Y".equals(SiteSetup.getSetup("ss.loading").getString("ss_value").trim())?"checked":"" %>/>
									關閉
	                          	</td>
	                          	<td width="15%" align="right" class="admini_bk-2">前台分頁 開關設定</td>
	                          	<td width="35%" align="left" class="system_table-2-1">
	                          		<input name="ss.pageno" type="radio" value="Y" <%="Y".equals(SiteSetup.getSetup("ss.pageno").getString("ss_value").trim())?"checked":"" %> />
	                            	開啟
	                            	<input name="ss.pageno" type="radio" value="N" <%=!"Y".equals(SiteSetup.getSetup("ss.pageno").getString("ss_value").trim())?"checked":"" %>/>
									關閉
	                          	</td>
	                        </tr>

						</table></td>
					</tr>
				</table></td>
			</tr>

			<tr align="center">
				<td colspan="2"><table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr>
								<td colspan="4" align="center" class="admini_bk-2">首頁暨各列表頁面關鍵字設定</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">設定索引[Robots]</td>
								<td width="35%" align="left" class="system_table-2-1">
									<select name="seo.robots">
										<option value="all"<%="all".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text")) ? "selected" : ""%>>全部-ALL</option>
										<option value="none"<%="none".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>無索引-None</option>
										<option value="index"<%="index".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>索引該網頁-Index</option>
										<option value="noindex"<%="noindex".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>不索引該網頁-NoIndex</option>
										<option value="follow"<%="follow".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>關注特定連結-Follow</option>
										<option value="nofollow"<%="nofollow".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>不關注特定連結-NoFollow</option>
									</select>
								</td>
								<td width="15%" align="right" class="admini_bk-2">設定來訪週期</td>
								<td width="35%" align="left" class="system_table-2-1">
									<input name="seo.revisit_after" type="text" size="5" value="<%=SiteSetup.getSetup("seo.revisit_after" + "." + lang).getString("ss_text")%>" />[請輸入數字]
								</td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">設定主要關鍵字</td>
								<td align="left" class="system_table-2-1"><input name="seo.keywords" type="text" size="52" value="<%=SiteSetup.getSetup("seo.keywords" + "." + lang).getString("ss_text")%>" /></td>
								<td align="right" class="admini_bk-2">設定網頁版權說明</td>
								<td align="left" class="system_table-2-1"><input name="seo.copyright" type="text" size="52" value="<%=SiteSetup.getSetup("seo.copyright" + "." + lang).getString("ss_text")%>" /></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">網頁內容簡介<br />[建議80~100字]</td>
								<td colspan="3" align="left" class="system_table-2-1"><textarea name="seo.description" cols="113" rows="4"><%=SiteSetup.getSetup("seo.description" + "." + lang).getString("ss_text")%></textarea></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">設定追蹤碼</td>
								<td colspan="3" align="left" class="system_table-2-1"><textarea name="seo.track" cols="113" rows="8"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_text")%></textarea></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">最後修改人員</td>
								<td align="left" class="system_table-2-1"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_modifyuser")%></td>
								<td align="right" class="admini_bk-2">最後修改日期</td>
								<td align="left" class="system_table-2-1"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_modifydate")%></td>
							</tr>
						</table></td>
					</tr>
				</table>
				<br />
				<input type="submit" name="update" value="確定送出">&nbsp;
				<input type="reset" name="cancel" value="放棄修改"></td>
			</tr>
</form>
			<tr>
				<td colspan="2">
					<div align="center"><br></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="system_bk-2b">&nbsp;</td>
			</tr>
		</table></td>
	</tr>
</table>
</div>
<script>
	function checkform(F) {
		return true;
	}
</script>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
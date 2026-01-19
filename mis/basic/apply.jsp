<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
// 相關參數設定
String aa_code 		= "apply";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
String code 		= "apply";
String show_title 	= "報名資訊維護";			// 功能標題
int    page_items	= 15;						// 列表分頁筆數設定
String del_switch	= "off"; 					// 若不允許資料刪除 , 請設定 "off" 

// Conditions.

String qactivity = StringTool.validString(request.getParameter("_qactivity"));
String qname 	 = StringTool.validString(request.getParameter("_qname"));
String qphone 	 = StringTool.validString(request.getParameter("_qphone"));
String qcollect	 = StringTool.validString(request.getParameter("_qcollect"));
String qstatus	 = StringTool.validString(request.getParameter("_qstatus"));
String qrecord	 = StringTool.validString(request.getParameter("_qrecord"));
String qemail	 = StringTool.validString(request.getParameter("_qemail"));
String qcode	 = StringTool.validString(request.getParameter("_qcode"));


// Names and values.
String[] names = new String[] { "npage"                ,"_qactivity","_qname","_qphone","_qcollect","_qstatus","_qrecord","_qemail","_qcode" };
String[] values = new String[] { String.valueOf(pageno),  qactivity,   qname ,  qphone ,  qcollect ,   qstatus ,  qrecord,  qemail, qcode};

// 活動/課程 由新到舊
Vector <TableRecord> ais = app_sm.selectAll(tblai , "ai_lang=? AND ai_code= (? OR ?)",  new Object[] {lang, "activity", "course"} , "ai_createdate DESC ");

// Get records.
StringBuffer sb = new StringBuffer();
Vector keys = new Vector();

sb.append("aa_code like ?");
keys.add("%"+qcode+"%");
sb.append(" and ai_id like ?");
keys.add("%"+qactivity+"%");
sb.append(" and aa_name like ?");
keys.add("%"+qname+"%");
sb.append(" and aa_email like ?");
keys.add("%"+qemail+"%");

//sb.append(" and aa_paymethod like ?");
//keys.add("%"+qpaymethod+"%");
sb.append(" and aa_collect like ?");
keys.add("%"+qcollect+"%");
if(qstatus.equals("cancel")){
	sb.append(" and aa_record_status like ?");
	keys.add("N");
}else{
	sb.append(" and aa_status like ?");
	keys.add("%"+qstatus+"%");	
}
sb.append(" and aa_record_status like ?");
keys.add("%"+qrecord+"%");

Vector <TableRecord> aas = app_sm.selectAll(tblaa, sb.toString(), keys.toArray() , "aa_createdate DESC");

app_dp = new DataPager(aas,page_items);			// 設定資料分頁每頁筆數
aas = app_dp.getPageContent(pageno);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="/WEB-INF/jspf/norobots.jspf"%>
<title><%=app_mistitle%></title>
<%@include file="../../JQuery/jquery.jsp" %>
<%@include file="../../JQuery/include_date.jsp" %>
<script language="JavaScript" type="text/JavaScript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
/*------------------------------------------------------------*/
function checkform(F) {
        return true;
}


function goreturn(FORM,JSP){
	if (confirm("確定退課嗎？")) {
        FORM.action = JSP;
        FORM.submit(); 
    }
}

<%-- 啟動檔案匯出功能 --%>
function export_file() {
	$(".block").show();
	var theForm = document.frm1;
		theForm.action="export/apply_export.jsp";
		theForm.target="_exportFrame";
		theForm.submit();
}

function exportProgress(){   <%-- 檢查檔案是否已經匯出完成 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"apply_export"},
    success: function(res){
    	res = $.trim(res);
    	// console.log(res);
    	if(res == "start"){
    		$(".block").show();
		}else if((res.indexOf("end")>-1) || (res == "no")){
			$(".block").hide();
			clearProgress();
			if(res.indexOf("end")>-1) {
				location.href = "<%=app_fetchpath+"/root/report/" + app_account + "_apply_export.xls" %>";
			}
			else history.back();
		}
    	window.setTimeout("exportProgress()",1500);
    }
}); 		
}

function clearProgress(){  <%-- 清除檔案匯出完成後之 Session 值 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"clear_apply_export"},
    success: function(res){
    }
}); 		
}

var timer = window.setTimeout("exportProgress()",1500);
</script>
<link rel="stylesheet" type="text/css" href="../css/adm_css.css" />
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
</head>
<body style="background-color: rgb(255, 255, 255);">
<%-- 黑色遮蔽 --%>
<div class="block" style="width:100%; height:100%; position:fixed; color:#fff; display:none;">
	<img src="export/images/block_bg.png" width="100%" height="100%" style="position:fixed; z-index:99998;"/>
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
      <td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="company-page" -->
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
            <td width="60" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48"></td>
            <td align="left" valign="middle" class="web_bigword"><%=show_title %></td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
		<tr>
		<td align="center" colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
			<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
				  <tr>
		    	    <td align="center" colspan="9" class="web_title-1">
		    		  <span><%=show_title %></span>&nbsp;&nbsp;
					  <span><input type="button" value="標題列表" onclick="javascript:location.href='<%=aa_code %>.jsp'" /></span>&nbsp;
					  <span><input type="button" value="設定收件者" onclick="javascript:location.href='<%=aa_code %>_pop.jsp'" /></span>
				    </td>
			       </tr>         
		           <tr class="web_bk-2">
                  	<td colspan="9" align="center"><%=show_title %>查詢</td>
                  </tr>
				  <tr class="web_bk-2">
                 	<td width="20%" align="center" class="tablebg">課程/活動名稱</td>
                 	<td width="10%" align="center" class="tablebg">Email</td>
                 	<td width="10%" align="center" class="tablebg">聯絡電話</td>
                 	<td width="15%" align="center" class="tablebg">報名人姓名</td>
					<td width="10%" align="center" class="tablebg">報名紀錄狀態</td>
                 	<td width="10%" align="center" class="tablebg">報名狀態</td>
                 	<td width="10%" align="center" class="tablebg">課程/活動</td>
                 	<td width="10%" align="center" class="tablebg">是否付款</td>
                  	<td width="10%" align="center" class="tablebg">&nbsp;</td>
				  </tr>
				  
		  		  <form name="form0" method="post" action="<%=aa_code %>.jsp" onsubmit="return checkform(this);">          
	              	<tr class="web_table-2-1">
	                     <td align="center" class="tablebg">
							<select name="_qactivity" id="_qactivity" style="width: 190px;">
								<option value="">請選擇</option>
							<%for(TableRecord ai:ais){ %>
								<option value="<%=ai.getString("ai_id") %>" <%=qactivity.equals(ai.getString("ai_id"))?"selected":"" %>><%=ai.getString("ai_title") %></option>
							<%} %>
							</select>
	                     </td>
	                     <td align="center" class="tablebg">
	                     	<input name="_qemail" id="_qemail" type="text" value="<%=qemail %>" size="15" />
	                     </td>	 
	                     <td align="center" class="tablebg">
	                     	<input name="_qphone" id="_qphone" type="text" value="<%=qphone %>" size="15" />
	                     </td>	 
	                     
	                     <td align="center" class="tablebg">
	                     	<input name="_qname" id="_qname" type="text" value="<%=qname %>" size="15" />
	                     </td>	    
  
	                     <td align="center" class="tablebg">
							<select name="_qrecord" id="_qrecord">
								<option value="" >全 &nbsp;部</option>
								<option value="Y" <%="Y".equals(qrecord)?"selected='selected'":"" %>>正常</option>
								<option value="N" <%="N".equals(qrecord)?"selected='selected'":"" %>>作廢</option>
								
							</select>
	                    </td>	                     
	                     <td align="center" class="tablebg">
							<select name="_qstatus" id="_qstatus">
								<option value="">全 &nbsp;部</option>
								<option value="Y" <%="Y".equals(qstatus)?"selected='selected'":"" %>>已完成</option>
								<option value="N" <%="N".equals(qstatus)?"selected='selected'":"" %>>未完成</option>
								<option value="cancel" <%="cancel".equals(qstatus)?"selected='selected'":"" %>>已取消</option>
							</select>
	                    </td>
	                    
	                    <td align="center" class="tablebg">
							<select name="_qcode" id="_qcode">
								<option value="">全 &nbsp;部</option>
								<option value="course" <%="course".equals(qcode)?"selected='selected'":"" %>>課程</option>
								<option value="activity" <%="activity".equals(qcode)?"selected='selected'":"" %>>活動</option>
							</select>
	                    </td>
	                    
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
	            			<!-- <input type="button" value="報名人員匯出" onclick="export_file();" /> -->
	                  	</td>
	              	</tr>		         
		  		  </form>				  
		
		      <!-- InstanceEndEditable -->
		    </td>
			</table></td>
		</table></td>
		</tr>
		<tr>
		<td align="center" colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
			<tr><td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
				  <tr align="center">
				    <td colspan="11" align="center" class="web_title-1">查詢報名人員記錄列表</td>
				  </tr>
				  <tr class="web_bk-2">
				    <td width="5%" align="center">項目</td>
				    <td width="15%" align="center">課程/活動名稱</td>
				    <td width="10%" align="center">報名人姓名</td>
				    <td width="15%" align="center">Email</td>
                 	<td width="10%" align="center">聯絡電話</td>
				    <td width="10%" align="center">報名紀錄狀態</td>
				    <td width="10%" align="center">報名狀態</td>
				    <td width="10%" align="center">課程/活動</td> 
				    <td width="8%" align="center">是否付款</td>
				    <td width="17%" align="center">功能</td>
				  </tr>
				  <%for(int i=0;i<aas.size();i++){ 
						TableRecord aa = (TableRecord)aas.get(i);
						TableRecord ai = app_sm.select(tblai, aa.getString("ai_id"));	// 活動/課程
						TableRecord mp = app_sm.select(tblmp, aa.getString("mp_id"));	// 會員
				  %>
				  <form name="list<%=i+1 %>" id="list<%=i+1 %>" method="post">
				  <tr class="web_table-2-1">
				    <td align="center"><%=((pageno-1) * page_items)+i+1 %></td>
				    <td align="center">&nbsp;&nbsp;<%=ai.getString("ai_title") %></td>
				    <td align="center">
						&nbsp;&nbsp;<%=aa.getString("aa_name") %>
						<%if(!"".equals(aa.getString("aa_memo"))){ %>
						<br /> <span class="shine" style="color:red;">有備註</span> 
						<%} %>	
					</td>
					<td align="center"><%=aa.getString("aa_email") %></td>
					<td align="center"><%=aa.getString("aa_phone") %></td>
					<td align="center"><%="N".equals(aa.getString("aa_record_status"))?"作廢":"正常" %></td>
					<td align="center">
					<%
					String status = "";
					//app_sm.select(tblas, aa.getString("as_id")).getString("as_status").equals("N")
					if(aa.getString("aa_record_status").equals("N")){
						status = "已取消";
					}else{
						if("Y".equals(aa.getString("aa_status"))){
							status = "已完成";
						}else{
							status = "未完成";
						}
					}
					%>
						
						<%=status%>
					</td>
					<td align="center"><%=aa.getString("aa_code").replace("course","課程").replace("activity","活動") %></td>
					<td align="center">
						<input type="checkbox" value="Y" name="aa_collect" <%="Y".equals(aa.getString("aa_collect"))?"checked":"" %> onclick="goaction(this.form, '<%=code %>_update.jsp?code=Collect');"/>
					</td>
					  
				    <td align="center">
						<input type="hidden" name="npage" id="npage" value="<%=pageno%>" />
						<input type="hidden" name="aa_id" id="aa_id" value="<%=aa.getString("aa_id") %>" />
						<input type="hidden" name="aa_code" id="aa_code" value="<%=aa_code %>" />
						<%=HtmlCoder.hiddenInputs(names, values)%>
						<input type="button" name="m<%=i+1 %>" id="m<%=i+1 %>" value="檢視" onclick="goaction(this.form, '<%=aa_code %>_b.jsp');" />&nbsp;
						<%if(aa.getString("aa_code").equals("lesson")){ %>
						<input type="button" name="c<%=i+1 %>" id="c<%=i+1 %>" value="換課" onclick="goaction(this.form, 'change_class.jsp?aa_id=<%=aa.getString("aa_id") %>');" <%="N".equals(aa.getString("aa_record_status"))?"Disabled":"" %>/>&nbsp;
						<input type="button" name="r<%=i+1 %>" id="r<%=i+1 %>" value="退課" onclick="goreturn(this.form, 'apply_update.jsp?code=return&aa_id=<%=aa.getString("aa_id") %>');" <%="N".equals(aa.getString("aa_record_status"))?"Disabled":"" %>/>&nbsp;
						<%} %>
						<%--
						<%if(!"off".equals(del_switch)) { %>
							<input type="button" name="d<%=i+1 %>" id="d<%=i+1 %>" value="<%="N".equals(aa.getString("aa_record_status"))?"恢復":"作癈" %>" onclick="goaction(this.form, '<%=aa_code %>_update.jsp?code=record');"/>
						 <%} %>
						if(!"off".equals(del_switch)) { %><input type="button" name="d<%=i+1 %>" id="d<%=i+1 %>" value="刪除" onclick="godelete(this.form, '<%=aa_code %>_update.jsp?code=D');"/> <%} --%>
						<%--
						<%if(!"".equals(ph.getString("ph_id"))){ %>
						<br /> <span class="shine" style="color:red;">匯款後五碼:</span><br /> <span style="color:red;"><%=ph.getString("ph_bank_no") %></span>
						<%} %>
						 --%>	
				    </td>
				  </tr>
				  </form>
				  <%} %>
				
				<tr class="web_bk-2" >  
					<td colspan="10" align="center" height="26px"> 
					  <%@include file="/WEB-INF/jspf/mis/pager.jspf"%>
					</td>
				</tr>
		      <!-- InstanceEndEditable -->
			</table></td></tr>
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
<iframe name="_exportFrame" width="0" height="0" style="display:none"></iframe>
</body>


</html>
<%=HtmlCoder.getForm("frm1", request.getRequestURI(), names, values)%>
<%=HtmlCoder.getForm("pageform", request.getRequestURI(), names, values)%>
<script language="JavaScript" type="text/JavaScript">
<!--
function clearData(F){
	$("#_qactivity").val("");
	$("#_qname").val("");
	$("#_qphone").val("");
	$("#_qcollect").val("");
	$("#_qstatus").val("");
	$("#_qemail").val("");
	$("#_qcellphone").val("");
}
//-->
</script>
<%@include file="/WEB-INF/jspf/connclose.jspf" %>
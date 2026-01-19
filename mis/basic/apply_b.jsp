<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
// 相關參數設定
String aa_code 		= "apply";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
String code = "apply";
String show_title 	= "報名資訊維護";					// 功能標題


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


String aa_id = StringTool.validString(request.getParameter("aa_id"));
TableRecord aa = app_sm.select(tblaa, aa_id);
TableRecord ai = app_sm.select(tblai, aa.getString("ai_id"));
TableRecord rs = app_sm.select(tblrs, "aa_id=?", new Object[]{aa.getString("aa_id")});
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="/WEB-INF/jspf/norobots.jspf"%>
<title><%=app_mistitle%></title>
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

function goaction(FORM,JSP){
    FORM.action = JSP;
    FORM.submit();
}

/*------------------------------------------------------------*/
</script>
<link rel="stylesheet" type="text/css" href="../css/adm_css.css" />
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
            <td align="left" valign="middle" class="web_bigword"><%=show_title %>維護</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post">	
		<tr>
		<td align="center" colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
			<td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
				  <tr>
		    	    <td align="center" colspan="4" class="web_title-1">
		    		  <span><%=show_title %>維護</span>&nbsp;&nbsp;
					  <span><input type="button" value="標題列表" onclick="javascript:location.href='<%=aa_code %>.jsp'" /></span>&nbsp;
					  <span><input type="button" value="設定收件者" onclick="javascript:location.href='<%=aa_code %>_pop.jsp'" /></span>
				    </td>
			       </tr>         
		           <tr class="web_bk-2">
                  	<td colspan="4" align="center"><%=show_title %>檢視</td>
                  </tr>
				  
				  <tr class="web_table-2-1">
				  <td width="10%" align="right" class="tablebg">報名編號 : </td>
                 	<td width="40%" align="left" class="tablebg" colspan="3"><%=aa.getString("aa_no") %></td>
				  </tr>

				  <tr class="web_table-2-1">
                  	<td width="10%" align="right" class="tablebg">姓名 ： </td>
                 	<td width="40%" align="left" class="tablebg"><%=aa.getString("aa_name") %></td>
                 	<td width="10%" align="right" class="tablebg">活動名稱 : </td>
                 	<td width="40%" align="left" class="tablebg"><%=ai.getString("ai_title") %></td>
				  </tr>
				  
				  <tr class="web_table-2-1">
					<td width="10%" align="right" class="tablebg">E-mail： </td>
                 	<td width="40%" align="left" class="tablebg"><%=aa.getString("aa_email") %></td>
                 	<td width="10%" align="right" class="tablebg">電話： </td>
                 	<td width="40%" align="left" class="tablebg"><%=aa.getString("aa_phone") %></td>
				  </tr>	
				  
				  <tr class="web_table-2-1">
					<td width="10%" align="right" class="tablebg">通訊地址： </td>
                 	<td width="40%" colspan="3" align="left" class="tablebg"><%=aa.getString("aa_address") %></td>
				  </tr>	
				  
				  <tr class="web_table-2-1">
					<td width="10%" align="right" class="tablebg">服務單位 ： </td>
                 	<td width="40%" align="left" class="tablebg"><%=aa.getString("aa_unit")%></td>
					<td width="10%" align="right" class="tablebg">職稱 ： </td>
                 	<td width="40%" align="left" class="tablebg"><%=aa.getString("aa_job")%></td>
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
				  
				  
				  
			<%-- 
			<tr>
            	<td colspan="4" align="center" class="web_title-1">管理者備註</td>
            </tr>	
				  <tr class="web_table-2-1">
                  	<td align="right" width="160" class="tablebg"> 備註： </td>
                 	<td align="left" width="340" class="tablebg" colspan="3" >	
						<textarea name="aa_memo" id="aa_memo" rows="10" cols="120"><%=aa.getString("aa_memo") %></textarea>
				  </tr>	
			 --%>
		      <!-- InstanceEndEditable -->
			</table></td>
		</table><br>
			<input type="hidden" name="npage" id="npage" value="<%=pageno%>" />
			<input type="hidden" name="aa_id" id="aa_id" value="<%=aa.getString("aa_id") %>" />
			<input type="hidden" name="aa_code" id="aa_code" value="<%=aa_code %>" />
			<%=HtmlCoder.hiddenInputs(names, values)%>
			<%-- <input name="submemo" type="button" value="送出備註" onclick="goaction(this.form, '<%=aa_code %>_update.jsp?code=memo');" />&nbsp;&nbsp; --%>
	        <input name="back" type="button" value="回上一頁"  onclick="goaction(this.form, '<%=aa_code %>.jsp');" />
	        </td>
		</tr>
</form>
        </td>
		</tr>
<tr>
	<td colspan="3">&nbsp;</td>
</tr>
<tr>
	<td colspan="3" class="web_bk-2b">&nbsp;</td>
</tr>

</table></td>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf" %>
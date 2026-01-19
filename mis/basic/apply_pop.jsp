<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
// 相關參數設定
String aa_code 		= "apply";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
String code = "apply";
String show_title 	= "報名資訊維護";					// 功能標題

// 設定預設值
// Tiltes.
String[] titles = new String[] { "活動報名記錄正本收件者","活動報名記錄副本收件者" };
// Keywords.
String[] keywords = new String[] { "original" , "duplicate" };
// Get records.
Vector misimages = new Vector();
for (int i = 0; i < titles.length; i++) {
   TableRecord ss = SiteSetup.getSetup(keywords[i]+"."+aa_code+"."+lang);
   if (ss.getString("ss_id").equals("")) {
       ss = new TableRecord(tblss);
       ss.setInsert(app_account);
       ss.setValue("ss_title", titles[i]);
       ss.setValue("ss_keyword", keywords[i]+"."+aa_code+"."+lang);
       app_sm.insert(ss);
   }
   misimages.add(ss);
}

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
                  <form name="frm1" id="frm1" method="post" action="<%=aa_code %>_update.jsp?code=POP3&aa_code=<%=aa_code %>">
					  <tr align="center" class="web_bk-2">
					    <td colspan="4" align="center">收件者設定</td>
					  </tr>
					  <tr class="web_table-2-1">
					  	<td width="10%" align="center">
							正本
					  	</td>
					 	<td align="center">
							<textarea name="original" id="original" cols="70%" rows="2"><%=SiteSetup.getValue("original."+aa_code+"."+lang) %></textarea>
						</td>
					  </tr>
					  <%--
					  <tr class="web_table-2-1">
						<td align="center">
							副本
						</td>
						<td align="center">
							<textarea name="duplicate" id="duplicate" cols="70%" rows="2"><%=SiteSetup.getValue("duplicate."+aa_code+"."+lang) %></textarea>
						</td>
					  </tr>
					  --%>
					  <tr class="web_table-2-1">
					  	<td colspan="4" align="center" ><B>請以逗號 『 ， 』作收件人區分設定 : 例:123@gmail.com , abc@gmail.com</B></td>
					  </tr>
					  <tr class="web_bk-2">
					  	<td colspan="4" align="center" ><input type="submit" value="確定送出" /></td>
					  </tr>
				  </form>
                  
		      <!-- InstanceEndEditable -->
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
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf" %>
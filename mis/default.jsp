<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/config.jspf"%>
<%@ include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//基本參數
	String code = "default"; 					// 模組識別碼
	
   session.setAttribute("node", "0");
   // Selected record id.
   String mfid = StringTool.validString(request.getParameter("mfid"));
   // Get record.
   Vector cmfs = app_sm.selectAll("mis_function", "mf_id=?", new Object[] { mfid });
   // Current top function.
   app_ctmf = (cmfs.size() > 0) ? (TableRecord)cmfs.get(0) : (TableRecord)session.getAttribute("current_top");
   session.setAttribute("current_top", app_ctmf);
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
<html><!-- InstanceBegin template="/Templates/system.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Robots" content="none"> 
<%-- 後台 Title 使用之 ICON --%>
<link rel="shortcut icon" href="./images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="./images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="./images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="./images/icon@2.png" /><!--手機版icon  114x114px-->
<!-- InstanceBeginEditable name="doctitle" -->
<title><%=app_mistitle%></title>
<!-- InstanceEndEditable --><script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<link href="css/adm_css.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.style7 {color: #FFFFFF}
-->
</style>
<!-- InstanceEndEditable -->
</head>

<body style="background-color: rgb(255, 255, 255);">
<div align="center">
  <table width="1280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><table width="1280" border="0" cellspacing="0" cellpadding="0">       
        <!-- Top Start -->
<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
        <!-- Top End -->
      </table></td>
    </tr>
    <tr>
      <td width="3" align="center" valign="top" class="system_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="800" width=155 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no
                 id="show" name="show" SRC="leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="<%=app_ctmf.getString("mf_bgcolor2")%>">&nbsp;</td>
          </tr>
          <tr>
            <td><br>
            <br></td>
          </tr>
          <tr>
            <td><table width="357" height="269" border="0" align="center" cellpadding="0" cellspacing="0" background="images/w-1.gif">
              <tr>
                <td width="176"> <br> </td>
                <td width="181"><span class="style7"><br><br><br><br><br><br><B><%=app_user.getString("au_account")%>… <br>
您已成功進入本單元系統</B></span> </td>
              </tr>
            </table></td>
          </tr>
          <tr align="center">
            <td>&nbsp;              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="<%=app_ctmf.getString("mf_bgcolor2")%>">&nbsp;</td>
          </tr>
        </table>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
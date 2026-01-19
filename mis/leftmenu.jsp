<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
   // Current top function record.
   TableRecord ctmf = (TableRecord)session.getAttribute("current_top");
   Vector _clmfs = null;
   
   // Current left function records(level 2).
   _clmfs = app_sm.selectAll("mis_function", "mf_status='N' and mf_upfunction=?", new Object[] { ctmf.getValue("mf_id") }, "mf_priority");
   
   // Node number.
   int nodes = 0;
   // Total items.
   int items = 0;
   String firsturl = "";
   
   String mf_id = "";
   String mf_bgcolor1="";
   String mf_bgcolor2="";
   String mf_folder = "";
   for (int i = 0; i < app_tmfs.size(); i++) {
       TableRecord mf = (TableRecord)app_tmfs.get(i);
       if ((mf.getString("mf_id")).equals(app_ctmf.getString("mf_id"))){
           mf_id = mf.getString("mf_id");
           mf_bgcolor1 = mf.getString("mf_bgcolor1");
           mf_bgcolor2 = mf.getString("mf_bgcolor2");
           mf_folder = mf.getString("mf_folder");
       }
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Robots" content="none"> 
<title><%=app_mistitle%></title>
<script language="JavaScript" src="../js/Folder_Tree.js"></script>
<Script language="javascript">
<!--
function changeiframe(w)
{
    parent.document.getElementById('show').style.width = w; 
    document.getElementById('iframeUnExpand').style.visibility = "hidden";  	
    document.images["openImage"].width = "0";
    document.images["openImage"].height = "0";        
}

foldersTree = gFld("<%=ctmf.getString("mf_name")%>", "");
<%
   for (int i = 0; i < _clmfs.size(); i++) {
       TableRecord mf = (TableRecord)_clmfs.get(i);
       // Special user can not change password.
       /*
       if (app_user.getString("au_account").equals("root") && mf.getString("mf_name").equals("個人密碼修改")) {
           continue;
       }
       */
       // For first selection is a link.
       if (i==0) {
           firsturl = mf.getString("mf_url");
           
       }
       // Check if has authority.
      
       Vector amfs = app_sm.selectAll("admin_map_function", "au_id=? and mf_id=?", new Object[] { app_user.getValue("au_id"), mf.getString("mf_id") });
       if (amfs.size() > 0 || app_user.getString("au_account").equals("root")) {
    	   
           nodes++;
           items++;          
        	  
           if ((mf.getString("mf_url")).equals("")) {
%>
    aux<%=mf.getString("mf_id")%> = insFld(foldersTree, gFld("<%=mf.getString("mf_name")%>"," "));
<%        } else { %>
    insDoc(foldersTree, gLnk("_parent", "<%=mf.getString("mf_name")%>", "<%=mf_folder%>/<%=mf.getString("mf_url")%>?node=0"));
<%
           }
       }
       // Current third level functions.
       Vector mfs1 = app_sm.selectAll("mis_function", "mf_status='N' and mf_upfunction=?", new Object[] { mf.getString("mf_id") }, "mf_priority");
       for (int j = 0; j < mfs1.size(); j++) {
           TableRecord mf1 = (TableRecord)mfs1.get(j);
           // Check if has authority.
           Vector amfs1 = app_sm.selectAll("admin_map_function",  "au_id=? and mf_id=?", new Object[] { app_user.getValue("au_id"), mf1.getString("mf_id") });
           if (amfs1.size() > 0 || app_user.getString("au_account").equals("root")) {
               items++;
               if ((mf1.getString("mf_url")).equals("")) {
%>
    aux<%=mf1.getString("mf_id")%> = insFld(foldersTree, gFld("<%=mf1.getString("mf_name")%>"," "));
<%            } else { %>
    insDoc(aux<%=mf1.getString("mf_upfunction")%>, gLnk("_parent", "<%=mf1.getString("mf_name")%>", "<%=ctmf.getString("mf_folder")%>/<%=mf1.getString("mf_url")%>?node=<%=nodes%>"));
<%
               }
           }
       }
       nodes = items;
   }
%>
-->
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: <%=mf_bgcolor1%>;
}
.style1 {
	font-size: 12px;
	color: #FFFFFF;
}
a:link {
	font-size: 12px;
	color: #000000;
	text-decoration: none;
}
a:visited {
	font-size: 12px;
	color: #1E3D6A;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #0371CB;
	text-decoration: underline;
}
.style2 {font-size: 12px}
-->
</style>
</head>
<body OnLoad="changeiframe(155);<% if(!node.equals("0")) out.println("clickOnNode("+node+");"); %>">
<div align="center"  id="iframeUnExpand">
        <table width="15" height="0" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="15" align="left" valign="top"><span class="system_bk-2"><span class="admin_bk-2"><img src="images/icon_3.gif" width="20" height="97"  id="openImage"  border="0"  onclick="OpenWindow();"></span></span></td>
            </tr>
</table>
</div>
<div align="center" id="iframeExpand" >
  <table width="139" border="0" cellspacing="0" cellpadding="2" id="tables999">
    <tr align="right">
      <td>&nbsp;</td>
      <td colspan="2" valign="bottom"><img src="images/icon_2.gif" width="19" height="14" border="0"  id="closeImage" onclick="closeWindow();"></td>
    </tr>
    <tr align="center" bgcolor="<%=mf_bgcolor2%>">
      <td colspan="3" class="basic_bk-2b"><span class="word-wbk style1"><span class="other_bk-2b"><span class="word-wbk"><span class="system_bk-2b"><%=ctmf.getString("mf_name")%></span></span></span></span></td>
    </tr>
    <tr bgcolor="#FFFFFF" class="bk-2r">
      <td colspan="3" align="left" align="center">
        <!--展開功能表-->
        <script language="JavaScript">
           initializeDocument();
        </script>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
<script>
function closeWindow() { 
            document.getElementById('iframeExpand').style.visibility ="hidden";       
            document.getElementById('iframeUnExpand').style.visibility = "visible";             
            parent.document.getElementById('show').style.width = "20";                  
            parent.parent.document.getElementById('show').width = "20px";                  
            document.images["openImage"].width = "20";
            document.images["openImage"].height = "97";      
            document.images["closeImage"].width = "0";
            document.images["closeImage"].height = "0";                  
}
function OpenWindow() {
            document.getElementById('iframeUnExpand').style.visibility = "hidden";
            document.getElementById('iframeExpand').style.visibility ="visible";
            parent.document.getElementById('show').style.width = "<%=155%>";
            parent.parent.document.getElementById('show').width = "<%="155px"%>";
            document.images["openImage"].width = "0";
            document.images["openImage"].height = "0";
            document.images["closeImage"].width = "19";
            document.images["closeImage"].height = "14";
}
</script>
<%@ include file="/WEB-INF/jspf/connclose.jspf"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.*" %>
<%!
   private File[] sortFiles(File[] files) {
       Vector vc = new Vector();
       for (int i = 0; i < files.length; i++) {
           File thefile = files[i];
           String filename = thefile.getName();
           boolean set = false;
           for (int j = 0; j < vc.size(); j++) {
               File tfile = (File)vc.get(j);
               if (filename.toLowerCase().compareTo(tfile.getName().toLowerCase()) < 0) {
                   vc.insertElementAt(thefile, j);
                   set = true;
                   break;
               }
           }
           if (!set) {
               vc.add(thefile);
           }
       }
       File[] rtnfiles = new File[files.length];
       for (int i = 0; i < vc.size(); i++) {
           rtnfiles[i] = (File)vc.get(i);
       }
       return rtnfiles;
   }
%>
<%
//刪除檔案
if(request.getParameter("delfile")!=null){
    new File(request.getParameter("delfile")).delete();
}
String url = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
String Path = request.getRealPath("uploads/byself");
String root_path = request.getRealPath("uploads/byself");
root_path = root_path.replaceAll("\\\\","/");
if(request.getParameter("path")!=null)
    Path = request.getParameter("path");
String strDir = Path;
File fDir = new File(strDir);
//File[] fAllFiles = fDir.listFiles();
File[] fAllFiles = sortFiles(fDir.listFiles());
Path = Path.replaceAll("\\\\","/");
%>
<html>
    <head><title>JSP Page</title></head>
    <body onload="javascript:parent.actions.path.value='<%=Path%>';">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr align="left">
            <td colspan="2" align="left" valign="top">
                <img src="<%=request.getContextPath()%>/mis/icons/opened.gif" width="17" height="17">
                <font size="2">
                <% if(Path.equals(root_path)){ %>
                    Images Root
                <% }else{
                        out.println(Path.substring(Path.lastIndexOf("/")+1));
                      } 
                %>
                </font></a>
            </td>
            <td align="right" valing="bottom">
            <% 
                if(!Path.equals(root_path)){
                    String upPath = Path.substring(0,Path.lastIndexOf("/"));
            %>
                <a href="lister.jsp?path=<%=upPath%>">
                <img src="<%=request.getContextPath()%>/mis/icons/upfolder.gif" width="15" height="15" border="0">
                </a>
            <% } %>
            </td>
          </tr>
          <% 
            for(int i=0; i<fAllFiles.length; i++){ 
                if(fAllFiles[i].isDirectory()){
          %>
          <tr>
            <td align="left" valign="top">&nbsp;</td>
            <td align="left">
                <img src="<%=request.getContextPath()%>/mis/icons/closed.gif" width="17" height="17">
                <a href="lister.jsp?path=<%=Path%>/<%=fAllFiles[i].getName()%>">
                <font size="2"><%=fAllFiles[i].getName()%></font>
                </a>
            </td>
            <td align="left" valign="bottom">&nbsp;
            </td>
          </tr>
          <%
                }
            }
            for(int i=0; i<fAllFiles.length; i++){ 
                if(fAllFiles[i].isFile()){
          %>
          <tr>
            <td align="left" valign="top">&nbsp;</td>
            <td align="left">
                <% 
                    String[] realpath = Path.split(request.getRealPath("").replaceAll("\\\\","/"));
                    String fileName = fAllFiles[i].getName();
                    String secondName = "null";
                    if(fileName.lastIndexOf(".") > -1){
                        secondName = fileName.substring(fileName.lastIndexOf(".")+1);
                    }
                    File ckFile = new File(request.getRealPath("mis/icons")+"/"+secondName+".gif");
                    if(ckFile.exists()){
                %>
                <img src="<%=request.getContextPath()%>/mis/icons/<%=secondName%>.gif" width="17" height="17">
                <%   }else{ %>
                <img src="<%=request.getContextPath()%>/mis/icons/null.gif" width="17" height="17">
                <%   } %>
                <a href="javascript:;" onclick="javascript:parent.txtFileName.value='<%=url%><%=realpath[1]%>/<%=fAllFiles[i].getName()%>';
                                                                 javascript:parent.frames['viewer'].location='viewer.jsp?filename=<%=realpath[1]%>/<%=fAllFiles[i].getName()%>';">
                <font size="2"><%=fAllFiles[i].getName()%></font>
                </a>
            </td>
            <td align="left" valign="bottom">
                <a href="lister.jsp?path=<%=Path%>&delfile=<%=fAllFiles[i].getParent()%>/<%=fAllFiles[i].getName()%>">
                    <img src="<%=request.getContextPath()%>/mis/icons/trash.gif" width="17" height="17" border="0">
                </a>
            </td>
          </tr>
          <%
                }
            }
          %>
      </table>
    </body>
</html>

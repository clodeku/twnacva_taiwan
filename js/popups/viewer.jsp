<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.*" %>
<%
String url = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<html>
    <head><title>JSP Page</title></head>
    <body>
    <%
        if(request.getParameter("filename")!=null){
            File img = new File(request.getRealPath("")+request.getParameter("filename"));
            if(img.exists()){
                boolean flag = false;
                int w = 150;
                int h = 150;
    %>
       <table width="100%" border="0" cellspacing="3" cellpadding="0">
          <tr align="center">
            <td align="center" bgcolor="#747474"><font size="2" color="#FFFFFF">
            <b><%=img.getName()%></b><br>
            <%
                String secondName = "";
                if(img.getName().lastIndexOf(".") > -1){
                    secondName = img.getName().substring(img.getName().lastIndexOf(".")+1);
                }
                
                if(secondName.equals("gif") || secondName.equals("jpg") || secondName.equals("png")){
                    flag = true;
                    long len = img.length();
                    if(len > 1024){
                        len = len / 1024 ;
                        out.println(len+" KB");
                    }else{
                        out.println(len+" Bytes");
                    }
                    w = ImageIO.read(img).getWidth();
                    h = ImageIO.read(img).getHeight();
                    out.println("<I>（"+w+" x "+h+"）</I>");
                }
            %></font>
            </td>
          </tr>
          <tr>
            <td align="center" valign="bottom">
            <%
                if(flag){
                    if(w>100)
                        w = 100;
                    if(h>100)
                        h = 100;
            %>
                <img src="<%=url%>/<%=request.getParameter("filename")%>" width="<%=w%>" height="<%=h%>">
            <%
                
                }
            %>
            </td>
          </tr>
      </table>
    <%
            }
        }else{
    %>
       <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td align="center">
            <img src="<%=request.getContextPath()%>/mis/icons/noimages.gif" width="184" height="48">
            </td>
          </tr>
       </table>
    <%
        }
    %>
    </body>
</html>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="javazoom.upload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
if(((String)mrequest.getParameter("action")).equals("upload")){
    String uploadpath = mrequest.getParameter("path");
%>
    <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
      <jsp:setProperty name="upBean" property="folderstore" value="<%=uploadpath%>" />
      <jsp:setProperty name="upBean" property="overwrite" value="true" />
    </jsp:useBean>
<%
    //處理上傳檔案
    Hashtable files = mrequest.getFiles();
    if (files != null && !files.isEmpty()) {
        UploadFile file = (UploadFile) files.get("image");
        String fileName = file.getFileName().toLowerCase();
        if (fileName != null) {
            if(!((String)mrequest.getParameter("name")).equals("")){
                file.setFileName(mrequest.getParameter("name").toLowerCase());
            }
            else {
                file.setFileName(fileName.toLowerCase());
            }
           upBean.store(mrequest, "image");
         }
    }
    response.sendRedirect("lister.jsp?path="+uploadpath);
}else if(((String)mrequest.getParameter("action")).equals("create")){
    String uploadpath = mrequest.getParameter("path");
    File newFolder = new File(uploadpath+"/"+mrequest.getParameter("folder"));
    newFolder.mkdir();
    response.sendRedirect("lister.jsp?path="+uploadpath);
}
%>

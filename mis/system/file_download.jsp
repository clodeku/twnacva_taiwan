<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.tools.zip.ZipOutputStream"%>
<%@ page import="java.util.zip.ZipInputStream"%>
<%@ page import="java.util.zip.ZipEntry"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%!
private static void copyfile(String srFile, String dtFile) {
	try {
		File f1 = new File(srFile);
		File f2 = new File(dtFile);
		InputStream in = new FileInputStream(f1);

		//For Append the file.
		//OutputStream out = new FileOutputStream(f2,true);

		//For Overwrite the file.
		OutputStream out = new FileOutputStream(f2);

		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0) {
			out.write(buf, 0, len);
		}
		in.close();
		out.close();
		//System.out.println("File copied.");
	} catch (FileNotFoundException ex) {
		System.out
				.println(ex.getMessage() + " in the specified directory.");
		System.exit(0);
	} catch (IOException e) {
		System.out.println(e.getMessage());
	}
}
public void zip(String inputFileName) throws Exception {
    String zipFileName = inputFileName+"/web_file.zip"; //打包后文件名字
    //System.out.println(zipFileName);
    zip(zipFileName, new File(inputFileName+"/web_file"));
}

private void zip(String zipFileName, File inputFile) throws Exception {
    ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));
    zip(out, inputFile, "");
    //System.out.println("zip done");
    out.close();
}

private void zip(ZipOutputStream out, File f, String base) throws Exception {
    if (f.isDirectory()) {
       File[] fl = f.listFiles();
       out.putNextEntry(new org.apache.tools.zip.ZipEntry(base + "/"));
       base = base.length() == 0 ? "" : base + "/";
       for (int i = 0; i < fl.length; i++) {
       zip(out, fl[i], base + fl[i].getName());
     }
    }else {
       out.putNextEntry(new org.apache.tools.zip.ZipEntry(base));
       FileInputStream in = new FileInputStream(f);
       int b;
       //System.out.println(base);
       while ( (b = in.read()) != -1) {
        out.write(b);
     }
     in.close();
   }
}
%>
<%
File folder_name = new File(application.getRealPath("/")+"uploads/root/web_file");
folder_name.mkdir();
folder_name = new File(application.getRealPath("/")+"uploads/root/web_file/web_image");
folder_name.mkdir();
folder_name = new File(application.getRealPath("/")+"uploads/root/web_file/mis_image");
folder_name.mkdir();
folder_name = new File(application.getRealPath("/")+"uploads/root/web_file/css");
folder_name.mkdir();

copyfile(application.getRealPath("/")+"web/css/style.css",application.getRealPath("/")+"uploads/root/web_file/css/style.css");
copyfile(application.getRealPath("/")+"web/images/favicon.png",application.getRealPath("/")+"uploads/root/web_file/web_image/favicon.png");
copyfile(application.getRealPath("/")+"web/images/icon-72.png",application.getRealPath("/")+"uploads/root/web_file/web_image/icon-72.png");
copyfile(application.getRealPath("/")+"web/images/icon.png",application.getRealPath("/")+"uploads/root/web_file/web_image/icon.png");
copyfile(application.getRealPath("/")+"web/images/icon@2.png",application.getRealPath("/")+"uploads/root/web_file/web_image/icon@2.png");
copyfile(application.getRealPath("/")+"web/images/logo.png",application.getRealPath("/")+"uploads/root/web_file/web_image/logo.png");
copyfile(application.getRealPath("/")+"mis/images/bg.jpg",application.getRealPath("/")+"uploads/root/web_file/mis_image/bg.jpg");
copyfile(application.getRealPath("/")+"mis/images/logo_01.gif",application.getRealPath("/")+"uploads/root/web_file/mis_image/logo_01.gif");
zip(application.getRealPath("/")+"uploads/root");
out.write("<script>location.href='"+app_fetchpath+"/root/web_file.zip"+"';</script>");
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
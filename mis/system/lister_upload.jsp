<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%@page import="java.net.URLEncoder"%>
<%
//String pd_code = StringTool.validString(request.getParameter("pd_code"));	// 識別碼
//String db_names = tblpd; 													// 使用哪張資料表
Integer fSize = 1; // 設定圖檔上傳 MB 數
String path = StringTool.validString(request.getParameter("path"));
/*
//Conditions.
String qposition = StringTool.validString(request.getParameter("_qposition"));
String qname = StringTool.validString(request.getParameter("_qname"));

//Names and values.
String[] names = new String[] { "npage", "_qposition", "_qname" };
String[] values = new String[] { String.valueOf(pageno), qposition, qname};
*/
//
try{
	String code = StringTool.validString(request.getParameter("code"));//A:新增,M:修改,D:刪除,S:排序
	//String pd_id = StringTool.validString(request.getParameter("pd_id"));

	//---//
	//檔案路徑與設置
	String dir = application.getRealPath("/") +path;
	DiskFileUpload fu = new DiskFileUpload();
	fu.setHeaderEncoding("UTF-8");//亂碼關鍵(1)
	fu.setSizeMax(1024*1024*10); //設置文件大小
	fu.setSizeThreshold(4*1024); //設置緩衝大小
	//fu.setRepositoryPath(application.getRealPath("/") + "uploads/temp");  //設置臨時目錄
	//fu.setRepositoryPath(dir); //設置臨時目錄     
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();
	//---//
	//--------------------------------------------------------------//

	//---//
 	if("A".equals(code)){//新增
		int count_file=0;//計算處理多少個相片檔案(批次)
		
		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (!fi.isFormField()){  //處理文件
				count_file++; // 計算處理多少個檔案(批次)
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if(g<0){
	                fileName = fi.getName();//兼容非ie
	                fileName_1 = fi.getName();
	            }
	            else{
	                fileName = fi.getName().substring(g);//取得上傳文件名
	                fileName_1 = fileName.substring(1,fileName.length());
	            }
				if((fSize * 1024 * 1024) < fi.getSize() && "pd_image".equals(fi.getFieldName())){
					out.println("<script> alert('上傳檔案不可超過"+String.valueOf(fSize)+"MB'); history.back(); </script>");return;
				}
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					//if(chk_str.getBytes().length != new String(chk_str).length()){
					//	out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");return;
					//}
						fi.write(new File(dir, fileName_1 ));
				}
				
			}
		}
		/*
		pc.setValue("pd_code", pd_code);	// 識別碼
		pc.setValue("pd_lang", lang);		// 語系
		app_sm.insert(pc);		
		out.println("<script> alert('新增成功!!');location='"+pd_code+".jsp'; </script>");*/
		response.sendRedirect("lister.jsp?path="+ URLEncoder.encode(path,"UTF-8"));
		//response.sendRedirect("lister.jsp?path="+ URLEncoder.encode( uploadpath+"/"+folder,"UTF-8")  );
	}
}catch(Exception e){
	System.out.println("Project:" + projectName + ", Error info:["+e+"]File name edit.jsp for [test]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
	// 頁面識別碼
	String page_code = "course";
	String action = StringTool.validString(request.getParameter("action"));
	String ai_id = StringTool.validString(request.getParameter("ai_id"));

	try{
		// 檔案路徑與設置
		String dir = app_uploadpath+"/"+page_code+"/"+lang+"/";
		
		File f_dir = new File(dir);
		if(!f_dir.exists()) f_dir.mkdirs();
		
		DiskFileUpload fu = new DiskFileUpload();
		fu.setHeaderEncoding("UTF-8");				// 亂碼關鍵(1)
		//fu.setSizeMax(4194304); 						// 設置文件大小
		//fu.setSizeThreshold(4096); 					// 設置緩衝大小
		//fu.setRepositoryPath(dir); 					// 設置臨時目錄
		List fileItems = fu.parseRequest(request);
		Iterator i = fileItems.iterator();	
		
		
		// 報名
		if("apply".equals(action)){
			TableRecord aa = new TableRecord(tblaa);
			TableRecord rs = new TableRecord(tblrs);	// 紀錄收據資料用
			String aa_identity = "";
			//---------------------檔案上傳-----------------------------------------------
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				// 這是用來確定是否為文件屬性
				if (fi.isFormField()) {
					String fieldName = new String(fi.getFieldName()); 		// 取得表單名
					String fieldvalue = new String(fi.getString("UTF-8")); 	// 取得值
					// System.out.println("fieldName = " + fieldName + ", fieldvalue = " + fieldvalue);		// Debug用
					
					if("ind".equals(fieldName)) {
						// 檢核圖形驗証碼
						String r = StringTool.validString((String) session.getAttribute("rand"));
						String ind = fieldvalue;
						if((!r.equals(ind))||("".equals(r))) {
							out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
							return;
						}					
					}
					
					if(fieldName.startsWith("aa_")){
						if("aa_identity".equals(fieldName)){
							aa_identity = fieldvalue.trim();
						}

						aa.setValue(fieldName, fieldvalue.trim());
					} else if(fieldName.startsWith("rs_")){		// 收據資料紀錄紀錄
						rs.setValue(fieldName, fieldvalue.trim());
					}
				// 處理文件
				} else {
					int g = fi.getName().lastIndexOf("\\");
					String fileName = fi.getName();
					String fileName_1 = "";
					if(g < 0) {
						fileName = fi.getName();							// 兼容非ie
						fileName_1 = fi.getName();
					} else {
						fileName = fi.getName().substring(g);				// 取得上傳文件名
						fileName_1 = fileName.substring(1,fileName.length());
					}
					if (fileName != null && !"".equals(fileName)) {
						String chk_str = fileName;

						fi.write(new File(dir, fileName_1));
						aa.setValue(fi.getFieldName(), fileName_1);			// 設定圖
					}
				}
			}

			
			// 是否為會員：填入會員資料
			if("Y".equals(aa_identity)){
				// 以填入的姓名 & 電話做判斷
				TableRecord mp = app_sm.select(tblmp, "mp_name=? and mp_phone=?",
						new Object[]{aa.getString("aa_name"), aa.getString("aa_phone")});
				
				if(!"".equals(mp.getString("mp_id"))) {
					aa.setValue("mp_id", mp.getString("mp_id"));
					rs.setValue("mp_id", mp.getString("mp_id"));
				} else {	// 無會員資料
					aa.setValue("aa_identity", "N");
				}
			}

			aa.setValue("ai_id", ai_id);
			aa.setValue("aa_no", IDTool.getUID("course", DateTimeTool.dateString(""), 4));
			aa.setValue("aa_status", "Y");
			aa.setValue("aa_code", page_code);
			aa.setInsert("Web_User");
			app_sm.insert(aa);

			// 收據資料紀錄
			rs.setValue("aa_id", aa.getString("aa_id"));
			rs.setValue("rs_type", "course");
			rs.setValue("rs_price", aa.getString("aa_cost"));
			rs.setValue("rs_pay", aa.getString("aa_collect"));
			rs.setValue("rs_code", "receipt");
			rs.setInsert("Web_User");
			app_sm.insert(rs);
			
			// 活動報名狀態確認與更新
			TableRecord ai = app_sm.select(tblai, ai_id);
			Vector<TableRecord> aas = app_sm.selectAll(tblaa, "ai_id=?", new Object[]{ai_id});	// 本活動所有的報名紀錄
						
			if(aas.size() == ai.getInt("ai_num")){
				ai.setValue("ai_status", "N");
				ai.setUpdate("WebUser");
				app_sm.update(ai);
			}
			
			out.println("<script> location='course_apply_sendmail.jsp?aa_id="+aa.getString("aa_id")+"&action=apply&lang="+lang+"'; </script>");		
			return;
		}

	} catch (Exception e) {
		System.out.println("Error info:[" + e + "]File name edit.jsp for [" + page_code + "]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('"+alert_str.get("system_bug."+lang)+"'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>
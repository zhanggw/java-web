package org.zhanggw.servlet.filter;

import java.util.Iterator;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFileServlet extends HttpServlet {
	
	private static final long serialVersionUID = -4040783254239794474L;
	
	private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		if(!ServletFileUpload.isMultipartContent(req)) {
			PrintWriter writer = resp.getWriter();
			writer.write("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return;
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory(DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD, new File(System.getProperty("java.io.tmpdir")));
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		
		String uploadPath = getServletContext().getRealPath("./") + "upload";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		try {
			List<FileItem> items = upload.parseRequest(req);
			if(items != null && items.size() > 0) {
				Iterator<FileItem> itr = items.iterator();
				while(itr.hasNext()) {
					FileItem item = itr.next();
					if(!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						System.out.println(filePath);
						item.write(storeFile);
						req.setAttribute("message", "upload_success");
					}
				}
			}
			
		} catch (Exception e) {
			req.setAttribute("message", e.getMessage());
		}
		
		try {
			getServletContext().getRequestDispatcher("/jsp/message.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		this.doGet(req, resp);
	}
}

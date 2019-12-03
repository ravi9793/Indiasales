package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import imagebank.ImageBank;
import imagebank.ImageBankhandler;


@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 25 * 1024 * 1024)
@WebServlet(urlPatterns = "/uploadFile")
public class UploadFile  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

     System.out.println("upload File");
     
     Part p=req.getPart("myfile");
     
     System.out.println(p);
     
     System.out.println(p.getName());
     
     System.out.println(p.getSize());
     
     System.out.println(p.getSubmittedFileName());
     
     System.out.println(req.getRealPath("/"));
     String currPath=req.getRealPath("/");
     FileOutputStream fos=new FileOutputStream(currPath+"/"+p.getSubmittedFileName());
     
     byte[] b=new byte[(int)p.getSize()];
     
     p.getInputStream().read(b)	;
     
     fos.write(b);
     
     fos.close();
     
     Cloudinary cloudinary=new Cloudinary(ObjectUtils.asMap(
    		 					"cloud_name","raviprakashprajapti",
    		 					"api_key","297272165638669",
    		 					"api_secret","tmwIWDREvb33yTmHWYL89Ufr2ek"));
     
     File file=new File(currPath+"/"+p.getSubmittedFileName());
     
     Map uploadResult=cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
     
     System.out.println(uploadResult.get("secure_url"));
     
     ImageBankhandler ibh = new ImageBankhandler();
		
		ibh.insert(new ImageBank(uploadResult.get("secure_url").toString()));

     
     resp.sendRedirect("ViewImageBank.jsp");
     
	}
	
	

}

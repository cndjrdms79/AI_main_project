package com.gop.stork.controllers;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class watershedController {
	@RequestMapping("/watershed.do")
	public String watershedupload(MultipartFile[] watershedupload, HttpServletRequest request) {
		
		// 파일이 업로드 될 경로 설정 
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/watershed/");
		
		// 위에 설정한 경로의 폴더가 없을 경우 생성 	
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// file upload 
		for(MultipartFile f : watershedupload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장 
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				// 파일 이름 변경 
				UUID uid = UUID.randomUUID();
				String reName = uid.toString() + ext;
				
				// 변수 지정
				String path = "/resources/upload/watershed/" + reName;
						
				// 파일 저장 
				try {
					f.transferTo(new File(saveDir + reName));
					request.setAttribute("path", path);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}	
		return "forward:cropper" ;
	}
	
	@RequestMapping("/cropper.do")
	   @ResponseBody
	   public String imsi(@RequestParam("image") MultipartFile blob,  HttpServletRequest request) {
	      // 파일이 업로드 될 경로 설정 
	      String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/watershed/");
	      // 위에 설정한 경로의 폴더가 없을 경우 생성 
	      File dir = new File(saveDir);
	      if(!dir.exists()) {
	         dir.mkdirs();
	      }
	      String reName = null;
	      if(!blob.isEmpty()) {
	         // 파일 이름 설정 
	         UUID uid = UUID.randomUUID();
	         reName = uid.toString() + ".png";
	         
	         try {
	            blob.transferTo(new File(saveDir + reName));
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      URL url = null;
	      try {
	         url = new URL("http://127.0.0.1:5000/watershedfile");
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      }
	      
	      HttpURLConnection httpConn = null;

	      try {
	         httpConn = (HttpURLConnection) url.openConnection();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      final String boundary = "*****";
	       final String crlf = "\r\n";
	       final String twoHyphens = "--";

	      httpConn.setUseCaches(false);
	      httpConn.setDoOutput(true);
	      httpConn.setDoInput(true);
	      try {
	         httpConn.setRequestMethod("POST");
	      } catch (ProtocolException e) {
	         e.printStackTrace();
	      }
	      httpConn.setRequestProperty("Connection", "Keep-Alive");
	      httpConn.setRequestProperty("Cache-Control", "no-cache");
	      httpConn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
	      
	      OutputStream httpConnOutputStream = null;
	      try {
	         httpConnOutputStream = httpConn.getOutputStream();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      DataOutputStream request1 = new DataOutputStream(httpConnOutputStream);
	      
	      //File to binary
	      File file = new File(saveDir + reName);
	      String out = new String();
	      FileInputStream fis = null;
	      ByteArrayOutputStream baos = new ByteArrayOutputStream();
	      byte[] bytes = null;
	          
	          try {                         
	             fis = new FileInputStream(file);   // 파일객체를 FileInputStream으로 생성한다.
	          } catch (FileNotFoundException e) {
	              System.out.println("Exception position : FileUtil - fileToString(File file)");
	          }
	       
	          int len = 0;
	          byte[] buf = new byte[1024];
	          try {
	              while ((len = fis.read(buf)) != -1) {         //FileInputStream을 ByteArrayOutputStream에 쓴다.
	                  baos.write(buf, 0, len);
	              }
	              bytes = baos.toByteArray();         //ByteArrayOutputStream 를 ByteArray 로 캐스팅한다.

	              fis.close();
	              baos.close();
	          } catch (IOException e) {
	              System.out.println("Exception position : FileUtil - fileToString(File file)");
	          }
	          
	      try {
	         request1.writeBytes(twoHyphens + boundary + crlf);
	         request1.writeBytes("Content-Disposition: form-data; name=\"edit\";filename=\""+ reName + crlf);
	         request1.writeBytes("Content-Type: image/png" + crlf);
	         request1.writeBytes(crlf);
	         request1.write(bytes);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      try {
	         request1.writeBytes(crlf);
	         request1.writeBytes(twoHyphens + boundary + twoHyphens + crlf);
	         request1.flush();
	         request1.close();
	         int status = httpConn.getResponseCode();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }

	      return "main";
	   }
}

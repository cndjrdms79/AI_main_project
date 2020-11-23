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
public class inpaintingController {
	@RequestMapping("/inpainting.do")
	public String inpaintingupload(MultipartFile[] inpaintingupload, HttpServletRequest request) {
		
		// 파일이 업로드 될 경로 설정 
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/inpainting/");
		
		// 위에 설정한 경로의 폴더가 없을 경우 생성 	
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// file upload 
		for(MultipartFile f : inpaintingupload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장 
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				// 파일 이름 변경 
				UUID uid = UUID.randomUUID();
				String reName = uid.toString() + ext;
				
				// 변수 지정
				String path = "/resources/upload/inpainting/" +reName;
						
				// 파일 저장 
				try {
					f.transferTo(new File(saveDir + reName));
					request.setAttribute("path", path);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}	
		return "forward:masking" ;
	}
	
	@RequestMapping("/masking.do")
	   @ResponseBody
	   public String imsi(@RequestParam("image1") String imagename, @RequestParam("image2") MultipartFile blob,  HttpServletRequest request) {
	      // 파일이 업로드 될 경로 설정 
	      String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/inpainting/");
	      String mask = imagename.replace("/resources/upload/inpainting/","");
	      	      
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
	         url = new URL("http://127.0.0.1:5000/inpaintingfile");
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
	      File plain = new File(saveDir + mask);
	      File file = new File(saveDir + reName);
	      System.out.println(file.length());
	      
	      String out = new String();
	      FileInputStream fis1 = null;
	      FileInputStream fis2 = null;
	      ByteArrayOutputStream baos1 = new ByteArrayOutputStream();
	      ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
	      byte[] bytes1 = null;
	      byte[] bytes2 = null;
	          
	          try {                         
	             fis1 = new FileInputStream(plain);
	             fis2 = new FileInputStream(file);   // 파일객체를 FileInputStream으로 생성한다.
	             System.out.println(fis2);
	          } catch (FileNotFoundException e) {
	              System.out.println("Exception position : FileUtil - fileToString(File file)");
	          }
	       
	          int len1 = 0;
	          int len2 = 0;
	          byte[] buf = new byte[1024];
	          try {
	              while ((len1 = fis1.read(buf)) != -1) {         //FileInputStream을 ByteArrayOutputStream에 쓴다.
	                  baos1.write(buf, 0, len1);
	              }
	       
	              bytes1 = baos1.toByteArray();         //ByteArrayOutputStream 를 ByteArray 로 캐스팅한다.

	              fis1.close();
	              baos1.close();
	              
	              
	              while ((len2 = fis2.read(buf)) != -1) {         //FileInputStream을 ByteArrayOutputStream에 쓴다.
	                  baos2.write(buf, 0, len2);
	              }
	              bytes2 = baos2.toByteArray();         //ByteArrayOutputStream 를 ByteArray 로 캐스팅한다.
	              System.out.println(bytes2.length);

	              fis2.close();
	              baos2.close();
	          } catch (IOException e) {
	              System.out.println("Exception position : FileUtil - fileToString(File file)");
	          }
	          
	      try {
	         request1.writeBytes(twoHyphens + boundary + crlf);
	         request1.writeBytes("Content-Disposition: form-data; name=\"origin\";filename=\""+ mask + crlf);
	         request1.writeBytes("Content-Type: image/jpeg" + crlf);
	         request1.writeBytes(crlf);
	         request1.write(bytes1);
	         request1.writeBytes(crlf);
	         request1.writeBytes(twoHyphens + boundary + crlf);
	         request1.writeBytes("Content-Disposition: form-data; name=\"edit\";filename=\""+ reName + crlf);
	         request1.writeBytes("Content-Type: image/png" + crlf);
	         request1.writeBytes(crlf);
	         request1.write(bytes2);
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

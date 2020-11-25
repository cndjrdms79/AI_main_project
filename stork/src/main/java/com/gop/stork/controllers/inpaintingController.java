package com.gop.stork.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
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
	   public String inpaintingfile(@RequestParam("image") MultipartFile blob,  HttpServletRequest request, HttpServletResponse response) {
	      // 파일이 업로드 될 경로 설정 
	      String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/inpainting/");
	      	      
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
	      File file = new File(saveDir + reName);
	      
	      String out = new String();
	      FileInputStream fis = null;
	      ByteArrayOutputStream baos = new ByteArrayOutputStream();
	      byte[] bytes = null;
	          
	          try {                         
	             fis = new FileInputStream(file);
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
	   // 이미지 받기
			InputStream responseStream = null;
			try {
				responseStream = new BufferedInputStream(httpConn.getInputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}

			BufferedReader responseStreamReader = new BufferedReader(new InputStreamReader(responseStream));
			String line = "";
			StringBuilder stringBuilder = new StringBuilder();
			try {
				while ((line = responseStreamReader.readLine()) != null) {
					stringBuilder.append(line).append("\n");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				responseStreamReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			String strResponse = stringBuilder.toString();
			byte[] bytes1 = Base64.decodeBase64(strResponse);

			UUID uuid = UUID.randomUUID();
			String saveDirec = request.getSession().getServletContext().getRealPath("/resources/upload/Modify/");
			
			String resultimage = saveDirec + uuid + ".png";
			try {
				File lOutFile = new File(resultimage);
				FileOutputStream lFileOutputStream = new FileOutputStream(lOutFile);
				lFileOutputStream.write(bytes1);
				lFileOutputStream.close();
			} catch (Throwable e) {
				e.printStackTrace(System.out);
			}
			String resultname= uuid + ".png";
			
			
			return resultname;
	   }
}

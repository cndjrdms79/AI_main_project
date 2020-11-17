package com.gop.stork.controllers;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class fileController {
	@RequestMapping("/mosaic.do")
	public String mosaicupload(MultipartFile[] mosaicupload, HttpServletRequest request) {
		
		// 파일이 업로드 될 경로 설정 
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/mosaic/");
		
		// 위에 설정한 경로의 폴더가 없을 경우 생성 
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// file upload 
		for(MultipartFile f : mosaicupload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장 
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				// 파일 이름 변경 
				UUID uid = UUID.randomUUID();
				String reName = uid.toString() + ext;
				
				// 변수 지정
				String path = "/resources/upload/mosaic/" + reName;
						
				// 파일 저장 
				try {
					f.transferTo(new File(saveDir + reName));
					request.setAttribute("path", path);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "forward:cropper"; 
	}
	
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
		return "forward:paint" ;
	}
	
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
	
	// cropped image ajax
	@RequestMapping("/imsi")
	public String imsi(@RequestParam("file") MultipartFile blob, HttpServletRequest request) {
		// 파일이 업로드 될 경로 설정 
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/Modify/");
		
		// 위에 설정한 경로의 폴더가 없을 경우 생성 
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		System.out.println(blob.getContentType());
		if(!blob.isEmpty()) {
			// 파일 이름 설정 
			UUID uid = UUID.randomUUID();
			String reName = uid.toString() + ".png";
			
			try {
				blob.transferTo(new File(saveDir + reName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "main";
	}
	
	@RequestMapping(value="/masking.do", method=RequestMethod.POST)
    @ResponseBody
    public String simpleWithObject(Jamong jamong) {
        return jamong.getName().replace("data:image/png;base64,", "");
    }
}
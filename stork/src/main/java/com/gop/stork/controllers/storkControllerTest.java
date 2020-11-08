package com.gop.stork.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class storkControllerTest {

	@GetMapping({"", "/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/mosaic")
	public String mosaic() {
		return "mosaic";
	}
	
	@GetMapping("/inpainting")
	public String inpainting() {
		return "inpainting";
	}
	
	@GetMapping("/watershed")
	public String watershed() {
		return "watershed";
	}
	
	@GetMapping("/paint")
	public String paint() {
		return "paint";
	}
	
	@RequestMapping("/cropper")
	public String cropper(HttpServletRequest request) {
		request.getAttribute("path");
		return "cropper";
	}
	
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
}

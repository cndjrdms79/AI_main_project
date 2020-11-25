package com.gop.stork.controllers;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class storkController {

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
	
	@RequestMapping("/mosaic2")
	public String mosaic2() {
		return "mosaic2";
	}
	
	@GetMapping("/inpainting")
	public String inpainting() {
		return "inpainting";
	}
	
	@GetMapping("/watershed")
	public String watershed() {
		return "watershed";
	}
	
	@RequestMapping("/masking")
	public String masking() {
		return "masking";
	}
	
	@RequestMapping("/cropper")
	public String cropper() {
		return "cropper";
	}
	
	@RequestMapping("/mosaicresult")
	public String mosaicresult() {
		return "mosaicresult";
	}
	
	@RequestMapping("/inpaintingresult")
	public String inpaintingresult() {
		return "inpaintingresult";
	}
	
	@RequestMapping("/watershedresult")
	public String watershedresult() {
		return "watershedresult";
	}
}

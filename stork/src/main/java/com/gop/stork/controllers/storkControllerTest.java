package com.gop.stork.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}

package com.gop.stork.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class storkControllerTest {

	@GetMapping({"", "/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/mosaic")
	public String mosaic() {
		return "mosaic";
	}
	
}

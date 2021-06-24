package com.kh.klib.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	@RequestMapping("info.in")
	public String Info() {
		return "intro";
	}
}

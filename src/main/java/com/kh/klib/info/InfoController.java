package com.kh.klib.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	@RequestMapping("info.in")
	public String Info() {
		return "intro";
	}
	@RequestMapping("intro.in")
	public String Intro() {
		return "intro";
	}
	@RequestMapping("map.in")
	public String MapInfo() {
		return "mapinfo";
	}
	@RequestMapping("guide.in")
	public String Opguide() {
		return "opguide";
	}
}

package com.kh.klib.culture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CultureController {
	@RequestMapping("culture.cu")
	public String cultureListForm() {
		return "cultureList";
	}
}

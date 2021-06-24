package com.kh.klib.bkgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookGroupController {
	@RequestMapping("bkgroup.bg")
	public String bkgroupListForm() {
		return "bkGroupList";
	}
}

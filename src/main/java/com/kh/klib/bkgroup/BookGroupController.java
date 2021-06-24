package com.kh.klib.bkgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookGroupController {
	@RequestMapping("bkgroup.bg")
	public String bkgroupListForm() {
		return "bkGroupList";
	}
	
	@RequestMapping("bkgroupInsertForm.bg")
	public String bkgroupInsertForm() {
		return "bkGroupInsertForm";
	}
	
	@RequestMapping("bkgroupUpdateForm.bg")
	public String bkgroupUpdateForm() {
		return "bkGroupUpdateForm";
	}
	
	@RequestMapping("bkgroupMyPage.bg")
	public String bkgroupMyPage() {
		return "bkGroupMyPage";
	}
}

package com.kh.klib.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
	
	@RequestMapping("customer.cm")
	public String CustomerMain() {
		return "customerFAQ";
	}
	
	@RequestMapping("qna.cm")
	public String CustomerService() {
		return "customerService";
	}
	
}

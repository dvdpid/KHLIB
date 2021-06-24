package com.kh.klib.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {
	@RequestMapping("room.ro")
	public String roomMain() {
		return "roomMain";
				
	}
}

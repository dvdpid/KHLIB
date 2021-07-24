package com.kh.klib.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.main.model.service.MainPageService;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.model.vo.Room;

@Controller
public class MainController {
	
	@Autowired
	private MainPageService mpService;
	
	@ResponseBody
	@RequestMapping(value="room.mp", produces="application/json; charset=utf-8;")
	public String roomForm() {
		ArrayList<Room> rlist = mpService.selectrList();
		
		int allListCount = mpService.getAllListCount();
		int listCount = mpService.getlistCount();
		
		JSONArray arr = new JSONArray();
		for(Room r : rlist) {
			JSONObject obj = new JSONObject();
			obj.put("rNo", r.getrNo());
			obj.put("rStatus", r.getrStatus());
			
			arr.add(obj);
		}
		
		return arr.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="culture.mp", produces="application/json; charset=utf-8;")
	public String cultureForm() {
		ArrayList<Culture> clist = mpService.selectcList();
		
		for(int i = 0; i < clist.size(); i++) {
			String str = clist.get(i).getlDate();
			String text = str.replace('T', ' ');
			clist.get(i).setlDate(text);
		}
		
		JSONArray arr = new JSONArray();
		for(Culture c: clist) {
			JSONObject obj = new JSONObject();
			obj.put("cNo", c.getcNo());
			obj.put("cTitle", c.getcTitle());
			obj.put("cInstructor", c.getcInstructor());
			obj.put("cDate", c.getlDate());
			obj.put("cTime", c.getlTime());
			
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping("bk.mp")
	public void bkForm(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<BookGroup> bglist = mpService.selectbgList();
		
		response.setContentType("application/json; charset=utf-8");
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(bglist, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("notice.mp")
	public void noForm(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Notice> nList = mpService.selectNoticeList();

		response.setContentType("application/json; charset=utf-8");
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(nList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("book.mp")
	public void bookForm(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Books> bList = mpService.selectBookList();

		response.setContentType("application/json; charset=utf-8");
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(bList, response.getWriter());
	}
}

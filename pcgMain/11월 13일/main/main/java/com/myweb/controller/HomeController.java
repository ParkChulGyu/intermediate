package com.myweb.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.dto.MemberDTO;

@Controller
public class HomeController {

	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home() {	
		System.out.println("하위");
		return "index";
	}
}

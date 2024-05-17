package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {

		// 여기서 articles를 사용하여 필요한 작업을 수행합니다.
		/* model.addAttribute("articles", articles); */
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showMain2(Model model) {

		return "redirect:/usr/home/main";
	}
}
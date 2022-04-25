package com.skilldistillery.membertoken.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {
	
	@RequestMapping("account.do")
	public String account(HttpSession session) {
		if(session.getAttribute("user") == null) {
		return "redirect:login";
		}
		session.getAttribute("user");
		return "account";
	}
}

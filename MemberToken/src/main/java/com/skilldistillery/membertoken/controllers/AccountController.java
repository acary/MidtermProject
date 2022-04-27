package com.skilldistillery.membertoken.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AccountController {
	
	@RequestMapping("account.do")
	public String account(HttpSession session) {
		if(session.getAttribute("user") == null) {
		return "redirect:login.do";
		}
		session.getAttribute("user");
		session.removeAttribute("successMessage");
		return "user/account";
	}
}

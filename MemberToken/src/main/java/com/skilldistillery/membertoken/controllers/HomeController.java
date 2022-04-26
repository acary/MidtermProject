package com.skilldistillery.membertoken.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.membertoken.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", dao.findUserById(1));
		return "home";
	}
	
	
}
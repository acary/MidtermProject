package com.skilldistillery.membertoken.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping("login.do")
	public ModelAndView logIn(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("user") != null) {
			mv.setViewName("redirect:home.do");
		} else {
			mv.addObject("userCommandObject", new User());
			
			mv.setViewName("user/login");		
		}
		return mv;
	}



	@RequestMapping(path = "login.do", method= RequestMethod.POST )
	public String tryLogIn(User user, HttpSession session) {
			User u = dao.findUserByEmailAndPass(user.getEmail(), user.getPassword());
			
			if (u == null) {
				return "redirect:login.do";
			} 
			session.setAttribute("user", u);
			
			Business business = dao.findBusinessById(1);
			session.setAttribute("business", business);
			
			MemberToken mt = dao.findTokenById(1);
			session.setAttribute("token", mt);
			
			return "user/account";
	}

	@RequestMapping("logout.do") 
	public String logout (HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home.do";
	}
	
}

package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.MemberToken;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("DEBUG", dao.findById(1));
		return "home";
	}
	/*
	 * Token
	 */
	@RequestMapping(path = { "/all", "all.do" })
	public String index(Model model) {
		List<MemberToken> tkns = dao.findAllTokens();
		model.addAttribute("allTokens", tkns);
		return "allTokens";
	}

	@RequestMapping(path = "getToken.do")
	public String showToken(Integer tid, Model model) {
		tid = Integer.valueOf(tid);
		MemberToken tkn = dao.findTokenById(tid);
		model.addAttribute("tkn", tkn);
		return "showToken";
	}

	
	/*
	 * Business
	 */
	@RequestMapping(path = { "/allBusinesses", "allBusinesses.do" })
	public String indexBusiness(Model model) {
		List<Business> business = dao.findAllBusinesses();
		model.addAttribute("allBusinesses", business);
		return "allBusinesses";
	}

	@RequestMapping(path = "getBusiness.do")
	public String showBusiness(Integer bid, Model model) {
		bid = Integer.valueOf(bid);
		Business business = dao.findBusinessById(bid);
		model.addAttribute("business", business);
		return "showBusiness";
	}
}

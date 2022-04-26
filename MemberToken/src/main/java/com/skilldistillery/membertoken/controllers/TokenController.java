package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.CollectionDAO;
import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.entities.Collection;
import com.skilldistillery.membertoken.entities.MemberToken;

@Controller
public class TokenController {

	@Autowired
	private TokenDAO dao; 
	
	@Autowired
	private CollectionDAO collectionDao; 
	
	@RequestMapping(path = { "/all", "all.do" })
	public String index(Model model) {
		List<MemberToken> tkns = dao.findAllTokens();
		model.addAttribute("allTokens", tkns);
		return "token/allTokens";
	}
	
	@RequestMapping(path = "createToken.do", method = RequestMethod.GET)
	public String startCreateToken(Model model) {
		return "token/createToken";
	}

	@RequestMapping(path = "createToken.do", method = RequestMethod.POST)
	public String createToken(MemberToken token, Model model) {
		MemberToken newToken = dao.createToken(token);
		model.addAttribute("token", newToken);
		return "token/showToken";
	}

	@RequestMapping(path = "getToken.do")
	public String showToken(Integer tid, Model model) {
		tid = Integer.valueOf(tid);
		MemberToken tkn = dao.findTokenById(tid);
		model.addAttribute("token", tkn);
		return "token/showToken";
	}
	
	@RequestMapping(path = "updateToken.do", method = RequestMethod.GET)
	public String startUpdateToken(Integer tid, Model model) {
		MemberToken token = dao.findTokenById(tid);
		model.addAttribute("token", token);
		return "token/updateToken";
	}

	@RequestMapping(path = "updateToken.do", method = RequestMethod.POST)
	public String updateToken(int tid, String tokenImgUrl, MemberToken token, Model model) {
		MemberToken newToken = dao.findTokenById(tid);
		newToken.setTokenImgUrl(tokenImgUrl);
		token = dao.updateToken(tid, newToken);
		model.addAttribute("token", token);
		return "token/updateToken";
	}
	
	@RequestMapping(path = "viewToken.do")
	public String viewToken(Integer tid, Model model) {
		tid = Integer.valueOf(tid);
		MemberToken tkn = dao.findTokenById(tid);
		model.addAttribute("token", tkn);
		return "token/viewToken";
	}
}

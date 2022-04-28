package com.skilldistillery.membertoken.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.ActualItemDAO;
import com.skilldistillery.membertoken.data.ContentDAO;
import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.ActualItem;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class TokenController {

	@Autowired
	private TokenDAO dao;

	@Autowired
	private ContentDAO contentDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ActualItemDAO actualItemDao;

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
	public String createToken(Boolean original, MemberToken token, Model model) {
		token.setOriginal(original);
		ActualItem item = actualItemDao.findActualItemById(1);
		token.setActualItem(item);
		MemberToken newToken = dao.createToken(token);
		
		Content content = new Content();
		content.setMemberToken(newToken);
		contentDao.createContent(content);
		
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

	@RequestMapping(path = { "/viewTokens", "viewTokens.do" })
	public String viewTokens(Model model, HttpSession session) {
		List<MemberToken> tkns = dao.findAllTokens();
		MemberToken featured = tkns.get(0);
		tkns.remove(0);
		model.addAttribute("featured", featured);
		model.addAttribute("tokens", tkns);
		session.removeAttribute("successMessage");
		return "token/viewTokens";
	}

	@RequestMapping(path = "viewToken.do")
	public String viewToken(Integer tid, Model model, HttpSession session) {
		tid = Integer.valueOf(tid);
		MemberToken tkn = dao.findTokenById(tid);
		model.addAttribute("token", tkn);
		Content content = contentDao.findContentByToken(tkn);
		model.addAttribute("contentId", content.getId());
		model.addAttribute("accessCode", content.getAccessCode());
		String contentUrl = "getContent.do?cid=" + content.getId();
		model.addAttribute("contentUrl", contentUrl);
		model.addAttribute("contentTitle", content.getTitle());

		User user = (User) session.getAttribute("user");

		if (user != null) {
			user = userDao.findUserById(user.getId());

			List<Purchase> purchList = user.getPurchases();
			purchList.size();
			for (Purchase purchase : purchList) {
				if (purchase.getMemberToken().getTokenName().equals(tkn.getTokenName())) {
					session.setAttribute("hasPurchased", true);
					return "token/viewToken";

				}
			}

		}

		session.setAttribute("hasPurchased", false);
		return "token/viewToken";
	}
}

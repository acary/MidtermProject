package com.skilldistillery.membertoken.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class AccountController {

	@Autowired
	UserDAO dao;
	@Autowired
	TokenDAO tokenDao;

	@RequestMapping("account.do")
	public String account(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login.do";
		}
		session.getAttribute("user");
		session.removeAttribute("successMessage");
		return "user/account";
	}

	@RequestMapping(path = "createUserFavorite.do", method = RequestMethod.POST)
	public String userFavorite(int uid, Model model, int tid, HttpSession session) {
		User user = dao.findUserById(uid);
		MemberToken token = tokenDao.findTokenById(tid);
		token.addUser(user);
		user.addFavorite(token);
		dao.updateUser(uid, user);
		tokenDao.updateToken(tid, token);
		List<MemberToken> favorites = user.getFavorites();
		session.setAttribute("favorites", favorites);
		return "home";
	}
}

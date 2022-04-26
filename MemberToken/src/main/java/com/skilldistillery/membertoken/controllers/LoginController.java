package com.skilldistillery.membertoken.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.membertoken.data.BusinessDAO;
import com.skilldistillery.membertoken.data.ContentDAO;
import com.skilldistillery.membertoken.data.PurchaseDAO;
import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;

	@Autowired
	private BusinessDAO businessDao;

	@Autowired
	private ContentDAO contentDao;

	@Autowired
	private TokenDAO tokenDao;
	@Autowired
	private PurchaseDAO purchaseDao;

	@RequestMapping("login.do")
	public ModelAndView logIn(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.setViewName("redirect:home.do");
		} else {
			mv.addObject("userCommandObject", new User());

			mv.setViewName("user/login");
		}
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String tryLogIn(User user, HttpSession session) {
		User u = dao.findUserByEmailAndPass(user.getEmail(), user.getPassword());
		if (u == null) {
			return "redirect:login.do";
		}
		session.setAttribute("user", u);

		List<Business> businesses = businessDao.findBusinessByUserId(u);
		session.setAttribute("businesses", businesses);

		List<Purchase> purchases = purchaseDao.findPurchasesByUserId(u);
		session.setAttribute("purchases", purchases);

		MemberToken mt = tokenDao.findTokenById(1);
		session.setAttribute("token", mt);

		Content cr = contentDao.findContentById(1);
		session.setAttribute("contentItem", cr);

		return "redirect:account.do";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("businesses");
		return "redirect:home.do";
	}

}

package com.skilldistillery.membertoken.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.PurchaseDAO;
import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class PurchaseController {

	@Autowired
	private UserDAO dao;

	@Autowired
	private PurchaseDAO purchaseDao;

	@Autowired
	private TokenDAO tokenDao;

	@RequestMapping(path = { "/allPurchases", "allPurchases.do" })
	public String indexPurchases(Model model) {
		List<Purchase> purchases = purchaseDao.findAllPurchases();
		model.addAttribute("purchases", purchases);
		return "purchase/allPurchases";
	}

	@RequestMapping(path = "getPurchase.do")
	public String showPurchase(Integer pid, Model model) {
		pid = Integer.valueOf(pid);
		Purchase purchase = purchaseDao.findPurchasesById(pid);
		model.addAttribute("purchase", purchase);
		return "purchase/showPurchase";
	}

	@RequestMapping(path = "createPurchase.do", method = RequestMethod.GET)
	public String startCreatePurchase(Model model) {
		return "purchase/createPurchase";
	}

	@RequestMapping(path = "createPurchase.do", method = RequestMethod.POST)
	public String createPurchase(Purchase purchase, Model model) {
		Purchase newPurchase = purchaseDao.createPurchase(purchase);
		model.addAttribute("purchase", newPurchase);
		return "purchase/showPurchase";
	}

	@RequestMapping(path = "createUserPurchase.do", method = RequestMethod.POST)
	public String userPurchase(int uid, Model model, int tid, HttpSession session) {
		User user = dao.findUserById(uid);
		MemberToken token = tokenDao.findTokenById(tid);
		MemberToken newToken = new MemberToken();
		newToken.setTokenName(token.getTokenName());
		newToken.setTokenImgUrl(token.getTokenImgUrl());
		newToken.setPrice(token.getPrice());
		newToken.setCollection(token.getCollection());
		newToken.setActualItem(token.getActualItem());
		newToken.setDescription(token.getDescription());
		token.setTotalSupply(token.getTotalSupply()-1);
		newToken = tokenDao.createToken(newToken);
		
		
		LocalDateTime lt = LocalDateTime.now();
		purchaseDao.purchaseItem(user, newToken, lt);
		session.removeAttribute("purchases");
		
		List<Purchase> purchases = purchaseDao.findPurchasesByUserId(user);
		session.setAttribute("purchases", purchases);
		session.setAttribute("successMessage", "Your purchase was successful!");
		return "redirect:account.do";
	}

	@RequestMapping(path = "editRatingAndComment.do", method = RequestMethod.POST)
	public String editPurchaseRatingAndComment(int pid, Purchase purch, Model model) {
		model.addAttribute("purchase", purchaseDao.updatePurchase(pid, purch));

		return "purchase/showPurchase";
	}
}

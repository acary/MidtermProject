package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.Purchase;

@Controller
public class PurchaseController {

	@Autowired
	private UserDAO dao; 
	
	@RequestMapping(path = { "/allPurchases", "allPurchases.do" })
	public String indexPurchases(Model model) {
		List<Purchase> purchases = dao.findAllPurchases();
		model.addAttribute("purchases", purchases);
		return "purchase/allPurchases"; 
	}

	@RequestMapping(path = "getPurchase.do")
	public String showPurchase(Integer pid, Model model) {
		pid = Integer.valueOf(pid);
		Purchase purchase = dao.findPurchasesById(pid);
		model.addAttribute("purchase", purchase);
		return "purchase/showPurchase"; 
	}
	
	@RequestMapping(path = "createPurchase.do", method = RequestMethod.GET)
	public String startCreatePurchase(Model model) {
		return "purchase/createPurchase";
	}

	@RequestMapping(path = "createPurchase.do", method = RequestMethod.POST)
	public String createPurchase(Purchase purchase, Model model) {
		Purchase newPurchase = dao.createPurchase(purchase);
		model.addAttribute("purchase", newPurchase);
		return "purchase/showPurchase";
	}
}

package com.skilldistillery.membertoken.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.BusinessDAO;
import com.skilldistillery.membertoken.entities.Business;

@Controller
public class BusinessController {

	@Autowired
	private BusinessDAO dao;
	
	
	@RequestMapping(path = { "/allBusinesses", "allBusinesses.do" })
	public String indexBusiness(Model model) {
		List<Business> business = dao.findAllBusinesses();
		model.addAttribute("allBusinesses", business);
		return "business/allBusinesses";
	}

	@RequestMapping(path = "getBusiness.do")
	public String showBusiness(Integer bid, Model model, HttpSession session) {
		bid = Integer.valueOf(bid);
		Business business = dao.findBusinessById(bid);
		model.addAttribute("business", business);
		return "business/showBusiness";
	}
	
	@RequestMapping(path = "createBusiness.do", method = RequestMethod.GET)
	public String startCreateBusiness(Model model) {
		return "business/createBusiness";
	}

	@RequestMapping(path = "createBusiness.do", method = RequestMethod.POST)
	public String createBusiness(Business business, Model model) {
		Business newBusiness = dao.createBusiness(business);
		model.addAttribute("business", newBusiness);
		return "business/showBusiness";
	}
	
	@RequestMapping(path = "updateBusiness.do", method = RequestMethod.GET)
	public String startUpdateBusiness(Integer bid, Model model) {
		Business business = dao.findBusinessById(bid);
		model.addAttribute("business", business);
		return "business/updateBusiness";
	}

	@RequestMapping(path = "updateBusiness.do", method = RequestMethod.POST)
	public String updateBusiness(int bid, Business business, Model model) {
		model.addAttribute("business", dao.updateBusiness(bid, business));
		return "business/showBusiness";
	}
	
	@RequestMapping(path = "deleteBusiness.do", method = RequestMethod.GET)
	public String deleteBusiness(String bid, Model model) {
		Integer businessId = Integer.valueOf(bid);
		Business item = dao.findBusinessById(businessId);
		try {
			if (item != null) {
				dao.deleteBusiness(item.getId());
			}
			return "redirect:all";
		} catch (Exception e) {
			return "redirect:all";
		}
	}
}

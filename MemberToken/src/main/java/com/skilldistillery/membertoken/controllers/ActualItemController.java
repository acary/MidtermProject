package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.ActualItem;

@Controller
public class ActualItemController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = { "/allActualItem", "allActualItem.do" })
	public String indexActualItem(Model model) {
		List<ActualItem> actualItemList = dao.findAllActualItem();
		model.addAttribute("allActualItem", actualItemList);
		return "actualitem/allActualItem";
	}

	@RequestMapping(path = "getActualItem.do")
	public String showActualItem(Integer actualItemId, Model model) {
		actualItemId = Integer.valueOf(actualItemId);
		ActualItem actualItem = dao.findActualItemById(actualItemId);
		model.addAttribute("actualItem", actualItem);
		return "actualitem/showActualItem";
	}
	
	@RequestMapping(path = "createActualItem.do", method = RequestMethod.GET)
	public String startCreateActualItem(Model model) {
		return "actualitem/createActualItem";
	}

	@RequestMapping(path = "createActualItem.do", method = RequestMethod.POST)
	public String createActualItem(ActualItem actualItem, Model model) {
		ActualItem actualItemAdded = dao.createActualItem(actualItem);
		model.addAttribute("actualItem", actualItemAdded);
		return "actualitem/showActualItem";
	}
	
	@RequestMapping(path = "updateActualItem.do", method = RequestMethod.GET)
	public String startUpdateActualItem(Integer aid, Model model) {
		ActualItem item = dao.findActualItemById(aid);
		model.addAttribute("actualItem", item);
		return "actualitem/updateActualItem";
	}

	@RequestMapping(path = "updateActualItem.do", method = RequestMethod.POST)
	public String updateActualItem(String aid, String name, String uri, Model model) {
		Integer itemId = Integer.valueOf(aid);
		ActualItem item = dao.findActualItemById(itemId);
		item.setName(name);
		dao.updateActualItem(item);
		model.addAttribute("actualItem", item);
		return "actualitem/showActualItem";
	}
	
	@RequestMapping(path = "deleteActualItem.do", method = RequestMethod.GET)
	public String deleteActualItem(String aid, Model model) {
		Integer actualItemId = Integer.valueOf(aid);
		ActualItem item = dao.findActualItemById(actualItemId);
		if (item != null) {
			dao.deleteActualItem(item.getId());
		}
		return "redirect:all";
	}
}

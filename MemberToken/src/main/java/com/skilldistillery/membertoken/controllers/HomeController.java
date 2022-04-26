package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.membertoken.data.CollectionDAO;
import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.Collection;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private CollectionDAO collectionDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", dao.findUserById(1));
		
		List<Collection> colList = collectionDao.findAllCollection();
		Collection featuredCollection = colList.get(0);
		model.addAttribute("featuredCollection", featuredCollection);
		
		return "home";
	}
	
	
}
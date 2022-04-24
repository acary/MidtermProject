package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.ActualItem;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Collection;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.ContentResource;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", dao.findUserById(1));
		return "home";
	}
	
	/*
	 * Actual Item
	 */
	
	@RequestMapping(path = { "/allActualItem", "allActualItem.do" })
	public String indexActualItem(Model model) {
		List<ActualItem> actualItemList = dao.findAllActualItem();
		model.addAttribute("allActualItem", actualItemList);
		return "allActualItem";
	}

	@RequestMapping(path = "getActualItem.do")
	public String showActualItem(Integer actualItemId, Model model) {
		actualItemId = Integer.valueOf(actualItemId);
		ActualItem actualItem = dao.findActualItemById(actualItemId);
		model.addAttribute("actualItem", actualItem);
		return "showActualItem";
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

	/*
	 * Content
	 */
	
	@RequestMapping(path = { "/allContent", "allContent.do" })
	public String indexContent(Model model) {
		List<Content> content = dao.findAllContent();
		model.addAttribute("allContent", content);
		return "allContent";
	}

	@RequestMapping(path = "getContent.do")
	public String showContent(Integer cid, Model model) {
		cid = Integer.valueOf(cid);
		Content content = dao.findContentById(cid);
		model.addAttribute("content", content);
		return "showContent";
	}
	
	/*
	 * Content Resource
	 */
	
	@RequestMapping(path = { "/allContentResource", "allContentResource.do" })
	public String indexContentResource(Model model) {
		List<ContentResource> contentResourceList = dao.findAllContentResource();
		model.addAttribute("allContentResource", contentResourceList);
		return "allContentResource";
	}

	@RequestMapping(path = "getContentResource.do")
	public String showContentResource(Integer crId, Model model) {
		crId = Integer.valueOf(crId);
		ContentResource contentResource = dao.findContentResourceById(crId);
		model.addAttribute("contentResource", contentResource);
		return "showContentResource";
	}
	
	/*
	 * Collection
	 */
	
	@RequestMapping(path = { "/allCollection", "allCollection.do" })
	public String indexCollection(Model model) {
		List<Collection> colList = dao.findAllCollection();
		model.addAttribute("allCollection", colList);
		return "allCollection";
	}

	@RequestMapping(path = "getCollection.do")
	public String showCollection(Integer cid, Model model) {
		cid = Integer.valueOf(cid);
		Collection col = dao.findCollectionById(cid);
		model.addAttribute("collection", col);
		return "showCollection";
	}
	/*
	 * User
	 */
	@RequestMapping(path = { "/allUser", "allUser.do" })
	public String indexUsers(Model model) {
		List<User> users = dao.findAllUsers();
		model.addAttribute("users", users);
		return "allUsers";
	}

	@RequestMapping(path = "getUser.do")
	public String showUser(Integer uid, Model model) {
		uid = Integer.valueOf(uid);
		User user = dao.findUserById(uid);
		model.addAttribute("user", user);
		return "showUser";
	}
	
	
}
package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.ActualItem;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Collection;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.ContentResource;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
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

	/*
	 * Business
	 */
	
	@RequestMapping(path = { "/allBusinesses", "allBusinesses.do" })
	public String indexBusiness(Model model) {
		List<Business> business = dao.findAllBusinesses();
		model.addAttribute("allBusinesses", business);
		return "business/allBusinesses";
	}

	@RequestMapping(path = "getBusiness.do")
	public String showBusiness(Integer bid, Model model) {
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

	/*
	 * Content
	 */
	
	@RequestMapping(path = { "/allContent", "allContent.do" })
	public String indexContent(Model model) {
		List<Content> content = dao.findAllContent();
		model.addAttribute("allContent", content);
		return "content/allContent";
	}

	@RequestMapping(path = "getContent.do")
	public String showContent(Integer cid, Model model) {
		cid = Integer.valueOf(cid);
		Content content = dao.findContentById(cid);
		model.addAttribute("content", content);
		return "content/showContent";
	}
	
	@RequestMapping(path = "createContent.do", method = RequestMethod.GET)
	public String startContent(Model model) {
		return "content/createContent";
	}

	@RequestMapping(path = "createContent.do", method = RequestMethod.POST)
	public String createContent(Content content, Model model) {
		Content cont = dao.createContent(content);
		model.addAttribute("content", cont);
		return "content/showContent";
	}

	
	/*
	 * Content Resource
	 */
	
	@RequestMapping(path = { "/allContentResource", "allContentResource.do" })
	public String indexContentResource(Model model) {
		List<ContentResource> contentResourceList = dao.findAllContentResource();
		model.addAttribute("allContentResource", contentResourceList);
		return "contentresource/allContentResource";
	}

	@RequestMapping(path = "getContentResource.do")
	public String showContentResource(Integer crId, Model model) {
		crId = Integer.valueOf(crId);
		ContentResource contentResource = dao.findContentResourceById(crId);
		model.addAttribute("contentResource", contentResource);
		return "contentresource/showContentResource";
	}
	
	
	@RequestMapping(path = "createContentResource.do", method = RequestMethod.GET)
	public String startCreateContentResource(Model model) {
		return "contentresource/createContentResource";
	}

	@RequestMapping(path = "createContentResource.do", method = RequestMethod.POST)
	public String CreateContentResource(ContentResource contentResource, Model model) {
		ContentResource newContentResource = dao.createContentResource(contentResource);
		model.addAttribute("contentResource", newContentResource);
		return "contentresource/showContentResource";
	}
	
	
	
	/*
	 * Collection
	 */
	
	@RequestMapping(path = { "/allCollection", "allCollection.do" })
	public String indexCollection(Model model) {
		List<Collection> colList = dao.findAllCollection();
		model.addAttribute("allCollection", colList);
		return "collection/allCollection";
	}

	@RequestMapping(path = "getCollection.do")
	public String showCollection(Integer cid, Model model) {
		cid = Integer.valueOf(cid);
		Collection col = dao.findCollectionById(cid);
		model.addAttribute("collection", col);
		return "collection/showCollection";
	}
	
	@RequestMapping(path = "createCollection.do", method = RequestMethod.GET)
	public String startCreateCollection(Model model) {
		return "collection/createCollection";
	}

	@RequestMapping(path = "createCollection.do", method = RequestMethod.POST)
	public String createCollection(Collection collection, Model model) {
		Collection newCollection = dao.createCollection(collection);
		model.addAttribute("collection", newCollection);
		return "collection/showCollection";
	}
	
	/*
	 * Purchase
	 */
	
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
	
	/*
	 * Token
	 */
	
	@RequestMapping(path = { "/all", "all.do" })
	public String index(Model model) {
		List<MemberToken> tkns = dao.findAllTokens();
		model.addAttribute("allTokens", tkns);
		return "token/allTokens";
	}

	@RequestMapping(path = "getToken.do")
	public String showToken(Integer tid, Model model) {
		tid = Integer.valueOf(tid);
		MemberToken tkn = dao.findTokenById(tid);
		model.addAttribute("tkn", tkn);
		return "token/showToken";
	}
	
	/*
	 * User
	 */
	
	/*
	 * User
	 */
	@RequestMapping(path = { "/allUser", "allUser.do" })
	public String indexUsers(Model model) {
		List<User> users = dao.findAllUsers();
		model.addAttribute("users", users);
		return "user/allUsers";
	}
	
	@RequestMapping(path = "createUser.do", method = RequestMethod.GET)
	public String startCreateUser(Model model) {
		return "user/createUser";
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public String createUser(User user, Model model) {
		User newUser = dao.createUser(user);
		model.addAttribute("user", newUser);
		return "user/showUser";
	}
	
	@RequestMapping(path = { "addUser.do" })
	public String addUser( User user, RedirectAttributes redir) {
		user = dao.addUser(user);
		redir.addFlashAttribute("user",user);
		return "redirect:userAdded.do";
	}
	
	@RequestMapping(path = "getUser.do")
	public String showUser(Integer uid, Model model) {
		uid = Integer.valueOf(uid);
		User user = dao.findUserById(uid);
		model.addAttribute("user", user);
		return "user/showUser";
	}
	
	@RequestMapping(path = { "newUser.do" })
	public String toAddUserForm(Model model) {
		return "user/newUserForm";

	}

	@RequestMapping(path = { "userAdded.do" })
	public String userAdded( ) {
		return "user/login";
	}
	
}
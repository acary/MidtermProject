package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.CollectionDAO;
import com.skilldistillery.membertoken.entities.Collection;

@Controller
public class CollectionController {

	@Autowired
	private CollectionDAO dao;
	
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
	
	@RequestMapping(path = "updateCollection.do", method = RequestMethod.GET)
	public String startUpdateCollection(Integer cid, Model model) {
		Collection collection = dao.findCollectionById(cid);
		model.addAttribute("collection", collection);
		return "collection/updateCollection";
	}

	@RequestMapping(path = "updateCollection.do", method = RequestMethod.POST)
	public String updateCollection(int cid, String description, String imageUrl, Collection collection, Model model) {
		Collection newCollection = dao.findCollectionById(cid);
		newCollection.setDescription(description);;
		newCollection.setImageUrl(imageUrl);
		collection = dao.updateCollection(cid, newCollection);
		model.addAttribute("collection", collection);
		return "collection/showCollection";
	}
	
	@RequestMapping(path = { "/viewCollections", "viewCollections.do" })
	public String viewCollections(Model model) {
		List<Collection> colList = dao.findAllCollection();
		Collection featured = colList.get(0);
		colList.remove(0);
		model.addAttribute("featured", featured);
		model.addAttribute("collections", colList);
		return "collection/viewCollections";
	}

}
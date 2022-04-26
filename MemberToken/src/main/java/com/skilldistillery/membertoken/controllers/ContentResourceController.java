package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.ContentResource;

@Controller
public class ContentResourceController {

	@Autowired
	private UserDAO dao; 
	
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
	@RequestMapping(path = "updateContentResource.do", method = RequestMethod.GET)
	public String startUpdateContentResource(Integer cid, Model model) {
		ContentResource contentResource = dao.findContentResourceById(cid);
		model.addAttribute("contentResource", contentResource);
		return "contentresource/updateContentResource";
	}

	@RequestMapping(path = "updateContentResource.do", method = RequestMethod.POST)
	public String updateContentResource(int cid, ContentResource contentResource, Model model) {
		model.addAttribute("contentResource", dao.updateContentResource(cid, contentResource));
		return "contentresource/updateContentResource";
	}
}

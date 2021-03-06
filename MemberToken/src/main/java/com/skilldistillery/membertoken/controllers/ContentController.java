package com.skilldistillery.membertoken.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.membertoken.data.BusinessDAO;
import com.skilldistillery.membertoken.data.ContentDAO;
import com.skilldistillery.membertoken.data.TokenDAO;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.MemberToken;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAO dao;
	
	@Autowired
	private BusinessDAO businessDao;
	
	@Autowired
	private TokenDAO tokenDao; 
	
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
	@RequestMapping(path = "updateContent.do", method = RequestMethod.GET)
	public String startUpdateContent(Integer cid, Model model) {
		Content content = dao.findContentById(cid);
		model.addAttribute("content", content);
		return "content/updateContent";
	}

	@RequestMapping(path = "updateContent.do", method = RequestMethod.POST)
	public String updateContent(int cid, Content content, Model model) {
		model.addAttribute("content", dao.updateContent(cid, content));
		return "content/updateContent";
	}
	@RequestMapping(path = "deleteContent.do", method = RequestMethod.GET)
	public String deleteContent(String cid, Model model) {
		Integer contentId = Integer.valueOf(cid);
		Business item = businessDao.findBusinessById(contentId);
		try {
			if (item != null) {
				dao.deleteContent(item.getId());
			}
			return "redirect:all";
		} catch (Exception e) {
			return "redirect:all";
		}
	}
	
	@RequestMapping(path = "viewContent.do")
	public String viewContent(Integer cid, Model model) {
		cid = Integer.valueOf(cid);
		Content content = dao.findContentById(cid);
		model.addAttribute("content", content);
		
		MemberToken token = tokenDao.findTokenById(content.getMemberToken().getId());
		model.addAttribute("token", token);
		return "content/viewContent";
	}
}

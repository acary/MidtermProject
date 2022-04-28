package com.skilldistillery.membertoken.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.membertoken.data.UserDAO;
import com.skilldistillery.membertoken.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

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
	
	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public String updateUser(User user, int uid, HttpSession session) {
		session.setAttribute("user", dao.updateUser(uid, user));
		
		return "redirect:account.do";
	}
	
	
	
	
}

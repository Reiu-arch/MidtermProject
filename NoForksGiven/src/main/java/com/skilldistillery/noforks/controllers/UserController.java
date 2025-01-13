package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	// Result Page
	@RequestMapping(path = { "browseResults.do" })
	public String goBrowseResult(Model model) {
		return "browseResults";
	}
	
	@GetMapping("login.do")
	public String goToLogin(HttpSession session) {
		if(session.getAttribute("loggedInUser") == null) {
			return "login";
		}
		return "home";
	}
	
	@PostMapping("login.do")
	public String login(User user, HttpSession session) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());
	
		if(user!=null) {
			session.setAttribute("loggedInUser", user);
			return "account";
		}
		else {
		return "login";
		}
	}
	
	
	@RequestMapping(path="logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loggedInUser");
		
		return "home";
	}
	
	@GetMapping("account.do")
	public String goToAccount(HttpSession session) {
		if(session.getAttribute("loggedInUser") != null) {
			return "account";
		}
		else {
			return "login";
		}
	}
	
	@GetMapping(path="createaccount.do")
	public String goCreateAccount(Model model) {
		return "createaccount";
	}
	
	
	
	
	
	
	
	
	
	
}
	

	

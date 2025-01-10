package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.skilldistillery.noforks.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;

	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.authenticateUser("admin", "test"));
		return "home";
	}
	
}

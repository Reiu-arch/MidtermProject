package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.noforks.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;

}

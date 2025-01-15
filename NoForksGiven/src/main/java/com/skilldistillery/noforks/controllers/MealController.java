package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.noforks.data.MealDAO;
import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller 
class MealController {

	@Autowired
	private MealDAO mealDao;
	
	@Autowired
	private UserDAO userDao;
	
	
	
	@GetMapping(path = "createMeal.do")
	public String goCreateMeal(Model model) {
			return "createMeal";
	}
	
	@PostMapping(path = "createMeal.do")
	public String goCreateMeal(HttpSession session, Model model, Meal meal) {
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			Meal newMeal = mealDao.addMeal(meal, loggedInUser);
			model.addAttribute("meal", newMeal);
			return "redirect:account.do";
			
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", "An error occured while saving your recipe.");
				return "createMeal";
			}
	}
}

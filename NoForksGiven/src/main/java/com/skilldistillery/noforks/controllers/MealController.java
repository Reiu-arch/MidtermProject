package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.MealDAO;
import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.Recipe;
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
//			return "redirect:account.do";
			return "meal";
			
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", "An error occured while saving your recipe.");
				return "createMeal";
			}
	}
	
	@GetMapping(path = "meal.do")
	public String goMeal(User user, Model model) {
			return "meal";
	}
	
	@PostMapping(path = "addMeal.do")
	public String meal(HttpSession session, Model model, @RequestParam("mealId") int mealId,@RequestParam("recipeId") int recipeId ) {
		
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			Meal mealWithRecipe = mealDao.addRecipeToMeal(recipeId, mealId, loggedInUser);
			model.addAttribute("meal", mealWithRecipe);
			return "meal";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:account.do";
		}
	}
	
	@GetMapping(path = "deleteMeal.do")
	public String deleteMeal(HttpSession session, @RequestParam("mealId") int mealId) {
		User user = (User) session.getAttribute("loggedInUser");
		mealDao.deleteMealById(mealId, user);
		
		return "redirect:meal.do";
		
	}
	
}

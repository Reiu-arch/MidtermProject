package com.skilldistillery.noforks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
			return "redirect:account.do";
			
			
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", "An error occured while saving your meal.");
				return "createMeal";
			}
	}
	
	@RequestMapping(path = "showMeal.do")
	public String goMeal( Model model,@RequestParam("mealId") int mealId) {
		Meal meal = mealDao.findMealById(mealId);
		model.addAttribute("meal", meal);
		//add recipe
			return "meal";
	}
	

	@GetMapping(path = "viewallmeals.do")
	public String goAllMeals(User user, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		List<Meal> meals = mealDao.findAllMeals(loggedInUser.getId());
		model.addAttribute("mealList", meals);
		//add loggedUser to reference THEIR meals
			return "viewallmeals";
	}
	
	@PostMapping(path = "addMeal.do")
	public String addRecipeToMeal(HttpSession session, Model model, @RequestParam("mealId") int mealId,@RequestParam("recipeId") int recipeId ) {
		
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
	@PostMapping(path = "removeRecipe.do")
	public String remoeRecipe(HttpSession session, Model model, @RequestParam("mealId") int mealId,@RequestParam("recipeId") int recipeId ) {
		
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			Meal mealWithRecipe = mealDao.removeRecipeFromMeal(recipeId, mealId, loggedInUser);
			model.addAttribute("meal", mealWithRecipe);
			return "meal";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:updateMeal.do";
		}
	}
	
	@GetMapping(path = "deleteMeal.do")
	public String deleteMeal(HttpSession session, @RequestParam("mealId") int mealId) {
		User user = (User) session.getAttribute("loggedInUser");
		mealDao.deleteMealById(mealId, user);
		
		return "redirect:account.do";
		
	}
	
	@GetMapping(path = "updateMeal.do")
	public String showUpdateMeal(Model model, @RequestParam("mealId") int mealId) {
		Meal meal = mealDao.findMealById(mealId);
		model.addAttribute("meal", meal);
		return "updateMeal";
	}
	
	
	@PostMapping(path = "updateMeal.do")
	public String updateMeal(Model model, HttpSession session, Meal meal, @RequestParam("mealId") int mealId) {
		User user = (User) session.getAttribute("loggedInUser");
		Meal mealToUpdate = mealDao.editMeal(mealId, meal, user);
		model.addAttribute("meal", mealToUpdate);	
				
		return "redirect:showMeal.do?mealId=" + mealToUpdate.getId();
	}
	
	
	
}

package com.skilldistillery.noforks.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.RecipeDAO;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeDAO recipeDao;

	@GetMapping(path = "createrecipe.do")
	public String gocreaterecipe(Model model) {
		return "createrecipe";
	}
	
	@PostMapping(path = "createrecipe.do")
	public String createRecipe(Recipe recipe, Model model, HttpSession session) {
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			if (loggedInUser == null) {
				model.addAttribute("errorMessage", "You need to log in to create a recipe");
				return "login";
			} 
//			recipe.setUser(loggedInUser);
			recipe.setCreateDate(LocalDateTime.now());
			recipe.setLastUpdate(LocalDateTime.now());
			
			recipeDao.addRecipe(recipe, loggedInUser);
				
			model.addAttribute("sucessMessage", "Recipe created Successfully");
			return "redirect:browseResults.do";	
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "An error occured while saving your recipe.");
			return "createrecipe";
		}
	}
	
	@GetMapping(path = "Recipe.do")
	public String showRecipe(Model model, @RequestParam("recipeId") int recipeId) {
		Recipe recipe = recipeDao.findRecipeById(recipeId);
		model.addAttribute("recipe", recipe);
		return "Recipe";
	}
	
	
}

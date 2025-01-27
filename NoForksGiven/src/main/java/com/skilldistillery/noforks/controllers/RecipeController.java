package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.RecipeDAO;
import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeDAO recipeDao;
	
	@Autowired
	private UserDAO userDao;

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
	public String showRecipe(Model model, @RequestParam("recipeId") int recipeId, HttpSession session) {
		Recipe recipe = recipeDao.findRecipeById(recipeId);
		model.addAttribute("recipe", recipe);
		
		return "Recipe";
	}
	
	@GetMapping(path = "updateRecipe.do")
	public String showUpdateRecipe(Model model, @RequestParam("recipeId") int recipeId) {
		Recipe recipe = recipeDao.findRecipeById(recipeId);
		model.addAttribute("recipe", recipe);
		return "updateRecipe";
	}
	
	@PostMapping(path = "updateRecipe.do")
	public String updateRecipe(Model model, HttpSession session, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		Recipe recipeToUpdate = recipeDao.editByRecipeId(recipe.getId(), recipe, user);
		model.addAttribute("recipe", recipeToUpdate);	
				
		return "redirect:Recipe.do?recipeId=" + recipe.getId();
	}
	
	//we are able to get User from the session from the get attribute "SESSIONUSER"
	@GetMapping(path = "deleteRecipe.do")
	public String deleteRecipe(@RequestParam("recipeId") int recipeId, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		recipeDao.deleteByRecipeId(recipeId, user);	
		
		return "redirect:browseResults.do";
	}
	
	private void refreshLoggedInUser(HttpSession session) {
		User user = (User)session.getAttribute("loggedInUser");
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());
		session.setAttribute("loggedInUser", user);
	}
	
}

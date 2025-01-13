package com.skilldistillery.noforks.controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.noforks.data.RecipeDAO;
import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private RecipeDAO recipeDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	// Result Page
	@RequestMapping(path = { "browseResults.do" })
	public String goBrowseResult(Model model) {
		List<Recipe> recipeList = userDao.findAllRecipes();
		model.addAttribute("recipeList", recipeList);
		return "browseResults";
	} 

	@GetMapping("login.do")
	public String goToLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login";
		}
		return "home";
	}

	@PostMapping("login.do")
	public String login(User user, HttpSession session) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());

		if (user != null) {
			session.setAttribute("loggedInUser", user);
			return "account";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");

		return "home";
	}

	@GetMapping("account.do")
	public String goToAccount(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "account";
		} else {
			return "login";
		}
	}

	
	@GetMapping(path = "createaccount.do")
	public String gocreate(User user, Model model) {
			return "createaccount";
	}
	
	@PostMapping(path = "createaccount.do")
	public String goCreateAccount(User user, HttpSession session, Model model) {
		try {
			user.setCreateDate(LocalDateTime.now());
			user.setLastUpdate(LocalDateTime.now());
			user.setEnabled(true);
			userDao.addUser(user);
			
			user = userDao.authenticateUser(user.getUsername(), user.getPassword());
			
			if (user != null) {
				session.setAttribute("loggedInUser", user);
				return "account";
			} else {
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Error occured trying to create your account. Account name may already in use!");
			return "createaccount";
		}

	}
	@GetMapping(path = "createrecipe.do")
	public String gocreaterecipe(User user, Model model) {
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
			
			recipeDao.addRecipe(recipe);
				
			model.addAttribute("sucessMessage", "Recipe created Successfully");
			return "browseResults";	
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "An error occured while saving your recipe.");
			return "createRecipe";
		}
	}
	
	
	
	
}
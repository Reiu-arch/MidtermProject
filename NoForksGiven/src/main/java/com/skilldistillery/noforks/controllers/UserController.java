package com.skilldistillery.noforks.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.UserDAO;
import com.skilldistillery.noforks.entities.Recipe;
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
	@GetMapping(path = { "/error" })
	public String error(Model model) {
		return "error";
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
	public String login(User user, HttpSession session, Model model) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());

		try {
			if (user != null) {
				session.setAttribute("loggedInUser", user);
				return "account";
			} else {
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginErrorMessage", "Error occured trying to get in the main frame! Account does not exist or may be disabled.");
			return "createaccount";
		}
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");

		return "home";
	}
	@RequestMapping(path = "goodbye.do")
	public String deleteLogout(HttpSession session) {
		
		session.removeAttribute("loggedInUser");
		
		return "goodbye";
	}

	@GetMapping("account.do")
	public String goToAccount(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			refreshLoggedInUser(session);
			
			return "account";
		} else {
			return "login";
		}
	}

	private void refreshLoggedInUser(HttpSession session) {
		User user = (User)session.getAttribute("loggedInUser");
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());
		session.setAttribute("loggedInUser", user);
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
			model.addAttribute("errorMessage", "Error occured trying to create your account. Account name may already be in use!");
			return "createaccount";
		}

	}
	
	@GetMapping(path = "deleteAccount.do")
	public String deleteRecipe(@RequestParam("userId") int userId, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		userDao.deleteByUserId(userId, user);	
		
		return "redirect:goodbye.do";
	}
	
	@GetMapping(path = "updateAccount.do")
	public String goUpdateAccount(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login";
		}
		return "updateaccount";
	}
	
	@PostMapping(path = "updateAccount.do")
	public String updateAccount( HttpSession session, User user) {
		session.setAttribute("loggedInUser", user);
		User sessionUser = (User) session.getAttribute("loggedInUser");
		if (sessionUser == null) {
			return "login";
		}
		
		userDao.editUser(sessionUser);
				
		return "redirect:account.do";
	}
	@GetMapping(path = { "findRecipe.do" })
	public String searchRecipeByKeyword(@RequestParam(name = "keyword", required = true, defaultValue = "") String keyword, Model model) {
	    if (keyword.trim().isEmpty()) {
	        return "redirect:browseResults.do";
	    }
	    List<Recipe> recipes = userDao.findRecipeByKeyword(keyword);
	    model.addAttribute("recipeList", recipes);
	    model.addAttribute("keyword", keyword);
	    return "browseResults";
	}
}
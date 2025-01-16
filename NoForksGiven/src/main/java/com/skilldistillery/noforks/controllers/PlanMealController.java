package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.noforks.data.PlanMealDAO;
import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.PlanMeal;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

public class PlanMealController {

	@Autowired
	private PlanMealDAO planMealDao;
	
	
	@GetMapping(path = "createPlanMeal.do")
	public String goPlanMeal(Model model) {
			return "createPlanMeal";
	}	
	
	@PostMapping(path = "createMeal.do")
	public String goCreateMeal(HttpSession session, Model model, PlanMeal planMeal, Plan plan) {
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			PlanMeal newPlanMeal = planMealDao.addPlanMeal(planMeal, plan);
			model.addAttribute("planMeal", newPlanMeal);
			return "redirect:account.do";
			}catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", "An error occured while creating your planmeal.");
				return "createPlanMeal";
			}
	}
	
}

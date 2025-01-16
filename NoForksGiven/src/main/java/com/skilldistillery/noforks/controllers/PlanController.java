package com.skilldistillery.noforks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.MealDAO;
import com.skilldistillery.noforks.data.PlanDAO;
import com.skilldistillery.noforks.data.PlanMealDAO;
import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.PlanMeal;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDAO planDao;
	
	@Autowired
	private MealDAO mealDao;
	
	@Autowired
	private PlanMealDAO planMealDao;

	@GetMapping(path = "createPlan.do")
	public String gocreateplan(Model model) {
		return "createPlan";
	}
	
	@PostMapping(path = "createPlan.do")
	public String createPlan(HttpSession session, Plan plan, Model model) {
		try {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			Plan newPlan = planDao.addPlan(plan, loggedInUser);
			model.addAttribute("plan", newPlan);
			return "redirect:account.do";
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", "An error occured while creating your plan.");
				return "createPlan";	
			}
		
	}
	
	@GetMapping(path = "planDetails.do")
	public String goPlanDetails(Model model, @RequestParam("planId")int planId) {
		Plan plan = planDao.findById(planId);
		if(plan != null) {
			model.addAttribute("plan", plan);
			model.addAttribute("mealTypes", mealDao.findAllMealTypes());
			model.addAttribute("planMeals", planMealDao.findAllPlanMeals(planId));
			return "planDetails";
		}
		
		return "redirect:account.do";
	}
	
	
	@PostMapping(path = "savemyplan.do")
	public String saveMyPlan(@RequestParam("day")String day, @RequestParam("planName") String planName, Model model) {
		Plan plan = new Plan();
		plan.setCreateDate(null);
		plan.setNotes(planName);
		model.addAttribute("message", "Plan for");
			return "redirect:myplan.do";
	}
	
	@GetMapping(path = "myplan.do")
	public String goAllPlans(User user, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		List<Plan> plans = planDao.allPlans();
		model.addAttribute("planList", plans);
		return "myplan";
	}
	
	@PostMapping(path="addMealToPlan.do")
	public String addMealToPlan(HttpSession session, PlanMeal planMeal) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if(loggedInUser != null) {
			planMeal = planMealDao.addPlanMeal(planMeal);
			return "redirect:planDetails.do?planId=" + planMeal.getPlan().getId();
		}
		return "redirect:home.do";
	}
	
	@GetMapping(path = "deletePlan.do")
	public String deletePlan(HttpSession session, @RequestParam("planId") int planId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		planDao.deleteByPlanId(planId, loggedInUser);

		return "redirect:account.do";
	}
	
}

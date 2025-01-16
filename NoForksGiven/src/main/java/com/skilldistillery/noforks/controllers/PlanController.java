package com.skilldistillery.noforks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.noforks.data.PlanDAO;
import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDAO planDao;

	@GetMapping(path = "createplans.do")
	public String gocreateplan(Model model) {
		return "createplans";
	}
	
	@PostMapping(path = "savemyplan.do")
	public String saveMyPlan(@RequestParam("day")String day, @RequestParam("planName") String planName, Model model) {
		Plan plan = new Plan();
		plan.setCreateDate(null);
		plan.setNotes(planName);
		planDao.savePlan(plan);
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
}

package com.skilldistillery.noforks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.noforks.data.PlanDAO;
import com.skilldistillery.noforks.entities.Plan;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDAO planDao;

	@GetMapping(path = "createplans.do")
	public String gocreateplan(Model model) {
		return "createplans";
	}
	
	@GetMapping(path = "myplan.do")
	public String goplan(Model model) {
		return "myplan";
	}
}

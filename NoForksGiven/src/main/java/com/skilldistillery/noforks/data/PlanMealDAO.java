package com.skilldistillery.noforks.data;

import java.util.List;

import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.PlanMeal;
import com.skilldistillery.noforks.entities.User;

public interface PlanMealDAO {

	PlanMeal addPlanMeal(PlanMeal planMeal, Plan plan);
	PlanMeal editPlanMeal(int planMealId, PlanMeal planMeal, User user);
	PlanMeal findPlanMealById (int planMeal);
	List<PlanMeal> findAllPlanMeals(int planId);
	
}

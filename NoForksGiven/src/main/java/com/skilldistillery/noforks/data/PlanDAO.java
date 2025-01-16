package com.skilldistillery.noforks.data;

import java.util.List;

import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.User;

public interface PlanDAO {

	Plan addPlan(Plan plan, User user);
	boolean deleteByPlanId(int planId, User user);
	Plan savePlan(Plan plan);
	List<Plan> allPlans();
}

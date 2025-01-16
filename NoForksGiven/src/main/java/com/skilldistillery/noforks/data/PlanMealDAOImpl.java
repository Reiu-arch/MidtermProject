package com.skilldistillery.noforks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.PlanMeal;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class PlanMealDAOImpl implements PlanMealDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public PlanMeal addPlanMeal(PlanMeal planMeal, Plan plan) {
		planMeal.setPlan(plan);
		em.persist(plan);
		return planMeal;
	}

	@Override
	public PlanMeal editPlanMeal(int planMealId, PlanMeal planMeal, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlanMeal findPlanMealById(int planMeal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlanMeal> findAllPlanMeals(int planId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}

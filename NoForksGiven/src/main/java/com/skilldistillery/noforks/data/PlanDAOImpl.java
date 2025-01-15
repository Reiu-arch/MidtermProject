package com.skilldistillery.noforks.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Plan;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class PlanDAOImpl implements PlanDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Plan addPlan(Plan plan, User user) {
		plan.setUser(user);
		em.persist(plan);
		return plan;
	}

	@Override
	public boolean deleteByPlanId(int planId, User user) {
		Plan plan = em.find(Plan.class, planId);
		if (plan.getUser().getId() != user.getId()) {
			return false;
		}
		
		em.persist(plan);
		return true;
	}

	@Override
	public Plan savePlan(Plan plan) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void savePlan(Plan plan) {
		// TODO Auto-generated method stub
		
	}

}

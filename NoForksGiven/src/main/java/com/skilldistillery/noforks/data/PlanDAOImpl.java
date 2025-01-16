package com.skilldistillery.noforks.data;

import java.util.List;

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
		plan.setEnabled(true);
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
	public List<Plan> allPlans() {
		String jpql = "SELECT p FROM Plan p";
		List<Plan> allPlansList = em.createQuery(jpql, Plan.class).getResultList();
		return allPlansList;
	}

	@Override
	public Plan findById(int planId) {
		
		return em.find(Plan.class, planId);
	}


}

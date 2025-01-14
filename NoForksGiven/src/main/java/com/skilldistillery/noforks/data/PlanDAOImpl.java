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
	public Recipe addPlan(Plan plan, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteByPlanId(int planId, User user) {
		// TODO Auto-generated method stub
		return false;
	}

}

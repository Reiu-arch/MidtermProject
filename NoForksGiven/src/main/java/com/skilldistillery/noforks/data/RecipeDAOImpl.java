package com.skilldistillery.noforks.data;

import com.skilldistillery.noforks.entities.Recipe;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

public class RecipeDAOImpl implements RecipeDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Recipe addRecipe(Recipe recipe) {
			em.persist(recipe);
		return null;
	}

}

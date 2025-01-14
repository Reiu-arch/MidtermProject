package com.skilldistillery.noforks.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class RecipeDAOImpl implements RecipeDAO{

	@PersistenceContext
	private EntityManager em;

	@Override
	public Recipe addRecipe(Recipe recipe, User user) {
		recipe.setUser(user);
			em.persist(recipe);
		return recipe;
	}
	
	

}

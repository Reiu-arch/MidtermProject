package com.skilldistillery.noforks.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class RecipeDAOImpl implements RecipeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Recipe addRecipe(Recipe recipe, User user) {
		recipe.setUser(user);
		recipe.setEnabled(true);
		em.persist(recipe);
		return recipe;
	}

	@Override
	public Recipe editByRecipeId(int recipeId, Recipe recipeToUpdate, User user) {
		Recipe recipe = em.find(Recipe.class, recipeId);

		if (recipe.getUser().getId() != user.getId()) {
			return null;
		}

		if (recipe.getUser().getId() == user.getId()) {
			if (recipe != null) {
				recipe.setName(recipeToUpdate.getName());
				recipe.setDescription(recipeToUpdate.getDescription());
				recipe.setPrepTimeMin(recipeToUpdate.getPrepTimeMin());
				recipe.setCookTimeMin(recipeToUpdate.getCookTimeMin());
				recipe.setInstructions(recipeToUpdate.getInstructions());
				recipe.setServings(recipeToUpdate.getServings());
				recipe.setDifficulty(recipeToUpdate.getDifficulty());
				recipe.setIngredients(recipeToUpdate.getIngredients());
				recipe.setImageUrl(recipeToUpdate.getImageUrl());
			}
		} 

		return recipe;
	}

	@Override
	public boolean deleteByRecipeId(int recipeId, User user) {
		Recipe recipe = em.find(Recipe.class, recipeId);
		if (recipe.getUser().getId() != user.getId()) {
			return false;
		}

		recipe.setEnabled(false);
		em.persist(recipe);

		return true;
	}

	@Override
	public Recipe findRecipeById(int recipeId) {

		return em.find(Recipe.class, recipeId);
	}

}

package com.skilldistillery.noforks.data;

import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

public interface RecipeDAO {
	
	Recipe addRecipe(Recipe recipe, User user);
	boolean deleteByRecipeId(int recipeId, User user);
	Recipe editByRecipeId(int recipeId, Recipe recipeToUpdate, User user);
	Recipe findRecipeById(int recipeId);
	
}

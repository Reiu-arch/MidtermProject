package com.skilldistillery.noforks.data;

import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

public interface MealDAO {

	Meal addMeal(Meal meal, User user);
	Meal editMeal(int recipeId, Recipe recipeToUpdate, User user);
	boolean deleteMealById (int mealId, User user);
	Meal findMealById (int mealId);
	Meal addRecipeToMeal (int recipeId, int mealId, User userId);
}

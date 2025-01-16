package com.skilldistillery.noforks.data;

import java.util.List;

import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.MealType;
import com.skilldistillery.noforks.entities.User;

public interface MealDAO {

	Meal addMeal(Meal meal, User user);
	Meal editMeal(int mealId, Meal mealToUpdate, User user);
	boolean deleteMealById (int mealId, User user);
	Meal findMealById (int mealId);
	Meal addRecipeToMeal (int recipeId, int mealId, User user);
	Meal removeRecipeFromMeal (int recipeId, int mealId, User user);
	List<Meal>findAllMeals(int userId);
	List<MealType> findAllMealTypes();
} 

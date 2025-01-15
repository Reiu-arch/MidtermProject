package com.skilldistillery.noforks.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Meal;
import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class MealDOAImpl implements MealDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Meal addMeal(Meal meal, User user) {
		meal.setUser(user);
		em.persist(meal);
		return meal;
	}

	@Override
	public Meal editMeal(int recipeId, Recipe recipeToUpdate, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteByMealId(int mealId, User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Meal findMealById(int mealId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Meal addRecipeToMeal(int recipeId, int mealId, User userId) {
//		if(meal.getUser().getId() != user.getId()) {
//			return null;
//			};
		Recipe recipe = em.find(Recipe.class, recipeId);
		Meal addedToMeal = em.find(Meal.class, mealId);
		addedToMeal.addRecipe(recipe);
		return addedToMeal; 
	}	
	
}
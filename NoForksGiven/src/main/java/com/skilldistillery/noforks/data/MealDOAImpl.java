package com.skilldistillery.noforks.data;

import java.util.List;

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
	public Meal editMeal(int mealId, Meal mealToUpdate, User user) {
		
		Meal meal = em.find(Meal.class, user.getId());
		if (meal.getUser().getId() != user.getId()) {
			return null;
		}
		if(meal !=null) {
			meal.setName(mealToUpdate.getName());
			meal.setNotes(mealToUpdate.getNotes());
			meal.setImageUrl(mealToUpdate.getImageUrl());
			meal.setMealTypeId(mealToUpdate.getMealTypeId());
		}
		return meal;
	}


	@Override
	public Meal findMealById(int mealId) {
		String jpql = "SELECT m FROM Meal m WHERE m.id = :mealId AND enabled = true";
		Meal meal = em.createQuery(jpql, Meal.class).setParameter("mealId",mealId).getSingleResult();
		return meal;
	}

	@Override
	public Meal addRecipeToMeal(int recipeId, int mealId, User userId) {
		Recipe recipe = em.find(Recipe.class, recipeId);
		Meal meal = em.find(Meal.class, mealId);
		meal.addRecipe(recipe);
		
		System.out.println(recipeId + " " + mealId);
		return meal; 
	}
 
	@Override
	public List<Meal> findAllMeals() {
		String jpql = "SELECT m FROM Meal m WHERE m.enabled = true";
		List<Meal> meals = em.createQuery(jpql, Meal.class).getResultList();
		return meals;
	}

	@Override
	public boolean deleteMealById(int mealId, User user) {
		Meal meal = em.find(Meal.class, mealId);
		if(meal.getUser().getId() != user.getId()) {
			return false;
		}
		meal.setEnabled(false);
		em.persist(meal);
		return true;
	}

	@Override
	public Meal removeRecipeFromMeal(int recipeId, int mealId, User userId) {
		Recipe recipe = em.find(Recipe.class, recipeId);
		Meal meal = em.find(Meal.class, mealId);
		meal.removeRecipe(recipe);
		
		System.out.println(recipeId + " " + mealId);
		return meal;
	}
	
	 
}
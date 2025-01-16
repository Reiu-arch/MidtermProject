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
		System.out.println("****************************************************");
		System.out.println(meal.getUser());
		System.out.println(meal.getMealTypeId());
		System.out.println(meal);
		System.out.println("****************************************************");
		em.persist(meal);
		return meal;
	}

	@Override
	public Meal editMeal(int recipeId, Recipe recipeToUpdate, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteMealById(int mealId, User user) {
		Meal meal = em.find(Meal.class, mealId);
		if (meal.getUser().getId() != user.getId()) {
			return false;
		}
		
		meal.setEnabled(false);
		em.persist(meal);
		
		return true;
	}

	@Override
	public Meal findMealById(int mealId) {
		String jpql = "SELECT m FROM Meal m WHERE id = :mealId";
		Meal meal = em.createQuery(jpql, Meal.class).setParameter("mealId",mealId).getSingleResult();
		return meal;
	}

	@Override
	public Meal addRecipeToMeal(int recipeId, int mealId, User userId) {
//		if(meal.getUser().getId() != user.getId()) {
//			return null;
//			};
		Recipe recipe = em.find(Recipe.class, recipeId);
		Meal addedToMeal = em.find(Meal.class, mealId);
		addedToMeal.addRecipe(recipe);
		
		System.out.println(recipeId + " " + mealId);
		return addedToMeal; 
	}

	@Override
	public List<Meal> findAllMeals() {
		String jpql = "SELECT m FROM Meal m";
		List<Meal> meals = em.createQuery(jpql, Meal.class).getResultList();
		return meals;
	}
	
	 
}
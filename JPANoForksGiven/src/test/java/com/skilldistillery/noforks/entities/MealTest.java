package com.skilldistillery.noforks.entities;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Meal meal;
	

	@BeforeAll
	 static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPANoForksGiven");
	 }


	 @AfterAll
	 static void tearDownAfterClass() throws Exception {
		 emf.close();
	 }


	 @BeforeEach
	 void setUp() throws Exception {
		 em = emf.createEntityManager();
		 meal = em.find(Meal.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 meal = null;
		 em.close();
	 }
	
	@Test
	void test_Meal_entity_mapping() {
		assertNotNull(meal);
		assertEquals("Tacos de Lengua", meal.getName());
	}
	
	@Test
	void test_Meal_ManyToOne_MealType_mapping() {
		assertNotNull(meal);
		assertEquals("Breakfast", meal.getMealTypeId().getName());
	}
	
	@Test
	void test_Meal_ManyToMany_Recipe_mapping_mealHasRecipe() {
		assertNotNull(meal.getMealTypeId());
		assertTrue(meal.getRecipes().size()>0);
	}

	@Test
	void test_Meal_OneToMany_MealComment_mapping() {
		assertNotNull(meal.getMealComments());
		assertTrue(meal.getMealComments().size()>0);
	}
	
	@Test
	void test_Meal_OneToMany_User_mapping_through_MealReview() {
		assertNotNull(meal.getMealReviews());
		assertTrue(meal.getMealReviews().size()>0);
	}
	
	
	@Test
	void test_Meal_ManyToOne_User_mapping() {
		assertEquals(1, meal.getUser().getId());
	}
	
	@Test
	void test_Meal_ManyToMany_User_mapping_through_favoriteMeal() {
		assertNotNull(meal.getUsersWithFavMeals());
		assertTrue(meal.getUsersWithFavMeals().size()>0);

	}
	
	@Test
	void test_Meal_OneToMany_PlanMeal_mapping() {
		assertNotNull(meal.getPlanmeals());
		assertTrue(meal.getPlanmeals().size()>0);
	}
	
	
}

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

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	

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
		 user = em.find(User.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 user = null;
	 }
	
	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertTrue(user.getEnabled());
	}
	
	@Test
	void test_User_OneToMany_Meal_mapping() {
		assertNotNull(user.getMeals());
		assertTrue(user.getMeals().size()>0);
	}
	
	@Test
	void test_User_OneToMany_MealReview_mapping() {
		assertNotNull(user.getMealReviews());
		assertTrue(user.getMealReviews().size()>0);
	}
	
	@Test
	void test_User_OneToMany_Plan_mapping() {
		assertNotNull(user.getPlans());
		assertTrue(user.getPlans().size()>0);
	}

	@Test
	void test_User_OneToMany_Recipe_mapping() {
		assertNotNull(user.getRecipes());
		assertTrue(user.getRecipes().size()>0);
	}
<<<<<<< HEAD
	
	@Test
	void test_User_OneToMany_MealComment_mapping() {
		assertNotNull(user.getMealComments());
		assertTrue(user.getMealComments().size()>0);
	}
=======


	@Test
	void test_User_OneToMany_RecipeComment_mapping() {
		assertNotNull(user.getRecipeComments());
		assertTrue(user.getRecipeComments().size()>0);
	}
	
	@Test
	void test_User_OneToMany_PlanComment_mapping() {
		assertNotNull(user.getPlanComments());
		assertTrue(user.getPlanComments().size()>0);
	}

>>>>>>> c83f76cf7bc37710b99e67a11c348365fc5755c2
}


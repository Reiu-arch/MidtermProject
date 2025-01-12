package com.skilldistillery.noforks.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealTypeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealType mealType;

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
		mealType = em.find(MealType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		mealType = null;
	}

	@Test
	void test_MealType_entity_mapping() {
		assertNotNull(mealType);
		assertEquals("Breakfast", mealType.getName());
//		assertEquals("Lunch", mealType.getName());
//		assertEquals("Dinner", mealType.getName());
//		assertEquals("Snack", mealType.getName());
	}
	
	@Test
	void test_MealType_OneToMany_Meal_mapping() {
		assertNotNull(mealType.getName());
		assertTrue(mealType.getMeals().size()>0);
	}
	

}

package com.skilldistillery.noforks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PlanMealTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PlanMeal planMeal;
	

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
		 planMeal = em.find(PlanMeal.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 planMeal = null;
	 }
	
	@Test
	void test_PlanMeal_entity_mapping() {
		assertNotNull(planMeal);
		assertNull(planMeal.getDayNumber());
	}
	
	@Test
	void test_PlanMeal_ManyToOne_Meal_mapping() {
		assertEquals(1, planMeal.getMeal().getId());
	}
	
	@Test
	void test_PlanMeal_ManyToOne_Plan_mapping() {
		assertEquals(1, planMeal.getPlan().getId());
	}

}

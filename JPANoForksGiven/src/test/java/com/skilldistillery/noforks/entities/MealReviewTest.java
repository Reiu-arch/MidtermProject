package com.skilldistillery.noforks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealReviewTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealReview mealReview;
	

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
		 MealReviewId mId = new MealReviewId();
		 mId.setUserId(1);
		 mId.setMealId(1);
		 mealReview = em.find(MealReview.class, mId);
		 
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 mealReview = null;
	 }
	
	@Test
	void test_MealReview_entity_mapping() {
		assertNotNull(mealReview);
		assertEquals(2025, mealReview.getCreateDate().getYear());
	}

}

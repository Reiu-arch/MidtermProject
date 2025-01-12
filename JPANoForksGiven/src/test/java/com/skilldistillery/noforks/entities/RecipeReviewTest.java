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

class RecipeReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeReview recipeReview;

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
		RecipeReviewId rId = new RecipeReviewId();
		rId.setRecipeId(1);
		rId.setUserId(1);
		recipeReview = em.find(RecipeReview.class, rId);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipeReview = null;
	}


	@Test
	void test_RecipeReview_entity_mapping() {
		assertNotNull(recipeReview);
		assertNull(recipeReview.getRemarks());
		assertEquals(4, recipeReview.getRating());
	}

	@Test
	void test_RecipeReview_ManyToOne_to_Recipe_mapping() {
		assertEquals(1, recipeReview.getId().getRecipeId());
	}

	@Test
	void test_RecipeReview_ManyToOne_to_User_mapping() {
		assertEquals(1, recipeReview.getId().getUserId());
	}
}

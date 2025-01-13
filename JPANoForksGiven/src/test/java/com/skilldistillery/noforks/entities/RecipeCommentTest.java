package com.skilldistillery.noforks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class RecipeCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeComment recipeComment;
	

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
		 recipeComment = em.find(RecipeComment.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 recipeComment = null;
	 }
	
	@Test
	void test_RecipeComment_entity_mapping() {
		assertNotNull(recipeComment);
		assertEquals("V cant cook", recipeComment.getComments());
	}
	
	@Test
	void test_RecipeComment_ManyToOne_Recipe_mapping() {
		assertEquals("Chicken Alfredo", recipeComment.getRecipe().getName());
	}
	
	@Test
	void test_RecipeComment_ManyToOne_User_mapping() {
		assertEquals("admin", recipeComment.getUser().getUsername());
	}

	
	@Test
	void test_RecipeComment_to_SubComments_ManyToOne_mapping() {
		recipeComment = em.find(RecipeComment.class, 2);
		assertNotNull(recipeComment.getParentComment());
		assertEquals(1,recipeComment.getParentComment().getId());
	}
	
	
	@Test
	void test_RecipeComment_SubComments_OneToMany_mapping() {
		assertNotNull(recipeComment.getSubComments());
		assertTrue(recipeComment.getSubComments().size()>0);
	}
	
	
}

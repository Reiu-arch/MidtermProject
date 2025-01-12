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

class RecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;
	
	
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
		recipe = em.find(Recipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipe = null;
	}

	@Test
	void test_Recipe_entity_mapping() {
		assertNotNull(recipe);
		assertEquals("Chicken Alfredo", recipe.getName());
		assertEquals("Boil water", recipe.getInstructions());
	}
	
	@Test
	void test_ManyToMany_mapping_to_Diet() {
		assertNotNull(recipe.getDiets());
		assertTrue(recipe.getDiets().size()>0);
		assertEquals("Vegan",recipe.getDiets().getFirst().getName());
	}

}

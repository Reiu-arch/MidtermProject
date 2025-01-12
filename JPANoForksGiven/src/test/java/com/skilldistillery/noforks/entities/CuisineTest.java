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

class CuisineTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cuisine cuisine;
	

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
		 cuisine = em.find(Cuisine.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 cuisine = null;
	 }
	
	@Test
	void test_Cuisine_entity_mapping() {
		assertNotNull(cuisine);
		assertEquals("Mexican", cuisine.getName());
	}

	@Test
	void test_ManyToMany_mapping_to_Recipe() {
		assertNotNull(cuisine.getRecipes());
		//FIXME we need to have Will add a cuisine has recipe data of recipe 1 to cuisine 3
		//the join column is empty
//		assertTrue(cuisine.getRecipes().size()>0);
	}
}

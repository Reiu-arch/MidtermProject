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

class DietTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Diet diet;
	

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
		 diet = em.find(Diet.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 diet = null;
	 }
	
	@Test
	void test_Diet_entity_mapping() {
		assertNotNull(diet);
		assertEquals("Vegan", diet.getName());
	}

}

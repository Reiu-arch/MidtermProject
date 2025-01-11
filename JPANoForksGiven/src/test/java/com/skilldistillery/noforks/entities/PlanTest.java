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

class PlanTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Plan plan;

	
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
		plan = em.find(Plan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		plan = null;
	}

	@Test
	void test_Plan_entity_mapping() {
		assertNotNull(plan);
		assertEquals(2025, plan.getCreateDate().getYear());
		
	}

}

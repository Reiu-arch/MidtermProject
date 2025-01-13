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

class PlanCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PlanComment pc;
	

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
		pc = em.find(PlanComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pc = null;
	}

	@Test
	void test_PlanComment_entity_mapping() {
		assertNotNull(pc);
		assertEquals("V cant cook", pc.getComments());
	}
	
	@Test
	void test_PlanComment_ManyToOne_Plan_mapping() {
		assertEquals(1, pc.getPlan().getId());
	}
	
	@Test
	void test_PlanComment_ManyToOne_User_mapping() {
		assertEquals("admin", pc.getUser().getUsername());
	}
	
}

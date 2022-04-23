package com.skilldistillery.membertoken.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PurchaseTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Purchase purchase;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAMemberToken");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();

	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		purchase = em.find(Purchase.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		purchase = null; 
	}

	@Test
	@DisplayName("testing purchase month")
	void test1() {
		assertNotNull(purchase);
		assertEquals(4, purchase.getDateTimePurchased().getMonthValue());

	}
	@Test
	@DisplayName("testing purchase day")
	void test2() {
		assertNotNull(purchase);
		assertEquals(21, purchase.getDateTimePurchased().getDayOfMonth());

	}


	
}

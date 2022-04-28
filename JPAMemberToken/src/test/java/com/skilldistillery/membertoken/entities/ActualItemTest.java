package com.skilldistillery.membertoken.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ActualItemTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private ActualItem actualItem;

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
		actualItem = em.find(ActualItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		actualItem = null;
	}
	
	@Test
	void test_actualitem_basic_mapping() {
		assertNotNull(actualItem);
		assertEquals(1, actualItem.getId());
		assertEquals("Air Jordan 1 Stash", actualItem.getName());

		/*
		 * SELECT * FROM actual_item WHERE id = 1;
		 *+----+--------------------+-------------+-----------+
		 *| id | name               | description | image_url |
		 *+----+--------------------+-------------+-----------+
		 *|  1 | Air Jordan 1 Stash | NULL        | NULL      |
		 *+----+--------------------+-------------+-----------+
		 * 
		 * 
		 */
	}
	
	@Test
	void test_actualitem_to_memberToken_list_mapping() {
		assertNotNull(actualItem);
		assertNotNull(actualItem.getMemberTokens());
		assertTrue(actualItem.getMemberTokens().size() > 0 );
	}

}

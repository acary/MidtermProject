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
import org.junit.jupiter.api.Test;

class BuisnessTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Business business;

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
		business = em.find(Business.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		business = null;
	}
	
	@Test
	void test_business_basic_mapping() {
		assertNotNull(business);
		assertEquals(1, business.getId());
		assertEquals("nike@nike.com", business.getLogoUrl());
		assertEquals("nike", business.getDescription());
		assertEquals(null, business.getImageUrl());
		
		/*
		 * select * FROM business WHERE id = 1;
		 * 
		 * +----+---------------+-------------+------+---------+-----------+
		 *| id | logo_url      | description | name | user_id | image_url |
		 *+----+---------------+-------------+------+---------+-----------+
		 *|  1 | nike@nike.com | nike        | Nike |       1 | NULL      |
		 *+----+---------------+-------------+------+---------+-----------+
		 */
	}

}

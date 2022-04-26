package com.skilldistillery.membertoken.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
		assertEquals("https://i.pinimg.com/474x/b7/83/64/b78364613ff5001b81077eadaa11cd2a--nike-hd-nike-wallpaper.jpg", business.getLogoUrl());
		assertEquals("nike", business.getDescription());
	
		
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
	
	@Test
	void test_business_to_collection_list_mapping() {
		assertNotNull(business);
		assertNotNull(business.getCollections());
		assertTrue(business.getCollections().size() > 0);
	}
	
	@Test
	void test_business_to_User_mapping() {
		assertNotNull(business);
		assertNotNull(business.getUser());
		assertEquals(1, business.getUser().getId());
		
		/*
		 * SELECT * FROM business WHERE user_id = 1; 
 		 *+----+-------------------+-------------+-----------+---------+-----------+
		 *| id | logo_url          | description | name      | user_id | image_url |
		 *+----+-------------------+-------------+-----------+---------+-----------+
		 *|  1 | nike@nike.com     | nike        | Nike      |       1 | NULL      |
		 *|  2 | tacobell@taco.com | taco        | Taco Bell |       1 | NULL      |
		 *|  3 | adidas@adidas.com | adidas      | Adidas    |       1 | NULL      |
		 *+----+-------------------+-------------+-----------+---------+-----------+
		 * 
		 */
	}

}

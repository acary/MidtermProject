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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}
	

	@Test
	@DisplayName("Test User Entity mapping")
	void test() {
		assertNotNull(user);
		assertEquals("nikefan", user.getUsername() );
	}
	
	@Test
	void test_user_to_business_list_mapping() {
		assertNotNull(user);
		assertNotNull(user.getBusinesses());
		assertTrue(user.getBusinesses().size() > 0);
	}
	@Test
	void test_user_to_customer() {
		assertNotNull(user);
		assertNotNull(user.getPurchases());
		assertTrue(user.getPurchases().size()> 0);
		
	}
	@Test
	void test_user_to_member_token() {
		assertNotNull(user);
//		assertNotNull(user.getMemberTokens());
//		assertTrue(user.getMemberTokens().size()>0);
	}
}

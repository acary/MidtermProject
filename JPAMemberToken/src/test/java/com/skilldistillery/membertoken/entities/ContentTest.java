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

class ContentTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Content content;

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
		content = em.find(Content.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		content = null;
	}

	@Test
	@DisplayName("Test Content Entity mapping")
	void test() {
		assertNotNull(content);
		assertEquals("Nike Release", content.getTitle());
	}

	@Test
	@DisplayName("Test Content to MemberToken mapping")
	void test2() {
		assertNotNull(content);
		assertEquals("Air Jordan 1 Stash", content.getMemberToken().getTokenName());
	}
	
	@Test
	@DisplayName("Test Content to ContentResource mapping")
	void test3() {
		assertNotNull(content);
		assertNotNull(content.getContentResources());
		assertTrue(content.getContentResources().size()>0);
	}
}

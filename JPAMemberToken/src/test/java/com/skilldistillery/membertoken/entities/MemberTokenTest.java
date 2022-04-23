package com.skilldistillery.membertoken.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MemberTokenTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private MemberToken token;

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
		token = em.find(MemberToken.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		token = null;
	}

	@Test
	@DisplayName("Test Member Token Entity mapping")
	void test() {
		assertNotNull(token);
		assertEquals("Air Jordan 1 Stash", token.getTokenName());
	}

	@Test
	void test_membertoken_to_actualItem_mapping() {
		assertNotNull(token);
		assertEquals(1, token.getActualItem().getId());
		assertEquals("Air Jordan 1 Stash", token.getActualItem().getName());
		assertEquals(null, token.getActualItem().getDescription());
		assertEquals(null, token.getActualItem().getImageUrl());

	}

	@Test
	@DisplayName("Testing member token to collection mapping")
	void test3() {
		assertNotNull(token);
		assertEquals(1, token.getCollection().getId());
	}

	@Test
	@DisplayName("Testing member token content mapping")
	void test4() {
		assertNotNull(token);
		assertNotNull(token.getContents());
		assertTrue(token.getContents().size() > 0);
	}

	@Test
	@DisplayName("Testing member token to user mapping")
	void test5() {
		assertNotNull(token);
//		assertNotNull(token.getUsers());
//		assertTrue(token.getUsers().size()>0);
	}
}

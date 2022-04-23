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
		assertEquals("Air Jordan 1 Stash", token.getTokenName() );
	}

}

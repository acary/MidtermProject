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

class CollectionTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Collection collection;

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
		collection = em.find(Collection.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		collection = null;
	}

	@Test
	@DisplayName("Test Collection Entity mapping")
	void test() {
		assertNotNull(collection);
		assertEquals("SNKRS", collection.getName() );
	}
	
	@Test
	void test_collection_to_business_mapping() {
		assertNotNull(collection);
		assertEquals(1, collection.getBusiness().getId());
		
	}
	
	@Test
	@DisplayName("Testing Collection to member token mapping")
	void test3(){
		assertNotNull(collection);
		assertNotNull(collection.getMemberTokens());
		assertTrue(collection.getMemberTokens().size()>0);
		
	}
}

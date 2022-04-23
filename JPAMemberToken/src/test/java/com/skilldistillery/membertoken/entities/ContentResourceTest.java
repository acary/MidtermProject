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

class ContentResourceTest {
	
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ContentResource contentResource;

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
		contentResource = em.find(ContentResource.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		contentResource = null; 
	}

	@Test
	@DisplayName("testing contentresource url")
	void test1() {
		assertNotNull(contentResource);
		assertEquals("https://www.nike.com/launch/t/air-jordan-1-stash", contentResource.getResourceUrl());

	}
	


	
}

	
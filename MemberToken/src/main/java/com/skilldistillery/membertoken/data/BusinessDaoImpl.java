package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.User;

@Service
@Transactional
public class BusinessDaoImpl implements BusinessDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Business> findAllBusinesses() {
		String jpql = "SELECT business FROM Business business";
		return em.createQuery(jpql, Business.class).getResultList();
	}

	@Override
	public Business findBusinessById(Integer bid) {
		Integer busId = Integer.valueOf(bid);
		String jpql = "SELECT bus FROM Business bus WHERE bus.id = :bid";
		return em.createQuery(jpql, Business.class).setParameter("bid", busId).getResultList().get(0);

	}
	
	@Override
	public List<Business> findBusinessByUserId(User user) {
		int uid = user.getId();
		String jpql = "SELECT bus FROM Business bus WHERE bus.user.id = :uid";
		List<Business> busList = em.createQuery(jpql, Business.class).setParameter("uid", uid).getResultList();
		if (busList.isEmpty()) {
			busList = null;
		}
		return busList;
	}

	@Override
	public Business createBusiness(Business business) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(business);
		em.flush();
		em.getTransaction().commit();
		return business;
	}

	@Override
	public Business updateBusiness(int bid, Business bus) {
		Business updatedBus = em.find(Business.class, bid);
		updatedBus.setName(bus.getName());
		updatedBus.setDescription(bus.getDescription());
		return updatedBus;
	}

	@Override
	public boolean deleteBusiness(int bid) {
		boolean isDeleted = false;
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Business item = em.find(Business.class, bid);
		try {
			if (item != null) {
				em.remove(item);
			}
			isDeleted = !em.contains(item);
			em.getTransaction().commit();
			em.close();
			return isDeleted;
		} catch (Exception e) {
			return false;
		}
	}

}

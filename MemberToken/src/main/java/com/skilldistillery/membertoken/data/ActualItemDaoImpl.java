package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.ActualItem;

@Service
@Transactional
public class ActualItemDaoImpl implements ActualItemDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ActualItem> findAllActualItem() {
		String jpql = "SELECT item FROM ActualItem item";
		return em.createQuery(jpql, ActualItem.class).getResultList();
	}

	@Override
	public ActualItem findActualItemById(Integer actualItemId) {
		actualItemId = Integer.valueOf(actualItemId);
		String jpql = "SELECT item FROM ActualItem item WHERE item.id = :actualItemId";
		return em.createQuery(jpql, ActualItem.class).setParameter("actualItemId", actualItemId).getResultList().get(0);
	}

	@Override
	public ActualItem createActualItem(ActualItem actualItem) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(actualItem);
		em.flush();
		em.getTransaction().commit();
		return actualItem;
	}

	@Override
	public int updateActualItem(ActualItem actualItem) {
		int count = 0;
		EntityManager em = emf.createEntityManager();
		String jpql = "UPDATE ActualItem item SET name = item.name WHERE id = :id";
		em.getTransaction().begin();
		count = em.createQuery(jpql).setParameter("id", actualItem.getId()).executeUpdate();
		em.getTransaction().commit();
		em.close();
		return count;
	}

	@Override
	public boolean deleteActualItem(int aid) {
		boolean isDeleted = false;
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		ActualItem item = em.find(ActualItem.class, aid);
		if (item != null) {
			em.remove(item);
		}
		isDeleted = !em.contains(item);
		em.getTransaction().commit();
		em.close();
		return isDeleted;
	}
}

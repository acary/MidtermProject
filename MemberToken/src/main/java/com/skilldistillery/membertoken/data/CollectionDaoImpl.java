package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.Collection;

@Service
@Transactional
public class CollectionDaoImpl implements CollectionDAO {


	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Collection> findAllCollection() {
		String jpql = "SELECT c FROM Collection c";
		return em.createQuery(jpql, Collection.class).getResultList();
	}

	@Override
	public Collection findCollectionById(Integer cid) {
		Integer colId = Integer.valueOf(cid);
		String jpql = "SELECT c FROM Collection c WHERE c.id = :cid";
		return em.createQuery(jpql, Collection.class).setParameter("cid", colId).getResultList().get(0);
	}

	@Override
	public Collection createCollection( Collection collection) {
		em.persist(collection);
		em.flush();

		return collection;
	}

	@Override
	public Collection updateCollection(int cid, Collection col) {
		Collection updatedCol = em.find(Collection.class, cid);
		updatedCol.setName(col.getName());
		updatedCol.setDescription(col.getDescription());
		return updatedCol;
	}
}

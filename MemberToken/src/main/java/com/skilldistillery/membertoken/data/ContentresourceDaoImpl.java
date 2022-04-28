package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.ContentResource;
import com.skilldistillery.membertoken.entities.MemberToken;

@Service
@Transactional
public class ContentresourceDaoImpl implements ContentResourceDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ContentResource> findAllContentResource() {
		String jpql = "SELECT cr FROM ContentResource cr";
		return em.createQuery(jpql, ContentResource.class).getResultList();
	}

	@Override
	public ContentResource findContentResourceById(Integer contentResourceId) {
		Integer crId = Integer.valueOf(contentResourceId);
		String jpql = "SELECT cr FROM ContentResource cr WHERE cr.id = :crId";
		return em.createQuery(jpql, ContentResource.class).setParameter("crId", crId).getResultList().get(0);
	}

	@Override
	public Content findContentResourceByContent(Content content) {
		String jpql = "SELECT c FROM ContentResource c JOIN FETCH c.contentItem WHERE c.contentItem.id = :tid";
		return em.createQuery(jpql, Content.class).setParameter("tid", content.getId()).getResultList().get(0);
	}
	
	@Override
	public ContentResource createContentResource(ContentResource contentResource) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(contentResource);
		em.flush();
		em.getTransaction().commit();
		return contentResource;

	}

	@Override
	public ContentResource updateContentResource(int cid, ContentResource contentResource) {

		ContentResource updatedContentResource = em.find(ContentResource.class, cid);
		updatedContentResource.setTitle(contentResource.getTitle());
		updatedContentResource.setDescription(contentResource.getDescription());
		return updatedContentResource;
	}

}

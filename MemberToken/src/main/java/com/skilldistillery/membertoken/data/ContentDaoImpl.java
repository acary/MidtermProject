package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Content;

@Service
@Transactional
public class ContentDaoImpl implements ContentDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Content> findAllContent() {
		String jpql = "SELECT content FROM Content content";
		return em.createQuery(jpql, Content.class).getResultList();
	}

	@Override
	public Content findContentById(Integer cid) {
		Integer contId = Integer.valueOf(cid);
		String jpql = "SELECT cont FROM Content cont WHERE cont.id = :cid";
		return em.createQuery(jpql, Content.class).setParameter("cid", contId).getResultList().get(0);
	}

	@Override
	public Content createContent(Content content) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(content);
		em.flush();
		em.getTransaction().commit();

		return content;
	}

	@Override
	public Content updateContent(int cid, Content content) {
		Content updatedContent = em.find(Content.class, cid);
		updatedContent.setTitle(content.getTitle());
		updatedContent.setDescription(content.getDescription());
		return updatedContent;
	}

	@Override
	public boolean deleteContent(int cid) {
		boolean isDeleted = false;
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Business item = em.find(Business.class, cid);
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

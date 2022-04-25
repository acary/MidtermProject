package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.ActualItem;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Collection;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.ContentResource;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	/*
	 * User
	 */

	@Override
	public List <User> findAllUsers() {
		String jpql = "SELECT user FROM User user";
		return em.createQuery(jpql, User.class).getResultList();
	}
	

	@Override
	public User findUserById(int userId) {
		return em.find(User.class, userId);
	}
	
	/*
	 * Actual Item
	 */
	
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
	

	/*
	 * Token
	 */
	
	@Override
	public List<MemberToken> findAllTokens() {
		String jpql = "SELECT tkn FROM MemberToken tkn";
		return em.createQuery(jpql, MemberToken.class).getResultList();
	}

	@Override
	public MemberToken findTokenById(Integer tid) {
		Integer tknId = Integer.valueOf(tid);
		String jpql = "SELECT tkn FROM MemberToken tkn WHERE tkn.id = :tid";
		return em.createQuery(jpql, MemberToken.class).setParameter("tid", tknId).getResultList().get(0);
	}

	/*
	 * Business
	 */
	
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
	
	/*
	 * Content
	 */
	
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
	
	/*
	 * Content Resource
	 */
	
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
	
	/*
	 * Collection
	 */
	
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
	/*
	 * Purchase
	 */
	@Override
	public List<Purchase> findAllPurchases() {
		String jpql = "SELECT p FROM Purchase p";
		return em.createQuery(jpql, Purchase.class).getResultList();
	}
	@Override
	public Purchase findPurchasesById(Integer pid) {
		Integer purId = Integer.valueOf(pid);
		String jpql = "SELECT p FROM Purchase p WHERE p.id = :pid";
		return em.createQuery(jpql, Purchase.class).setParameter("pid", purId).getResultList().get(0);
	}
	
	/*
	 * Login
	 */
	
	@Override
	public User findUserByEmailAndPass(String email, String password) {
		User u = null;
		
		String jpql = "SELECT u FROM User u WHERE u.email = :email AND u.password = :pass";
		
		try {
			u = em.createQuery(jpql, User.class).setParameter("email", email).setParameter("pass", password).getSingleResult();
		} catch (Exception e) {
			u = null;
		}
		return u;
	}
	/*
	 * Add new user
	 */


	@Override
	public User addUser(User user) {
		
		
	em.persist(user);
		
		
		em.flush();
		
		
		return user;
		
		
	}
	
	
	
	
}

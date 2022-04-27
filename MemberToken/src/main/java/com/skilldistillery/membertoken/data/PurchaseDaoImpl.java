package com.skilldistillery.membertoken.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

@Service
@Transactional
public class PurchaseDaoImpl implements PurchaseDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

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

	@Override
	public Purchase createPurchase(Purchase purchase) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(purchase);
		em.flush();
		em.getTransaction().commit();
		return purchase;
	}

	@Override
	public List<Purchase> findPurchasesByUserId(User user) {
		int uid = user.getId();
		String jpql = "SELECT pur FROM Purchase pur WHERE pur.customer.id = :uid";
		return em.createQuery(jpql, Purchase.class).setParameter("uid", uid).getResultList();

	}
	
	@Override
	public Purchase purchaseItem(User user, MemberToken token, LocalDateTime lt) {
		
		Purchase newPurchase = new Purchase();
		newPurchase.setCustomer(user);
		newPurchase.setMemberToken(token);
		newPurchase.setDateTimePurchased(lt);
		
		em.persist(newPurchase);
		return newPurchase;
	}
	
	@Override
	public Purchase updatePurchase(int pid, Purchase purchase) {
		Purchase updatePurch = em.find(Purchase.class, pid);
//		updatePurch.setCustomer(purchase.getCustomer());
//		updatePurch.setDateTimePurchased(purchase.getDateTimePurchased());
//		updatePurch.setMemberToken(purchase.getMemberToken());
		updatePurch.setRating(purchase.getRating());
		updatePurch.setRatingComment(purchase.getRatingComment());
		
		return updatePurch;
		
	}
}

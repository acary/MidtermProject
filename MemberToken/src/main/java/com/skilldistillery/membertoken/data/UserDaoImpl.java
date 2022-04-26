package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

	@Override
	public User addUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}
	
	@Override
	public User createUser(User user) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.flush();
		em.getTransaction().commit();
		return user;
	}

	@Override
	public User findUserById(int userId) {
		Integer uid = Integer.valueOf(userId);
		String jpql = "SELECT u FROM User u WHERE u.id = :uid";
		return em.createQuery(jpql, User.class).setParameter("uid", uid).getResultList().get(0);
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT u FROM User u";
		return em.createQuery(jpql, User.class).getResultList();
	}
	
	@Override
	public User findUserByEmailAndPass(String email, String password) {
		User u = null;

		String jpql = "SELECT u FROM User u WHERE u.email = :email AND u.password = :pass";

		try {
			u = em.createQuery(jpql, User.class).setParameter("email", email).setParameter("pass", password)
					.getSingleResult();
		} catch (Exception e) {
			u = null;
		}
		return u;
	}

}

package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
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

}

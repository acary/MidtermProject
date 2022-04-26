package com.skilldistillery.membertoken.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.membertoken.entities.MemberToken;

@Service
@Transactional
public class TokenDaoImpl implements TokenDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMemberToken");

	@PersistenceContext
	private EntityManager em;

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

	@Override
	public MemberToken updateToken(int tid, MemberToken token) {
		MemberToken updatedTkn = em.find(MemberToken.class, tid);
		updatedTkn.setTokenName(token.getTokenName());
		updatedTkn.setDescription(token.getDescription());
		return updatedTkn;
	}

	@Override
	public MemberToken createToken(MemberToken token) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(token);
		em.flush();
		em.getTransaction().commit();
		return token;
	}
}

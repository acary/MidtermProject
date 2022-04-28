package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

public interface TokenDAO {

	List<MemberToken> findAllTokens();

	MemberToken findTokenById(Integer tid);

	MemberToken updateToken(int tid, MemberToken token);

	MemberToken createToken(MemberToken token);
	
	public List<MemberToken> findTokensByCollectionId(Integer cid);

	List<MemberToken> findTokensByUser(User user);
	
}

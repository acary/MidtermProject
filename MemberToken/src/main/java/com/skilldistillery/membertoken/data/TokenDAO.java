package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.MemberToken;

public interface TokenDAO {

	List<MemberToken> findAllTokens();

	MemberToken findTokenById(Integer tid);

	MemberToken updateToken(int tid, MemberToken token);

	MemberToken createToken(MemberToken token);

}

package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.User;

public interface UserDAO {

	/*
	 * User
	 */
	User findById(int userId);

	/*
	 * Token
	 */
	List<MemberToken> findAllTokens();

	MemberToken findTokenById(Integer tid);
}

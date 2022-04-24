package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.Collection;
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

	List<Business> findAllBusinesses();

	Business findBusinessById(Integer bid);

	List<Content> findAllContent();

	Content findContentById(Integer cid);

	Collection findCollectionById(Integer cid);

	List<Collection> findAllCollection();
}

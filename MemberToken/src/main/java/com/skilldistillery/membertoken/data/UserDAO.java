package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.ActualItem;
import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.Collection;
import com.skilldistillery.membertoken.entities.Content;
import com.skilldistillery.membertoken.entities.ContentResource;
import com.skilldistillery.membertoken.entities.MemberToken;
import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

public interface UserDAO {

	/*
	 * Actual Item
	 */

	List<ActualItem> findAllActualItem();

	ActualItem findActualItemById(Integer actualItemId);
	
	public ActualItem createActualItem(ActualItem actualItem);

	/*
	 * Token
	 */

	List<MemberToken> findAllTokens();

	MemberToken findTokenById(Integer tid);

	/*
	 * Business
	 */

	List<Business> findAllBusinesses();

	Business findBusinessById(Integer bid);
	
	public Business createBusiness(Business business);

	/*
	 * Content
	 */

	List<Content> findAllContent();

	Content findContentById(Integer cid);

	/*
	 * Collection
	 */

	Collection findCollectionById(Integer cid);

	List<Collection> findAllCollection();

	Collection createCollection(Collection collection);

	/*
	 * Content Resource
	 */
	
	List<ContentResource> findAllContentResource();

	ContentResource findContentResourceById(Integer contentResourceId);

	
	/*
	 * Purchase
	 */
	
	Purchase findPurchasesById(Integer pid);

	List<Purchase> findAllPurchases();
	
	/*
	 * Login
	 */

	User findUserByEmailAndPass(String email, String password);
	
	/*
	 * User
	 */
	
	User addUser(User user);

	User findUserById(int userId);
	
	List <User> findAllUsers();

}

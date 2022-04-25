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
	
	public int updateActualItem(ActualItem actualItem);
	
	boolean deleteActualItem(int aid);

	/*
	 * Business
	 */

	List<Business> findAllBusinesses();

	Business findBusinessById(Integer bid);
	
	public Business createBusiness(Business business);

	Business updateBusiness(int bid, Business bus);
	
	boolean deleteBusiness(int id);
	
	/*
	 * Content
	 */

	List<Content> findAllContent();

	Content findContentById(Integer cid);

	Content createContent(Content content);
	
	Content updateContent(int cid, Content content);
	
	/*
	 * Collection
	 */

	Collection findCollectionById(Integer cid);

	List<Collection> findAllCollection();

	Collection createCollection(Collection collection);
	
	Collection updateCollection(int cid, Collection collection);

	/*
	 * Content Resource
	 */
	
	List<ContentResource> findAllContentResource();

	ContentResource findContentResourceById(Integer contentResourceId);
	
	ContentResource createContentResource(ContentResource contentResource);
	
	ContentResource updateContentResource(int cid, ContentResource contentResource);
	
	/*
	 * Purchase
	 */
	
	Purchase findPurchasesById(Integer pid);

	List<Purchase> findAllPurchases();
	
	Purchase createPurchase(Purchase purchase);
	
	/*
	 * Login
	 */

	User findUserByEmailAndPass(String email, String password);
	
	/*
	 * Token
	 */

	List<MemberToken> findAllTokens();

	MemberToken findTokenById(Integer tid);
	
	MemberToken updateToken(int tid, MemberToken token);
	
	MemberToken createToken(MemberToken token);
	
	/*
	 * User
	 */
	
	User addUser(User user);

	User findUserById(int userId);
	
	List <User> findAllUsers();

	User createUser(User user);

	

}

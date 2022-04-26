package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Business;
import com.skilldistillery.membertoken.entities.User;

public interface BusinessDAO {

	List<Business> findAllBusinesses();

	Business findBusinessById(Integer bid);

	public Business createBusiness(Business business);

	Business updateBusiness(int bid, Business bus);

	boolean deleteBusiness(int id);

	List<Business> findBusinessByUserId(User user);

}

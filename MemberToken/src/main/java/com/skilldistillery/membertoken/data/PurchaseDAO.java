package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Purchase;
import com.skilldistillery.membertoken.entities.User;

public interface PurchaseDAO {

	Purchase findPurchasesById(Integer pid);

	List<Purchase> findAllPurchases();

	Purchase createPurchase(Purchase purchase);

	List<Purchase> findPurchasesByUserId(User user);

}

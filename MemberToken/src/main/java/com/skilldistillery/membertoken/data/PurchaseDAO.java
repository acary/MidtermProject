package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Purchase;

public interface PurchaseDAO {

	Purchase findPurchasesById(Integer pid);

	List<Purchase> findAllPurchases();

	Purchase createPurchase(Purchase purchase);

}

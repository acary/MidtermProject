package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.ActualItem;

public interface ActualItemDAO {

	List<ActualItem> findAllActualItem();

	ActualItem findActualItemById(Integer actualItemId);

	public ActualItem createActualItem(ActualItem actualItem);

	public int updateActualItem(ActualItem actualItem);

	boolean deleteActualItem(int aid);

}

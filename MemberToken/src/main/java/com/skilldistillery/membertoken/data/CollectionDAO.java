package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Collection;

public interface CollectionDAO {

	Collection findCollectionById(Integer cid);

	List<Collection> findAllCollection();

	Collection createCollection( Collection collection);

	Collection updateCollection(int cid, Collection collection);

}

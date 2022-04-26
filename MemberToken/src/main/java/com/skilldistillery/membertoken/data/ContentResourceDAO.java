package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.ContentResource;

public interface ContentResourceDAO {

	List<ContentResource> findAllContentResource();

	ContentResource findContentResourceById(Integer contentResourceId);

	ContentResource createContentResource(ContentResource contentResource);

	ContentResource updateContentResource(int cid, ContentResource contentResource);
}

package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.Content;

public interface ContentDAO {

	List<Content> findAllContent();

	Content findContentById(Integer cid);

	Content createContent(Content content);

	Content updateContent(int cid, Content content);

	boolean deleteContent(int id);

}

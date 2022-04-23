package com.skilldistillery.membertoken.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "content_resource")
public class ContentResource {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	

	private String title;

	private String description;
	@Column(name= "resource_url")
	private String resourceUrl;
	
	@ManyToOne
	@JoinColumn(name = "content_id")
	private Content contentItem;
	
	public ContentResource() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public Content getContentItem() {
		return contentItem;
	}

	public void setContentItem(Content content) {
		this.contentItem = content;
	}
	
	
	
}

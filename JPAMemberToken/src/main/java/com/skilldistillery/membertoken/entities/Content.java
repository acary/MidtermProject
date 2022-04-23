package com.skilldistillery.membertoken.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Content {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	private String description;

	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "text_content")
	private String textContent;
	
	@Column(name = "access_code")
	private String accessCode;
	
	@ManyToOne
	@JoinColumn(name = "member_token_id")
	private MemberToken memberToken;
	
	private String status;
	
	public Content() {
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public String getAccessCode() {
		return accessCode;
	}

	public void setAccessCode(String accessCode) {
		this.accessCode = accessCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public MemberToken getMemberToken() {
		return memberToken;
	}

	public void setMemberToken(MemberToken memberToken) {
		this.memberToken = memberToken;
	}

	@Override
	public String toString() {
		return "Content [id=" + id + ", title=" + title + ", description=" + description + ", imageUrl=" + imageUrl
				+ ", textContent=" + textContent + ", accessCode=" + accessCode + ", status=" + status + "]";
	}
}

package com.skilldistillery.membertoken.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name= "date_time_purchased")
	private LocalDateTime dateTimePurchased; 
	
	@Column(name="member_token_id")
	private int memberTokenId;
	
	@Column(name = "user_id")
	private int userId;
	

	private Integer rating;

	@Column(name = "rating_comment")
	private String ratingComment;

	public Purchase() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getDateTimePurchased() {
		return dateTimePurchased;
	}

	public void setDateTimePurchased(LocalDateTime dateTimePurchased) {
		this.dateTimePurchased = dateTimePurchased;
	}

	public int getMemberTokenId() {
		return memberTokenId;
	}

	public void setMemberTokenId(int memberTokenId) {
		this.memberTokenId = memberTokenId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

}

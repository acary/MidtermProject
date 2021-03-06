package com.skilldistillery.membertoken.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name= "date_time_purchased")
	private LocalDateTime dateTimePurchased; 
	

	private Integer rating;

	@Column(name = "rating_comment")
	private String ratingComment;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User customer;
	
	@OneToOne
	@JoinColumn(name="member_token_id")
	private MemberToken memberToken;

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

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public MemberToken getMemberToken() {
		return memberToken;
	}

	public void setMemberToken(MemberToken memberToken) {
		this.memberToken = memberToken;
	}

}

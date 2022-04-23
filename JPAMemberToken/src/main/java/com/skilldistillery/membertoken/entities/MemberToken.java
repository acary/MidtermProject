package com.skilldistillery.membertoken.entities;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MemberToken {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String tokenName;
	
	private String description;
	
	private String tokenImgUrl;
	
	private double price;
	
	private int totalSupply;
	
	private LocalDateTime releaseDate;
	
}

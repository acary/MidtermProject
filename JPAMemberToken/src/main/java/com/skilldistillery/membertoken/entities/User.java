package com.skilldistillery.membertoken.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String email;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String username;
	
	private String password;
	
	private boolean active;
	
	private String role;
	
	@Column(name="profile_image_url")
	private String profileImageUrl;
	
	@Column(name="about_me")
	private String aboutMe;
	
	@OneToMany(mappedBy="user")
	private List<Business> businesses;
	
	@OneToMany(mappedBy="customer")
	private List<Purchase> purchases;
	
	@ManyToMany
	@JoinTable(name = "favorite_token",
	joinColumns= @JoinColumn(name= "user_id"), 
	inverseJoinColumns=@JoinColumn(name = "member_token_id")
	)
	private List<MemberToken> favorites;
	
	
	public void addFavorite(MemberToken favorite) {
	    if(favorite == null) favorites = new ArrayList<>();
	    
	    if(!favorites.contains(favorite)) {
	        favorites.add(favorite);
	        favorite.addUser(this);
	    }
	}

	public void removeFavorite(MemberToken favorite) {
	    if(favorites != null && favorites.contains(favorite)) {
	        favorites.remove(favorite);
	        favorite.removeUser(this);
	    }
	}


	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public List<Business> getBusinesses() {
		return businesses;
	}

	public void setBusinesses(List<Business> businesses) {
		this.businesses = businesses;
	}

	public List<Purchase> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public List<MemberToken> getMemberTokens() {
		return favorites;
	}

	public void setMemberTokens(List<MemberToken> memberTokens) {
		this.favorites = memberTokens;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + "]";
	}

}

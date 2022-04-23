package com.skilldistillery.membertoken.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "member_token")
public class MemberToken {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "token_name")
	private String tokenName;

	private String description;

	@Column(name = "token_img_url")
	private String tokenImgUrl;

	private double price;

	@Column(name = "total_supply")
	private int totalSupply;

	@Column(name = "release_date")
	private LocalDateTime releaseDate;

	@ManyToOne
	@JoinColumn(name = "actual_item_id")
	private ActualItem actualItem;

	@ManyToOne
	@JoinColumn(name = "collection_id")
	private Collection collection;

	@OneToMany(mappedBy = "memberToken")
	private List<Content> contents;

	@OneToOne(mappedBy = "memberToken")
	private Purchase purchase;

	@ManyToMany(mappedBy = "favorites")
	private List<User> users;

	public MemberToken() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTokenName() {
		return tokenName;
	}

	public void setTokenName(String tokenName) {
		this.tokenName = tokenName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTokenImgUrl() {
		return tokenImgUrl;
	}

	public void setTokenImgUrl(String tokenImgUrl) {
		this.tokenImgUrl = tokenImgUrl;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getTotalSupply() {
		return totalSupply;
	}

	public void setTotalSupply(int totalSupply) {
		this.totalSupply = totalSupply;
	}

	public ActualItem getActualItem() {
		return actualItem;
	}

	public void setActualItem(ActualItem actualItem) {
		this.actualItem = actualItem;
	}

	public LocalDateTime getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDateTime releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Collection getCollection() {
		return collection;
	}

	public void setCollection(Collection collection) {
		this.collection = collection;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void addUser(User user) {
		if (user == null)
			users = new ArrayList<>();

		if (!users.contains(user)) {
			users.add(user);
			user.addFavorite(this);
		}
	}

	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.removeFavorite(this);
		}
	}
}

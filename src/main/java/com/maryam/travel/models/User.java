package com.maryam.travel.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.FetchType;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "First name is required!")
	private String firstName;

	private String lastName;
	private String tagLine;
	private String description;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Temporal(TemporalType.DATE ) // Store only date not time
	private java.util.Date birthday;

	@Lob // Large Object
	@Column(name = "photo", columnDefinition = "BLOB")
	private byte[] profileImg;

	@NotEmpty(message = "Username is required!")
	@Column(unique = true)
	private String username;

	@NotEmpty(message = "Password is required!")
	@Size(min = 8, message = "Password must be at least 8 characters")
	private String password;

	@Transient
	private transient String birthdayng;

	@Transient
	//@NotEmpty(message = "Confirm Password is required!")
	private String confirm;

	@OneToMany(mappedBy="creator", fetch = FetchType.LAZY)
	private List<Trip> plannedTrips;
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	public User() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getTagLine() {
		return tagLine;
	}

	public void setTagLine(String tagLine) {
		this.tagLine = tagLine;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public byte[] getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(byte[] profileImg) {
		this.profileImg = profileImg;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthdayng() {
		return birthdayng;
	}

	public void setBirthdayng(String birthdayng) {
		this.birthdayng = birthdayng;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Trip> getPlannedTrips() {
		return plannedTrips;
	}

	public void setPlannedTrips(List<Trip> plannedTrips) {
		this.plannedTrips = plannedTrips;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
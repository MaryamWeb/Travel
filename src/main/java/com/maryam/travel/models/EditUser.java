package com.maryam.travel.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

public class EditUser {
	@NotEmpty(message = "First name is required!")
	private String firstName;

	private String lastName;
	private String tagLine;
	private String description;

	@Lob // Large Object
	@Column(name = "photo", columnDefinition = "BLOB")
	private byte[] profileImg;
 
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Temporal(TemporalType.DATE ) // Store only date not time
	private java.util.Date birthday;
	
	public EditUser() {
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
	public byte[] getProfileImg() {
		return profileImg;
	}
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public void setProfileImg(byte[] profileImg) {
		this.profileImg = profileImg;
	}

}

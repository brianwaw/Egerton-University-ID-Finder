package com.business;

import java.io.Serializable;

public class Student implements Serializable {
	private String regNumber;
	private String studentName;
	private String emailAddress;
	private String phoneNumber;
	
	public Student (){
		regNumber = "";
		studentName = "";
		emailAddress = "";
		phoneNumber = "";
	}
	
	public Student(String regNumber, String studentName, String emailAddress, String phoneNumber ) {
		this.regNumber = regNumber;
		this.studentName = studentName;
		this.emailAddress = emailAddress;
		this.phoneNumber = phoneNumber;
	}
	
	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}
	
	public void setStudentName(String studentName) {
		this.studentName =studentName ;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getRegNumber() {
		return regNumber;
	}
	
	public String getStudentName() {
		return studentName;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
}


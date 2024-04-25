package com.business;

import java.io.Serializable;

public class Report implements Serializable {
    private String regNumber;
    private String studentName;

    // Default constructor
    public Report() {
        // Initialize fields if needed
        this.regNumber = "";
        this.studentName = "";
    }

    // Getter for regNumber
    public String getRegNumber() {
        return regNumber;
    }

    // Setter for regNumber
    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    // Getter for studentName
    public String getStudentName() {
        return studentName;
    }

    // Setter for studentName
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    // Override toString() method
    @Override
    public String toString() {
        return "StudentFormBean{" +
                "regNumber='" + regNumber + '\'' +
                ", studentName='" + studentName + '\'' +
                '}';
    }
}

package com.business;

public class ReportData {
    private String regNumber;
    private String studentName;
    private String reportTime;

    public ReportData(String regNumber, String studentName, String reportTime) {
        this.regNumber = regNumber;
        this.studentName = studentName;
        this.reportTime = reportTime;
    }

    public String getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
    }
}

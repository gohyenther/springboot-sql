package com.spring.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;

@Entity
public class Annotation {
    @Id
    private int studentId;

    @Lob
    @Column(columnDefinition = "TEXT") // very important to accept max. length of string
    private String xfdfString;

    // constructor
    public Annotation() {}

    // getters
    public int getId() { return studentId; }
    public String getString() { return xfdfString; }

    // setters
    public void setId(int studentId) { this.studentId = studentId; }
    public void setString(String xfdfString) { this.xfdfString = xfdfString; }
    
}

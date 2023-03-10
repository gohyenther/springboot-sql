package com.spring.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.demo.model.Student;

public interface StudentRepo extends JpaRepository<Student, Integer>{
    
}
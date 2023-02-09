package com.spring.demo.service;

import java.util.List;
import java.util.Optional;

import com.spring.demo.model.Student;

public interface StudentService {
    public Student saveStudent(Student student);
    public List<Student> getAllStudents();
    public Optional<Student> getStudentById(int id);
}

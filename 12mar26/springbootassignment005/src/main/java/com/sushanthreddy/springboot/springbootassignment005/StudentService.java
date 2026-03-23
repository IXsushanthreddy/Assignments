package com.sushanthreddy.springboot.springbootassignment005;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public List<Student> getStudents() {
        return studentRepository.findAll();
    }

    public Student save(Student student) {
        return studentRepository.save(student);
    }

    public Student findById(long id) {
        return studentRepository.findById(id).orElse(null);
    }

    public Student findByName(String name) {
        return studentRepository.findByNameIgnoreCase(name).orElse(null);
    }

    public Student update(long id, Student student) {
        Student s = studentRepository.findById(id).orElse(null);
        if (s == null) {
            return null;
        }

        s.setName(student.getName());
        s.setAge(student.getAge());
        s.setEmail(student.getEmail());
        return studentRepository.save(s);
    }

    public Student delete(long id) {
        Student s = studentRepository.findById(id).orElse(null);
        if (s == null) {
            return null;
        }

        studentRepository.delete(s);
        return s;
    }
}

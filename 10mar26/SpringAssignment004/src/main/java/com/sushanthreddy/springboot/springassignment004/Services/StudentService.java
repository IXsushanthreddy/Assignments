package com.sushanthreddy.springboot.springassignment004.Services;

import com.sushanthreddy.springboot.springassignment004.Student;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
public class StudentService {
    private Student student;
    private static List<Student> students=new ArrayList<Student>();
    static {
        students.add(new  Student(1, "Sushanth Reddy", 22, "sushanthreddysunkara02@gmail.com"));
        students.add(new Student(2, "Rishanth Reddy", 19, "rishanthreddysunkara02@gmail.com"));
    }
    //getmapping
    public List<Student> getStudents(){
        return students;
    }
    //postmapping
    public Student save(Student student) {
        students.add(student);
        return student;
    }
    //getmapping @PathVariable
    public Student findById(long id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null;
    }
    //getmapping @RequestPrama
    public Student filterByName(String name) {
        for (Student student : students) {
            if (name.equals(student.getName())) {
                return student;
            }
        }
        return null;
    }
    public Student findByName(String name) {
        for (Student student : students) {
            if (student.getName().equalsIgnoreCase(name)) {
                return student;
            }
        }
        return null;
    }
    //putmapping
    public Student update(long id, Student updatedStudent) {
        for (Student student : students) {
            if (student.getId() == id) {
                student.setName(updatedStudent.getName());
                student.setAge(updatedStudent.getAge());
                student.setEmail(updatedStudent.getEmail());
                return student;
            }
        }
        return null;
    }
    //deleting mapping
    public Student delete(long id) {
        Iterator<Student> iterator = students.iterator();
        while (iterator.hasNext()) {
            Student student = iterator.next();
            if (student.getId() == id) {
                iterator.remove();
                return student;
            }
        }
        return null;
    }
}

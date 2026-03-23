package com.sushanthreddy.springboot.springassignment004.Controller;

import com.sushanthreddy.springboot.springassignment004.Services.StudentService;
import com.sushanthreddy.springboot.springassignment004.Student;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/student")
public class StudentController {
    private final StudentService service;

    public StudentController(StudentService service) {
        this.service = service;
    }


    @GetMapping
    public List<Student> getStudent(){
        return service.getStudents();
    }
    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudentById(@PathVariable long id){
        Student student = service.findById(id);
        if (student != null){
            return ResponseEntity.ok(student);
        }

        return ResponseEntity.notFound().build();
    }
    @GetMapping("/search")
    public ResponseEntity<Student> getStudentByName(@RequestParam String name){
        Student student = service.findByName(name);
        if (student != null) {
            return ResponseEntity.ok(student);
        }
        return ResponseEntity.notFound().build();
    }
    @PostMapping
    public ResponseEntity<Student> createStudent(@RequestBody Student student){
        return ResponseEntity.status(201).body(service.save(student));
    }
    @PutMapping("/{id}")
    public ResponseEntity<Student> updateStudent(@PathVariable long id, @RequestBody Student student){
        Student updatedStudent = service.update(id, student);
        if (updatedStudent != null) {
            return ResponseEntity.ok(updatedStudent);
        }
        return ResponseEntity.notFound().build();
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Student> deleteStudent(@PathVariable long id) {
        Student deletedStudent = service.delete(id);
        if (deletedStudent != null) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}

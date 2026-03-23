package com.sushanthreddy.springboot.springbootassignment005;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/student")
public class StudentController {
    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping
    public ResponseEntity<List<Student>> getStudents() {
        return ResponseEntity.ok(studentService.getStudents());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudentById(@PathVariable long id) {
        Student student = studentService.findById(id);
        if (student != null) {
            return ResponseEntity.ok(student);
        }

        return ResponseEntity.notFound().build();
    }

    @GetMapping("/search")
    public ResponseEntity<Student> getStudentByName(@RequestParam String name) {
        Student student = studentService.findByName(name);
        if (student != null) {
            return ResponseEntity.ok(student);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Student> createStudent(@RequestBody Student student) {
        return ResponseEntity.status(201).body(studentService.save(student));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Student> updateStudent(@PathVariable long id, @RequestBody Student student) {
        Student updatedStudent = studentService.update(id, student);
        if (updatedStudent != null) {
            return ResponseEntity.ok(updatedStudent);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStudent(@PathVariable long id) {
        Student deletedStudent = studentService.delete(id);
        if (deletedStudent != null) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.notFound().build();
    }
}

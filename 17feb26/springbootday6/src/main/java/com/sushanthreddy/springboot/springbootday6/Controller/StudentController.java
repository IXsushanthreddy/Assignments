package com.sushanthreddy.springboot.springbootday6.Controller;

import com.sushanthreddy.springboot.springbootday6.DTO.StudentRequestDTO;
import com.sushanthreddy.springboot.springbootday6.DTO.StudentResponseDTO;
import com.sushanthreddy.springboot.springbootday6.Service.StudentService;
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
    public List<StudentResponseDTO> getStudents() {
        return studentService.getStudents();
    }

    @GetMapping("/{id}")
    public ResponseEntity<StudentResponseDTO> getStudentById(@PathVariable Long id) {
        StudentResponseDTO student = studentService.findById(id);
        if(student != null) {
            return ResponseEntity.ok(student);
        }
                return ResponseEntity.notFound().build();
    }

    @GetMapping("/search")
    public ResponseEntity<StudentResponseDTO> getStudentByName(@RequestParam String name) {
        StudentResponseDTO student = studentService.findByName(name);
        if (student != null){
            return ResponseEntity.ok(student);
        }
                return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<StudentResponseDTO> createStudent(@RequestBody StudentRequestDTO dto) {
        return ResponseEntity.status(201).body(studentService.save(dto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<StudentResponseDTO> updateStudent(
            @PathVariable Long id,
            @RequestBody StudentRequestDTO dto) {

        StudentResponseDTO s = studentService.update(id, dto);
        if(s != null){
            return ResponseEntity.ok(s);
        }
                return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStudent(@PathVariable Long id) {
        studentService.delete(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/age")
    public List<StudentResponseDTO> getStudentsOlderThan(@RequestParam int age) {
        return studentService.findOlderThan(age);
    }

    @GetMapping("/endswith")
    public List<StudentResponseDTO> getStudentsByNameEndingWith(@RequestParam String suffix) {
        return studentService.findByNameEndingWith(suffix);
    }
}
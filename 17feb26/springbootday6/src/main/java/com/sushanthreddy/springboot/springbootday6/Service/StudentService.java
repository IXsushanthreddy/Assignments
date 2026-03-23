package com.sushanthreddy.springboot.springbootday6.Service;

import com.sushanthreddy.springboot.springbootday6.Model.Student;
import com.sushanthreddy.springboot.springbootday6.Repository.StudentRepository;
import com.sushanthreddy.springboot.springbootday6.DTO.StudentRequestDTO;
import com.sushanthreddy.springboot.springbootday6.DTO.StudentResponseDTO;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    private Student mapToEntity(StudentRequestDTO dto) {
        Student s = new Student();
        s.setName(dto.getName());
        s.setAge(dto.getAge());
        s.setEmail(dto.getEmail());
        return s;
    }

    private StudentResponseDTO mapToResponse(Student s) {
        return new StudentResponseDTO(
                s.getId(),
                s.getName(),
                s.getAge(),
                s.getEmail()
        );
    }

    public List<StudentResponseDTO> getStudents() {
        return studentRepository.findAll()
                .stream()
                .map(this::mapToResponse)
                .toList();
    }

    public StudentResponseDTO save(StudentRequestDTO dto) {
        Student s = mapToEntity(dto);
        return mapToResponse(studentRepository.save(s));
    }

    public StudentResponseDTO findById(Long id) {
        return studentRepository.findById(id)
                .map(this::mapToResponse)
                .orElse(null);
    }

    public StudentResponseDTO findByName(String name) {
        return studentRepository.findByNameIgnoreCase(name)
                .map(this::mapToResponse)
                .orElse(null);
    }

    @Transactional
    public StudentResponseDTO update(Long id, StudentRequestDTO dto) {
        Student s = studentRepository.findById(id).orElse(null);
        if (s == null) return null;

        s.setName(dto.getName());
        s.setAge(dto.getAge());
        s.setEmail(dto.getEmail());

        return mapToResponse(studentRepository.save(s));
    }

    @Transactional
    public void delete(Long id) {
        studentRepository.deleteById(id);
    }

    public List<StudentResponseDTO> findOlderThan(int age) {
        return studentRepository.findStudentsOlderThan(age)
                .stream()
                .map(this::mapToResponse)
                .toList();
    }

    public List<StudentResponseDTO> findByNameEndingWith(String suffix) {
        return studentRepository.findByNameEndingWithIgnoreCase(suffix)
                .stream()
                .map(this::mapToResponse)
                .toList();
    }
}

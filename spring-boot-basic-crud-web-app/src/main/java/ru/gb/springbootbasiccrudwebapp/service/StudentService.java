package ru.gb.springbootbasiccrudwebapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.gb.springbootbasiccrudwebapp.dao.StudentRepository;
import ru.gb.springbootbasiccrudwebapp.entity.Student;

import java.util.List;

@Service
public class StudentService {
    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
        this.studentRepository.save(new Student("Вася", 35));
    }

    public StudentRepository getStudentRepository() {
        return studentRepository;
    }

    public List<Student> getAll() {
        return this.studentRepository.findAll();
    }

    public Student getById(long id) {
        if (id < 1) throw new IllegalArgumentException("id cant be below 1");
        return this.studentRepository
                .findById(id)
                .orElseThrow(() -> new IllegalArgumentException(String.format("Student with id = {%s} not exist", id)));
    }

    public void save(Student student) {
        if (student == null) throw new IllegalArgumentException("Student cant be null");
        if (student.getName() == null || student.getName().isBlank())
            throw new IllegalArgumentException("Student name cant be null or Blank");
        this.studentRepository.save(student);
    }

    public void deleteById(long id) {
        this.studentRepository.deleteById(id);
    }
}

package ru.gb.springbootbasiccrudwebapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.gb.springbootbasiccrudwebapp.entity.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
}

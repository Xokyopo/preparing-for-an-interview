package ru.gb.orm.hibernate.lesson.dao;

import org.hamcrest.collection.IsIterableContainingInAnyOrder;
import org.hibernate.Session;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ru.gb.orm.hibernate.lesson.entities.Student;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class RepositoryImplTest {
    private RepositoryImpl<Student, Long> repository;

    @BeforeEach
    public void init() {
        this.repository = new RepositoryImpl<>(Student.class);
        HibernateConnection.deleteSessionFactory();
    }

    @Test
    //изменение записи
    public void update_one_records() {
        Student student = new Student("Коля", "5");

        String expected = "Вася";
        String actual;

        try (Session session = this.getSession()) {
            session.beginTransaction();
            session.persist(student);
            session.getTransaction().commit();
        }

        student.setName(expected);
        this.repository.update(student);

        try (Session session = this.getSession()) {
            actual = session.find(Student.class, student.getId()).getName();
        }

        assertEquals(expected, actual);
    }

    @Test
    //выборки всех записей
    public void selected_all_records() {
        List<Student> expected = List.of(new Student("Вася", "5"), new Student("Коля", "3"), new Student("Петя", "4"));

        try (Session session = this.getSession()) {
            session.beginTransaction();
            for (Student student : expected) {
                session.persist(student);
            }
            session.getTransaction().commit();
        }

        List<Student> actual = this.repository.getAll();

        assertThat(actual, IsIterableContainingInAnyOrder.containsInAnyOrder(expected.toArray()));
    }

    @Test
    //выполнить методы по удалению
    public void delete_one_records() {
        int expected = 0;
        int actual;

        Student student = new Student("Влад", "5");

        try (Session session = this.getSession()) {
            session.beginTransaction();
            session.persist(student);
            session.getTransaction().commit();
        }

        this.repository.deleteById(student.getId());


        try (Session session = this.getSession()) {
            actual = session.createQuery("from Student ", Student.class).list().size();
        }

        assertEquals(expected, actual);
    }

    @Test
    //выборка одной
    public void select_one_records() {
        Student expected = new Student("Влад", "5");
        Student actual;

        try (Session session = this.getSession()) {
            session.beginTransaction();
            session.persist(expected);
            session.getTransaction().commit();
        }

        actual = this.repository.getById(expected.getId());

        assertTrue(expected.getId() > 0);
        assertEquals(expected, actual);
    }

    @Test
    //добавление записи
    public void insert_one_records() {
        Student expected = new Student("Влад", "5");
        Student actual;

        this.repository.persist(expected);

        try (Session session = this.getSession()) {
            actual = session.find(Student.class, expected.getId());
        }

        assertEquals(expected, actual);
    }

    @Test
    //Добавить 1000 записей в таблицу Student
    public void insert_1000_records() {
        int expected = 1000;
        int actual = 0;

        for (int i = 1; i <= expected; i++) {
            this.repository.persist(new Student("name_" + i, "" + i % 5));
        }

        try (Session session = this.getSession()) {
            actual = session.createQuery("from Student", Student.class).list().size();
        }

        assertEquals(expected, actual);
    }

    private Session getSession() {
        return HibernateConnection.getSessionFactory().openSession();
    }
}

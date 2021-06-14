package ru.gb.orm.hibernate.lesson.dao;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;


public class HibernateConnectionTest {

    @Test
    public void getSessionFactory_ShouldNotThrowException_WhenExecute() {
        Executable actual = HibernateConnection::getSessionFactory;
        assertDoesNotThrow(actual);
    }
}

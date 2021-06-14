package ru.gb.orm.hibernate.lesson.dao;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateConnection {
    private static SessionFactory sessionFactory;

    synchronized public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
            registryBuilder.configure();
            sessionFactory = new Configuration().buildSessionFactory(registryBuilder.build());
        }

        return sessionFactory;
    }

    public static void deleteSessionFactory() {
        sessionFactory = null;
    }
}

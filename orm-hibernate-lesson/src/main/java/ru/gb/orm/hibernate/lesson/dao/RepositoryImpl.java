package ru.gb.orm.hibernate.lesson.dao;

import org.hibernate.Session;

import java.io.Serializable;
import java.util.List;
import java.util.function.Consumer;

public class RepositoryImpl<E, ID extends Serializable> implements Repository<E, ID> {
    private final Class<E> entityClass;

    public RepositoryImpl(Class<E> entityClass) {
        this.entityClass = entityClass;
    }

    @Override
    public E persist(E entity) {
        if (this.runTransactionInSession(session -> session.persist(entity))) {
            return entity;
        }
        return null;
    }

    @Override
    public boolean deleteById(ID id) {
        return (this.runTransactionInSession((session -> session.delete(session.get(this.entityClass, id)))));
    }

    @Override
    public E update(E entity) {
        if (this.runTransactionInSession(session -> session.merge(entity))) {
            return entity;
        }
        return null;
    }

    @Override
    public List<E> getAll() {
        try (Session session = this.getSession()) {
            return session.createQuery(String.format("from %s", this.entityClass.getSimpleName()), this.entityClass).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public E getById(ID id) {
        Object[] scopeHack = new Object[1];
        if (this.runTransactionInSession(session -> {
            scopeHack[0] = session.get(this.entityClass, id);
        })) {
            return (E) scopeHack[0];
        }
        return null;
    }

    protected Session getSession() {
        return HibernateConnection.getSessionFactory().openSession();
    }

    protected boolean runInSession(Consumer<Session> runnable) {
        try (Session session = this.getSession()) {
            runnable.accept(session);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    protected boolean runTransactionInSession(Consumer<Session> runnable) {
        return this.runInSession((session) -> {
            session.beginTransaction();
            runnable.accept(session);
            session.getTransaction().commit();
        });
    }
}

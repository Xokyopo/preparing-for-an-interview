package ru.gb.orm.hibernate.lesson.dao;

import java.io.Serializable;
import java.util.List;

public interface Repository<E, ID extends Serializable> {
    //добавления
    E persist(E entity);

    //удаления
    boolean deleteById(ID id);

    //обновления сущности
    E update(E entity);

    //выборка всех записей.
    List<E> getAll();

    //выборка записи по ID
    E getById(ID id);
}

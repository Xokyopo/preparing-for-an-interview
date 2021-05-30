package ru.gb.algorithmsanddatastructures.taskN2;

import java.util.*;

public class MyArrayList<E> implements List<E> {
    private static final int DEFAULT_CAPACITY = 15;
    private static final int CRITICAL_FILL_LIMIT_PERCENT = 75;
    private static final int SIZE_INCREASING_RATIO = 75;
    private Object[] arr;
    private int size;

    public MyArrayList() {
        this(DEFAULT_CAPACITY);
    }

    public MyArrayList(int capacity) {
        this.arr = new Object[capacity];
    }

    protected MyArrayList(Object[] arr) {
        this.arr = arr;
        this.size = arr.length;
    }

    @Override
    public int size() {
        return this.size;
    }

    @Override
    public boolean isEmpty() {
        return this.size > 0;
    }

    @Override
    public boolean contains(Object object) {
        for (int i = 0; i <= this.size; i++) {
            if (this.arr[i].equals(object)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public Iterator<E> iterator() {
        return new MyIterator();
    }

    @Override
    public Object[] toArray() {
        return Arrays.copyOf(this.arr, this.size);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T[] toArray(T[] a) {
        if (a.length < this.size) return (T[]) Arrays.copyOf(this.arr, this.size, a.getClass());
        System.arraycopy(this.arr, 0, a, 0, this.size);
        if (a.length > this.size) {
            a[this.size] = null;
        }
        return a;
    }

    @Override
    public boolean add(E e) {
        if (this.isSizeCritical()) this.increasingSize();
        this.arr[this.size] = e;
        this.size++;
        return true;
    }

    @Override
    public boolean remove(Object o) {
        if (this.contains(o)) {
            this.remove(o);
            return true;
        }
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean addAll(Collection<? extends E> c) {
        c.iterator().forEachRemaining(this::add);
        return true;
    }

    @Override
    public boolean addAll(int index, Collection<? extends E> c) {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void clear() {
        Arrays.fill(this.arr, null);
    }

    @Override
    @SuppressWarnings("unchecked")
    public E get(int index) {
        Objects.checkIndex(index, this.size);
        return (E) this.arr[index];
    }

    @Override
    public E set(int index, E element) {
        E result = this.get(index);
        this.arr[index] = element;
        return result;
    }

    @Override
    public void add(int index, E element) {
        if (index == size) {
            this.add(element);
        } else {
            Objects.checkIndex(index, size);
            if (this.isSizeCritical()) this.increasingSize();
            for (int i = size; i > index; i--) {
                this.arr[i] = this.arr[i - 1];
            }
            this.arr[index] = element;
        }
    }

    @Override
    public E remove(int index) {
        E result = this.get(index);
        System.arraycopy(this.arr, index + 1, this.arr, index, this.size - (index + 1));
        this.size--;
        return result;
    }

    @Override
    public int indexOf(Object o) {
        for (int i = 0; i < size; i++) {
            if (this.arr[i].equals(o)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public int lastIndexOf(Object o) {
        for (int i = this.size - 1; i >= 0; i--) {
            if (this.arr[i].equals(o)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public ListIterator<E> listIterator() {
        return this.listIterator(0);
    }

    @Override
    public ListIterator<E> listIterator(int index) {
        throw new UnsupportedOperationException();
    }

    @Override
    public List<E> subList(int fromIndex, int toIndex) {
        if (fromIndex < 0 || toIndex > size || fromIndex > toIndex) {
            throw new IndexOutOfBoundsException(String.format("fromIndex: %s ;toIndex: %s ; size: %s", fromIndex, toIndex, this.size));
        }

        return (fromIndex == toIndex) ? new MyArrayList<>() : new MyArrayList<>(Arrays.copyOfRange(this.arr, fromIndex, toIndex));
    }

    public boolean isSizeCritical() {
        return CRITICAL_FILL_LIMIT_PERCENT < this.size * 100 / this.arr.length;
    }

    private void increasingSize() {
        if (this.isSizeCritical()) {
            this.arr = Arrays.copyOf(this.arr, this.size * SIZE_INCREASING_RATIO);
        }
    }

    private class MyIterator implements Iterator<E> {
        private int currentIndex;

        public MyIterator() {
            this.currentIndex = 0;
        }

        @Override
        public boolean hasNext() {
            return this.currentIndex < size;
        }

        @Override
        @SuppressWarnings("unchecked")
        public E next() {
            if (!hasNext()) throw new NoSuchElementException();
            return (E) arr[currentIndex++];
        }
    }
}

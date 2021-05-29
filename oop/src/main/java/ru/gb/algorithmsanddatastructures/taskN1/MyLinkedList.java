package ru.gb.algorithmsanddatastructures.taskN1;

import java.util.*;

public class MyLinkedList<E> extends AbstractSequentialList<E> implements List<E>, Deque<E> {
    private final Node<E> first = new Node<>(null);
    private final Node<E> last = new Node<>(null);
    private int size;

    {
        first.next = last;
        last.previous = first;
    }

    @Override
    public ListIterator<E> listIterator(int index) {
        if (index > size || index < 0) {
            throw new NoSuchElementException(String.format("index: %s ; size: %s", index, this.size));
        }
        return new MyIterator(index);
    }

    @Override
    public void addFirst(E e) {
        (new Node<>(e)).insertBetween(this.first, (this.size < 1) ? this.last : this.first.next);
        this.size++;
    }

    @Override
    public void addLast(E e) {
        (new Node<>(e)).insertBetween((this.size < 1) ? this.first : this.last.previous, this.last);
        this.size++;
    }

    @Override
    public boolean offerFirst(E e) {
        this.addFirst(e);
        return true;
    }

    @Override
    public boolean offerLast(E e) {
        this.addLast(e);
        return true;
    }

    @Override
    public E removeFirst() {
        if (this.size < 1) throw new NoSuchElementException("list is empty");
        return this.pollFirst();
    }

    @Override
    public E removeLast() {
        if (this.size < 1) throw new NoSuchElementException("list is empty");
        return this.pollFirst();
    }

    @Override
    public E pollFirst() {
        if (this.size < 1) return null;
        E result = this.first.next.value;
        this.first.next.remove();
        this.size--;
        return result;
    }

    @Override
    public E pollLast() {
        if (this.size < 1) return null;

        E result = this.last.previous.value;
        this.last.previous.remove();
        this.size--;
        return result;
    }

    @Override
    public E getFirst() {
        if (this.size < 1) throw new NoSuchElementException("list is empty");
        return this.first.next.value;
    }

    @Override
    public E getLast() {
        if (this.size < 1) throw new NoSuchElementException("list is empty");
        return this.last.previous.value;
    }

    @Override
    public E peekFirst() {
        return (this.size > 0) ? this.first.next.value : null;
    }

    @Override
    public E peekLast() {
        return (this.size > 0) ? this.last.previous.value : null;
    }

    @Override
    public boolean removeFirstOccurrence(Object o) {
        if (this.size < 1) return false;

        Iterator<E> iterator = this.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().equals(o)) {
                iterator.remove();
                return true;
            }
        }

        return false;
    }

    @Override
    public boolean removeLastOccurrence(Object o) {
        if (this.size < 1) return false;

        Iterator<E> iterator = this.descendingIterator();
        while (iterator.hasNext()) {
            if (iterator.next().equals(o)) {
                iterator.remove();
                return true;
            }
        }

        return false;
    }

    @Override
    public boolean offer(E e) {
        return this.offerLast(e);
    }

    @Override
    public E remove() {
        return this.removeLast();
    }

    @Override
    public E poll() {
        return this.pollFirst();
    }

    @Override
    public E element() {
        return this.getFirst();
    }

    @Override
    public E peek() {
        return this.getFirst();
    }

    @Override
    public void push(E e) {
        this.addFirst(e);
    }

    @Override
    public E pop() {
        return this.removeFirst();
    }

    @Override
    public int size() {
        return this.size;
    }

    @Override
    public Iterator<E> descendingIterator() {
        return new MyDescendingIterator();
    }

    private Node<E> getByIndex(int index) {
        Node<E> node = this.first;
        for (int i = index; i >= 0; i--) {
            node = node.next;
        }
        return node;
    }

    private static class Node<E> {
        public E value;
        public Node<E> next;
        public Node<E> previous;

        public Node(E value) {
            this.value = value;
        }

        public void insertBetween(Node<E> left, Node<E> right) {
            this.next = right;
            this.previous = left;
            left.next = this;
            right.previous = this;
        }

        public void remove() {
            this.previous.next = this.next;
            this.next.previous = this.previous;
            this.next = null;
            this.previous = null;
        }
    }

    private class MyDescendingIterator implements Iterator<E> {
        private Node<E> current;

        public MyDescendingIterator() {
            this.current = last.previous;
        }

        @Override
        public boolean hasNext() {
            return current != null;
        }

        @Override
        public E next() {
            if (!hasNext()) throw new NoSuchElementException();
            E result = this.current.value;
            this.current = this.current.previous;
            return result;
        }
    }

    private class MyIterator implements ListIterator<E> {
        private Node<E> lastReturned;
        private Node<E> current;
        private int currentIndex;


        public MyIterator(int index) {
            this.current = (index == size) ? last : getByIndex(index);
            this.currentIndex = (index < 0) ? size + index : index;
        }

        @Override
        public boolean hasNext() {
            return this.currentIndex < size;
        }

        @Override
        public E next() {
            if (!hasNext()) throw new NoSuchElementException();
            this.lastReturned = this.current;
            this.current = this.current.next;
            currentIndex++;
            return lastReturned.value;
        }

        @Override
        public boolean hasPrevious() {
            return this.currentIndex > 0;
        }

        @Override
        public E previous() {
            if (!hasPrevious()) throw new NoSuchElementException();
            this.current = this.current.previous;
            this.lastReturned = current;
            currentIndex--;
            return this.lastReturned.value;
        }

        @Override
        public int nextIndex() {
            return this.currentIndex;
        }

        @Override
        public int previousIndex() {
            return this.currentIndex - 1;
        }

        @Override
        public void remove() {
            if (this.lastReturned != null) {
                this.lastReturned.remove();
                this.lastReturned = null;
                currentIndex--;
                size--;
            }
        }

        @Override
        public void set(E e) {
            if (this.lastReturned != null) {
                this.lastReturned.value = e;
            }
        }

        @Override
        public void add(E e) {
            (new Node<>(e)).insertBetween(this.current.previous, this.current);
            this.lastReturned = null;
            this.currentIndex++;
            size++;
        }
    }

}


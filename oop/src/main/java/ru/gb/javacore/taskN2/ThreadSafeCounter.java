package ru.gb.javacore.taskN2;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

//Реализовать потокобезопасный счетчик с помощью интерфейса Lock.
public class ThreadSafeCounter {
    private final Lock locker;
    private int count;

    public ThreadSafeCounter() {
        this(0);
    }

    public ThreadSafeCounter(int count) {
        this.count = count;
        this.locker = new ReentrantLock();
    }

    public static void main(String[] args) {
        ThreadSafeCounter counter = new ThreadSafeCounter();

        for (int i = 0; i < 10; i++) {
            final int threadCount = i;
            new Thread(() -> {
                while (true) {
                    System.out.println(threadCount + " поток получил = " + counter.increasedAndGet());
                }
            }).start();
        }

    }

    public int increasedAndGet() {
        try {
            if (this.locker.tryLock(600, TimeUnit.SECONDS)) {
                Thread.sleep(1000);
                return ++this.count;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            this.locker.unlock();
        }
        throw new RuntimeException("Not increasing");
    }
}

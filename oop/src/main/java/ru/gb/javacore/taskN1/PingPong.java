package ru.gb.javacore.taskN1;

import java.util.function.Supplier;

//Реализовать программу, в которой два потока поочередно пишут ping и pong
public class PingPong implements Runnable {
    private boolean repeating = true;
    private boolean switcher = false;

    public static void main(String[] args) {
        PingPong pingPong = new PingPong();
        pingPong.run();
    }

    @Override
    public void run() {
        new Thread(() -> this.repeatMessage("Ping", () -> !this.switcher)).start();
        new Thread(() -> this.repeatMessage("Pong", () -> this.switcher)).start();

    }

    public void stop() {
        this.repeating = false;
    }

    public synchronized void repeatMessage(String message, Supplier<Boolean> canRepeat) {
        while (this.repeating) {
            while (!canRepeat.get()) {
                this.catchException(this::wait);
            }
            System.out.println(message);
            this.switcher = !this.switcher;
            this.notify();
        }
    }

    private void catchException(MyRunnable runnable) {
        try {
            runnable.run();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private interface MyRunnable {
        void run() throws InterruptedException;
    }

}

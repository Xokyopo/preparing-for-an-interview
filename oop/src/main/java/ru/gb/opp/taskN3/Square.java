package ru.gb.opp.taskN3;

public class Square extends Shape<Integer> {
    private int a;

    public Square(int a) {
        this.a = a;
    }

    @Override
    Integer getPerimeter() {
        return a * 4;
    }
}

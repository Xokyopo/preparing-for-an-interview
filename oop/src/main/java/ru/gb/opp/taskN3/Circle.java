package ru.gb.opp.taskN3;

public class Circle extends Shape<Double> {
    private int radius;

    public Circle(int radius) {
        this.radius = radius;
    }

    @Override
    Double getPerimeter() {
        return (radius * 2 * Math.PI);
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }
}

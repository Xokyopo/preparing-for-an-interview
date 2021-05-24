package ru.gb.opp.taskN2;

public class Triangle extends Shape<Integer> {
    private int AB;
    private int BC;
    private int AC;

    public Triangle(int AB, int BC, int AC) {
        this.AB = AB;
        this.BC = BC;
        this.AC = AC;
    }

    public int getAB() {
        return AB;
    }

    public void setAB(int AB) {
        this.AB = AB;
    }

    public int getBC() {
        return BC;
    }

    public void setBC(int BC) {
        this.BC = BC;
    }

    public int getAC() {
        return AC;
    }

    public void setAC(int AC) {
        this.AC = AC;
    }

    @Override
    Integer getPerimeter() {
        return this.AB + this.AC + this.BC;
    }
}

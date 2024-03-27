package com.example.java;

public class Enemy2 implements Enemy {
    private int health = 40;
    private int damage = 10;
    private float xLoc;
    private float yLoc;
    private int pathDir = 1;
    private int money = 20;
    public Enemy2() {
        this.xLoc = (float) 37.5;
        this.yLoc = (float) 337.5;
    }

    @Override
    public float getHealthPercentage() {
        return ((float) health) / ((float) 40);
    }

    @Override
    public int getHealth() {
        return health;
    }

    @Override
    public void setHealth(int health) {
        this.health = health;
    }

    @Override
    public int getDamage() {
        return damage;
    }

    @Override
    public float getxLoc() {
        return xLoc;
    }

    @Override
    public void setxLoc(float xLoc) {
        this.xLoc = xLoc;
    }

    @Override
    public float getyLoc() {
        return yLoc;
    }

    @Override
    public void setyLoc(float yLoc) {
        this.yLoc = yLoc;
    }

    public int getPathDir() {
        return pathDir;
    }

    public void setPathDir(int pathDir) {
        this.pathDir = pathDir;
    }

    @Override
    public int getMoney() {
        return money;
    }
}

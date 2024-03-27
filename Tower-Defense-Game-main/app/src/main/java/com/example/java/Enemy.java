package com.example.java;

public interface Enemy {
    int getDamage();
    int getHealth();
    void setHealth(int health);
    float getxLoc();
    void setxLoc(float xLoc);
    float getyLoc();
    void setyLoc(float yLoc);
    int getPathDir();
    void setPathDir(int pathDir);
    int getMoney();
    float getHealthPercentage();
}

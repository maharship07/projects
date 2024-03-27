package com.example.java;

import java.util.List;
//Regular Projectile Tower
public class Tower1 implements TowerInterface {
    private int damage = 5;
    private int range = 2;
    private int xLoc;
    private int yLoc;
    private boolean isUpgraded = false;
    private int tower = 1;

    public Tower1(int x, int y) {
        xLoc = x;
        yLoc = y;
    }

    @Override
    public void setUpgrade(boolean upgrade) {
        this.isUpgraded = upgrade;
    }

    @Override
    public boolean getUpgrade() {
        return isUpgraded;
    }



    @Override
    public List<Enemy> attack(List<Enemy> enemyArray, List<Float> attackArray) {
        for (int i = 0; i < enemyArray.size(); i++) {
            if (Math.abs(enemyArray.get(i).getxLoc() - xLoc - 37.5) <= (150 * range)
                    && Math.abs(enemyArray.get(i).getyLoc() - yLoc - 37.5) <= (150 * range)
                    && enemyArray.get(i).getHealth() != 0) {
                enemyArray.get(i).setHealth(enemyArray.get(i).getHealth() - damage);
                attackArray.add(1F);
                attackArray.add((float) (xLoc + 75));
                attackArray.add((float) (yLoc + 75));
                attackArray.add((float) (enemyArray.get(i).getxLoc() + 37.5));
                attackArray.add((float) (enemyArray.get(i).getyLoc() + 37.5));
                break;
            }
        }
        return enemyArray;
    }

    public int getTower() {
        return 1;
    }

    public static int initCost(int difficulty) {
        switch (difficulty) {
        case 0:
            return 25;
        case 1:
            return 50;
        case 2:
            return 100;
        default:
            break;
        }
        return 0;
    }

    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    public int getRange() {
        return range;
    }

    public void setRange(int range) {
        this.range = range;
    }

    public int getxLoc() {
        return xLoc;
    }

    public void setxLoc(int xLoc) {
        this.xLoc = xLoc;
    }

    public int getyLoc() {
        return yLoc;
    }

    public void setyLoc(int yLoc) {
        this.yLoc = yLoc;
    }
}

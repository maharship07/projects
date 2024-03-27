package com.example.java;

import java.util.List;
//Sniper Tower? Cooldown?
public class Tower3 implements TowerInterface {
    private int damage = 15;
    private int range = 5;
    private int cooldown = 0;
    private int xLoc;
    private int yLoc;
    private boolean isUpgraded = false;
    private int tower = 3;

    public Tower3(int x, int y) {
        xLoc = x;
        yLoc = y;
    }


    @Override
    public List<Enemy> attack(List<Enemy> enemyArray, List<Float> attackArray) {
        if (cooldown == 2) {
            cooldown--;
            return enemyArray;
        }
        for (int i = 0; i < enemyArray.size(); i++) {
            if (Math.abs(enemyArray.get(i).getxLoc() - xLoc - 37.5) <= (150 * range)
                    && Math.abs(enemyArray.get(i).getyLoc() - yLoc - 37.5) <= (150 * range)
                    && enemyArray.get(i).getHealth() != 0) {
                enemyArray.get(i).setHealth(enemyArray.get(i).getHealth() - damage);
                attackArray.add(3F);
                attackArray.add((float) (xLoc + 75));
                attackArray.add((float) (yLoc + 75));
                attackArray.add((float) (enemyArray.get(i).getxLoc() + 37.5));
                attackArray.add((float) (enemyArray.get(i).getyLoc() + 37.5));
                break;
            }
        }
        cooldown++;
        return enemyArray;
    }


    public static int initCost(int difficulty) {
        switch (difficulty) {
        case 0:
            return 100;
        case 1:
            return 200;
        case 2:
            return 400;
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

    @Override
    public void setUpgrade(boolean upgrade) {
        this.isUpgraded = upgrade;
    }

    @Override
    public boolean getUpgrade() {
        return isUpgraded;
    }

    public int getTower() { return tower; }


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

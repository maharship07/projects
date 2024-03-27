package com.example.java;

import java.util.List;

public interface TowerInterface {
    //define other shared methods

    int getxLoc();
    int getyLoc();
    public int getDamage();
    public int getRange();
    public void setRange(int range);
    public void setDamage(int damage);
    public void setUpgrade(boolean upgrade);
    public boolean getUpgrade();
    public int getTower();

    int DAMAGE = 0;
    int RANGE = 1;

    default List<Enemy> attack(List<Enemy> enemyArray, List<Float> attackArray) {
        for (int i = 0; i < enemyArray.size(); i++) {
            if (Math.abs(enemyArray.get(i).getxLoc() - getxLoc() - 37.5) < (150 * RANGE)
                    && Math.abs(enemyArray.get(i).getyLoc() - getyLoc() - 37.5) < (150 * RANGE)
                    && enemyArray.get(i).getHealth() != 0) {
                enemyArray.get(i).setHealth(enemyArray.get(i).getHealth() - DAMAGE);
                break;
            }
        }
        return enemyArray;
    }
}

package com.example.java;

public class UpgradeDamage implements Upgrade {
    private double multiplier = 2;
    private int cost = 100;


    /**
     * Multiply the tower's damage by 1.5 only if it hasn't already been upgraded
     *
     * @param tower
     */
    @Override
    public void upgrade(TowerInterface tower) {
        if (!tower.getUpgrade()) {
            tower.setDamage((int) (tower.getDamage() * multiplier));
            tower.setUpgrade(true);
        }
    }

    @Override
    public int getCost() {
        return cost;
    }
}

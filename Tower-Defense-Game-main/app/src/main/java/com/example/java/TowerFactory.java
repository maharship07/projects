package com.example.java;

public class TowerFactory {
    public static TowerInterface getTower(int type, int x, int y) {
        if (type == 1) {
            return new Tower1(x, y);
        }
        if (type == 2) {
            return new Tower2(x, y);
        }
        if (type == 3) {
            return new Tower3(x, y);
        }
        return null;
    }

    public static int getTowerCost(int type, int diff) {
        if (type == 1) {
            return Tower1.initCost(diff);
        }
        if (type == 2) {
            return Tower2.initCost(diff);
        }
        if (type == 3) {
            return Tower3.initCost(diff);
        }
        return 0;
    }
}

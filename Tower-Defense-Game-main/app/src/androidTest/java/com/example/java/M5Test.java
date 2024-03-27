package com.example.java;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.ArrayList;
import java.util.List;

@RunWith(AndroidJUnit4.class)
public class M5Test {
    @Rule
    public ActivityTestRule<GameScreen> activityRule2 =
            new ActivityTestRule<>(GameScreen.class);

    public List<Enemy> enemyListSetup() {
        List<Enemy> enemyList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            enemyList.add(new Enemy1());
        }
        enemyList.get(4).setxLoc(750);
        enemyList.get(4).setyLoc(150);
        enemyList.get(3).setxLoc(1050);
        enemyList.get(3).setyLoc(450);
        enemyList.get(2).setxLoc(1200);
        enemyList.get(2).setyLoc(600);
        enemyList.get(1).setxLoc(1350);
        enemyList.get(1).setyLoc(450);
        enemyList.get(0).setxLoc(1650);
        enemyList.get(0).setyLoc(150);
        return enemyList;
    }

    public List<Enemy> enemyListSetup1() {
        List<Enemy> enemyList = new ArrayList<>();
        enemyList.add(new Enemy1());

        enemyList.get(0).setxLoc(0);
        enemyList.get(0).setyLoc(0);
        return enemyList;
    }

    @Test //M5 Test by Ian Westcott
    public void tower1AttackTest() {
        TowerInterface tower = new Tower1(1200, 450);
        List<Enemy> enemyList = enemyListSetup();
        List<Float> attackArray = new ArrayList<>();
        tower.attack(enemyList, attackArray);
        assertEquals(enemyList.get(0).getHealthPercentage(), 1, 0);
        assertNotEquals(enemyList.get(1).getHealthPercentage(), 1);
        assertEquals(enemyList.get(2).getHealthPercentage(), 1, 0);
        assertEquals(enemyList.get(3).getHealthPercentage(), 1, 0);
        assertEquals(enemyList.get(4).getHealthPercentage(), 1, 0);
    }

    @Test //M5 Test by Ian Westcott
    public void tower2AttackTest() {
        TowerInterface tower = new Tower2(1200, 450);
        List<Enemy> enemyList = enemyListSetup();
        List<Float> attackArray = new ArrayList<>();
        tower.attack(enemyList, attackArray);
        assertEquals(enemyList.get(0).getHealthPercentage(), 1, 0);
        assertNotEquals(enemyList.get(1).getHealthPercentage(), 1);
        assertNotEquals(enemyList.get(2).getHealthPercentage(), 1);
        assertNotEquals(enemyList.get(3).getHealthPercentage(), 1);
        assertEquals(enemyList.get(4).getHealthPercentage(), 1, 0);
    }

    @Test // M5 Test by Manu Gupta
    public void testTowerFactoryPosition() {
        TowerFactory factory = new TowerFactory();
        TowerInterface tower1 = factory.getTower(1, 2, 3);
        TowerInterface tower2 = factory.getTower(2, 3, 4);
        TowerInterface tower3 = factory.getTower(3, 5, 5);

        assertEquals(tower1.getxLoc(), 2);
        assertEquals(tower1.getyLoc(), 3);
        assertEquals(tower2.getxLoc(), 3);
        assertEquals(tower2.getyLoc(), 4);
        assertEquals(tower3.getxLoc(), 5);
        assertEquals(tower3.getyLoc(), 5);
    }

    @Test // M5 Test by Manu Gupta
    public void testTowerFactoryType() {
        TowerFactory factory = new TowerFactory();
        Tower1 tower1 = (Tower1) factory.getTower(1, 2, 3);
        Tower2 tower2 = (Tower2) factory.getTower(2, 3, 4);
        Tower3 tower3 = (Tower3) factory.getTower(3, 5, 5);

        assertEquals(tower1.getDamage(), 5);
        assertEquals(tower1.getRange(), 2);
        assertEquals(tower2.getDamage(), 5);
        assertEquals(tower2.getRange(), 1);
        assertEquals(tower3.getDamage(), 15);
        assertEquals(tower3.getRange(), 5);
    }

    @Test //M5 Test by Vedant Amin
    public void testTower3Attack() {
        TowerInterface tower = new Tower3(1200, 450);
        List<Enemy> enemyList = enemyListSetup();
        List<Float> attackArray = new ArrayList<>();
        tower.attack(enemyList, attackArray);
        assertEquals(enemyList.get(0).getHealthPercentage(), 0.25, 0);
        assertNotEquals(enemyList.get(1).getHealthPercentage(), 1);
        assertNotEquals(enemyList.get(2).getHealthPercentage(), 1);
        assertNotEquals(enemyList.get(3).getHealthPercentage(), 1);
        assertEquals(enemyList.get(4).getHealthPercentage(), 1, 0);
    }

    @Test //M5 Test by Vedant Amin
    public void testRemoveEnemy() {
        GameScreen gs = activityRule2.getActivity();
        Enemy1 enemy1 = new Enemy1();
        Enemy2 enemy2 = new Enemy2();
        Enemy3 enemy3 = new Enemy3();
        gs.getEnemyArray().add(enemy1);
        gs.getEnemyArray().add(enemy2);
        gs.getEnemyArray().add(enemy3);
        enemy1.setHealth(50);
        Tower1 tower = new Tower1(1200, 450);
        for (int i = 0; i < 10; i++) {
            enemy1.setHealth(enemy1.getHealth() - tower.getDamage());
        }
        for (int i = 0; i < gs.getEnemyArray().size(); i++) {
            if (gs.getEnemyArray().get(i).getHealth() == 0) {
                gs.removeDeadEnemies();
            }
        }
        assertEquals(2, gs.getEnemyArray().size());
    }

    @Test //M5 Test by Maharshi Patel
    public void enemyAttackMonumentTest() {
        GameScreen scenario = activityRule2.getActivity();
        scenario.initValues(0);
        for (int i = 0; i < 5; i++) {
            scenario.attack(new Enemy1());
        }
        assertEquals(125, scenario.getHealth());
        assertEquals(200, scenario.getMoney());
    }

    @Test //M5 Test by Maharshi Patel
    public void gettingMoneyTest() {
        Enemy2 enemy2 = new Enemy2();

        Tower1 tower = new Tower1(1200, 450);
        int money = 0;
        for (int i = 0; i < 8; i++) {
            enemy2.setHealth(enemy2.getHealth() - tower.getDamage());
        }
        if (enemy2.getHealth() <= 0) {
            money = enemy2.getMoney();
        }
        assertEquals(20, money);
    }

    @Test //M5 Test by Terry Ma
    public void tower3AttackRangeTest() {
        TowerInterface tower = new Tower3(1200, 450);
        List<Enemy> enemyList = enemyListSetup1();
        List<Float> attackArray = new ArrayList<>();
        List<Enemy> enemyArray = tower.attack(enemyList, attackArray);
        assertEquals(enemyList, enemyArray);
    }

    @Test //M5 Test by Terry Ma
    public void tower2AttackRangeTest() {
        TowerInterface tower = new Tower2(1200, 450);
        List<Enemy> enemyList = enemyListSetup1();
        List<Float> attackArray = new ArrayList<>();
        List<Enemy> enemyArray = tower.attack(enemyList, attackArray);
        assertEquals(enemyList, enemyArray);
    }
}

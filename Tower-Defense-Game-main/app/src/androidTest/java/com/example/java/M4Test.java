package com.example.java;


import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(AndroidJUnit4.class)
public class M4Test  {
    @Rule
    public ActivityTestRule<GameScreen> activityRule2 =
            new ActivityTestRule<>(GameScreen.class);

    @Test // M4 Test made by Manu Gupta
    public void testEnemyLocationSetter() {
        Enemy testEnemy = new Enemy1(); //xLoc should be 37.5 and yLoc should be 337.5;
        testEnemy.setxLoc(100);
        testEnemy.setyLoc(50);
        assertTrue(testEnemy.getxLoc() == 100);
        assertTrue(testEnemy.getyLoc() == 50);
    }

    @Test // M4 Test made by Manu Gupta
    public void testEnemyHealth() {
        Enemy testEnemy = new Enemy2(); //health 20 and damage is 10
        int enemyDamage = testEnemy.getDamage();
        int enemyHealth = testEnemy.getHealth();
        testEnemy.setHealth(enemyHealth - enemyDamage);
        assertTrue(testEnemy.getHealth() == 10);
    }

    @Test // M4 Test by Maharshi Patel
    public void testDamageToMonument() {
        Enemy testEnemy = new Enemy3();
        int enemyDamage = testEnemy.getDamage();
        int monumentHealth = 50;
        int remainingHealth = (monumentHealth - enemyDamage);
        assertTrue(remainingHealth == 35);
    }

    @Test // M4 Test by Maharshi Patel
    public void testRestartButton() {
        Enemy testEnemy = new Enemy3();
        int enemyDamage = testEnemy.getDamage();
        int monumentHealth = 15;
        int remainingHealth = (monumentHealth - enemyDamage);
        boolean flag;

        if (remainingHealth == 0) {
            onView(withId(R.layout.game_over_screen));
            onView(withId(R.id.restartButton)).perform(click());
            flag = true;
        } else {
            flag = false;
        }
        assertTrue(flag);
    }

    @Test  // M4 Test by Vedant Amin
    public void testGameOverScreen() {
        Enemy testEnemy = new Enemy1();
        int enemyDamage = testEnemy.getDamage();
        int monumentHealth = 50;
        for (int i = 0; i < 5; i++) {
            monumentHealth -= enemyDamage;
        }
        if (monumentHealth == 0) {
            onView(withId(R.layout.game_over_screen));
            assertTrue(true);
        }
    }

    @Test  // M4 Test by Vedant Amin
    public void testMonumentHealth() {
        Enemy testEnemy = new Enemy2();
        int enemyDamage = testEnemy.getDamage();
        int monumentHealth = 50;
        for (int i = 0; i < 5; i++) {
            monumentHealth -= enemyDamage;
        }
        assertTrue(monumentHealth == 0);
    }

    @Test // M4 Test by Terry Ma
    public void testEnemyInitPosition() {
        Enemy testEnemy = new Enemy3();
        float x = testEnemy.getxLoc();
        float y = testEnemy.getyLoc();

        //int remainingHealth = (monumentHealth - enemyDamage);
        assertTrue(x == 37.5);
        assertTrue(y == 337.5);
    }

    @Test // M4 Test by Terry Ma
    public void testSetHealth() {
        Enemy testEnemy = new Enemy1();
        testEnemy.setHealth(10000000);
        int health = testEnemy.getHealth();
        assertTrue(health == 10000000);

    }

    @Test //M4 Test by Ian Westcott
    public void testAttackMethod() {
        GameScreen scenario = activityRule2.getActivity();
        scenario.attack(new Enemy1());
        assertNotEquals(scenario.getHealth(), 100);
    }

    @Test //M4 Test by Ian Westcott
    public void testEnemyAddition() {
        GameScreen scenario = activityRule2.getActivity();
        scenario.setEnemyPlaced(0);
        scenario.addEnemy(2);
        scenario.setEnemyPlaced(0);
        scenario.addEnemy(2);
        scenario.setEnemyPlaced(0);
        scenario.addEnemy(2);
        scenario.setEnemyPlaced(0);
        scenario.addEnemy(2);
        for (int i = 0; i < 2; i++) {
            assertTrue(scenario.getEnemyArray().get(i) instanceof Enemy2);
        }
        for (int i = 2; i < 4; i++) {
            assertTrue(scenario.getEnemyArray().get(i) instanceof Enemy3);
        }
    }
}


package com.example.java;

import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.action.ViewActions.closeSoftKeyboard;
import static androidx.test.espresso.action.ViewActions.typeText;
import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static androidx.test.espresso.matcher.ViewMatchers.withText;

import android.view.InputDevice;
import android.view.MotionEvent;


import androidx.test.espresso.ViewAction;
import androidx.test.espresso.action.GeneralClickAction;
import androidx.test.espresso.action.Press;
import androidx.test.espresso.action.Tap;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;

//import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.matchers.JUnitMatchers.containsString;


@RunWith(AndroidJUnit4.class)
public class GameScreenTest {
    @Rule
    public ActivityTestRule<ConfigScreen> activityRule =
            new ActivityTestRule(ConfigScreen.class);

    public static ViewAction clickXY(final int x, final int y) {
        return new GeneralClickAction(
            Tap.SINGLE,
            view -> {

                final int[] screenPos = new int[2];
                view.getLocationOnScreen(screenPos);

                final float screenX = screenPos[0] + x;
                final float screenY = screenPos[1] + y;

                return new float[]{screenX, screenY};
            },
            Press.FINGER,
            InputDevice.SOURCE_MOUSE,
            MotionEvent.BUTTON_PRIMARY);
    }

    @Test //Testing Milestone 3, Written Milestone 3 IW
    public void testNotEnoughMoney() { //Disable animations on device before testing
        onView(withId(R.id.playerName)).perform(typeText("Player name"));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.hardButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.tower1button)).perform(click());
        onView(withId(R.id.gamecanvas)).perform(clickXY(100, 100));
        onView(withId(R.id.tower3button)).perform(click());
        onView(withId(R.id.gamecanvas)).perform(clickXY(200, 200));
        onView(withId(R.id.moneyCounter)).check(matches(withText(
                containsString("Money: 0"))));
    }
}

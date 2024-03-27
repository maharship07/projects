package com.example.java;
import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.action.ViewActions.closeSoftKeyboard;
import static androidx.test.espresso.action.ViewActions.typeText;
import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static androidx.test.espresso.matcher.ViewMatchers.withText;

import android.content.Context;
import androidx.test.platform.app.InstrumentationRegistry;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;

//import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.*;
import static org.junit.matchers.JUnitMatchers.containsString;

/**
 * Instrumented test, which will execute on an Android device.
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
@RunWith(AndroidJUnit4.class)
public class ConfigScreenTest  {
    @Rule
    public ActivityTestRule<ConfigScreen> activityRule =
            new ActivityTestRule(ConfigScreen.class);

    @Test   // Testing Milestone 2 (Maharshi)
    public void testNormalName() {
        onView(withId(R.id.playerName)).perform(typeText("Yay"));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.normalButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.healthCounter)).check(matches(isDisplayed()));

    }

    @Test  // Testing Milestone 2  (Manu)
    public void testBlankName() {
        onView(withId(R.id.playerName)).perform(typeText(""));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.normalButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.normalButton)).check(matches(isDisplayed()));
    }

    @Test  // Testing Milestone 2 (Manu)
    public void testWhiteSpaceName() {
        onView(withId(R.id.playerName)).perform(typeText("   "));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());
        onView(withId(R.id.normalButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.normalButton)).check(matches(isDisplayed()));
    }

    @Test  // Testing Milestone 2 (vedant)
    public void testEasyConfig() {
        onView(withId(R.id.playerName)).perform(typeText("Player name"));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.easyButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.healthCounter)).check(matches(withText(
                containsString("Health: 150"))));
        onView(withId(R.id.moneyCounter)).check(matches(withText(
                containsString("Money: 200"))));
    }


    @Test  // Testing Milestone 2 (vedant)
    public void testNormalConfig() {
        onView(withId(R.id.playerName)).perform(typeText("Player name"));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.normalButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.healthCounter)).check(matches(withText(
                containsString("Health: 100"))));
        onView(withId(R.id.moneyCounter)).check(matches(withText(
                containsString("Money: 150"))));
    }

    @Test  // Testing Milestone 2 (Maharshi)
    public void testHardConfig() {
        onView(withId(R.id.playerName)).perform(typeText("Player name"));
        onView(withId(R.id.playerName)).perform(closeSoftKeyboard());

        onView(withId(R.id.hardButton)).perform(click());
        onView(withId(R.id.startGame)).perform(click());
        onView(withId(R.id.healthCounter)).check(matches(withText(
                containsString("Health: 50"))));
        onView(withId(R.id.moneyCounter)).check(matches(withText(
                containsString("Money: 100"))));
    }

    @Test  // Testing Milestone 2, Written For Milestone 3 IW
    public void testDifficultyDisplay() {
        onView(withId(R.id.easyButton)).perform(click());
        onView(withId(R.id.diffText)).check(matches(withText(
                containsString("Current Difficulty: Easy"))));
        onView(withId(R.id.normalButton)).perform(click());
        onView(withId(R.id.diffText)).check(matches(withText(
                containsString("Current Difficulty: Normal"))));
        onView(withId(R.id.hardButton)).perform(click());
        onView(withId(R.id.diffText)).check(matches(withText(
                containsString("Current Difficulty: Hard"))));
    }


    @Test  // Testing Milestone 2
    public void useAppContext() {
        // Context of the app under test.
        Context appContext = InstrumentationRegistry.getInstrumentation().getTargetContext();
        assertEquals("com.example.java", appContext.getPackageName());
    }


}



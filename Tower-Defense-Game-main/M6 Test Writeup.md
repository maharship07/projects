M6 Tests

Manu Gupta:

    upgradeDamageTest():
        This test checks whether upgrading a tower increases the damage as expected. Because towers should only be able to be upgraded once, this test
        also checks what happens when an upgrade is attempted on a tower twice.

    upgradeRangeTest()
       This test checks whether using the range upgrade will double the range as expected. Since towers can only be upgraded once, this test also verifies
       that the tower doesn't upgrade its range again after its been doubled once already.

Vedant Amin:

    testGameWinScreen():
        This tests checks whether the game transitions to the game_win_screen when the towers eliminates the final boss.

    bossDamageMonument():
        This tests checks if the final boss can attack the monument and whether the monument takes damages or not and after attacking
        if the health decreases to zero.

Ian Westcott:

    enemiesKilledTest():
        This test checks to make sure the enemies killed statistic, one of the statistics required to be displayed on game end, updates correctly.
        This is done by calling the removeDeadEnemies() method and checking whether the method correctly updates the statistic based on the number of dead enemies in the enemy array.

    totalDamageTakenTest():
        This test checks to make sure the total damage taken statistic, another one of the statistic required to be displayed on game end, updates correctly.
        This is done by calling the attack method for each of the types of normal enemies and checking whether the total damage taken statistic equals the sum of the damage of each enemy.

Maharshi Patel:

    testMoneySpend():
        This test will check how much money will be spent on upgrades and determine whether it sets the correct value for the total amount spent.
        It also expects to get the total amount of money spent to update properly.

    testUpgradeTowerWithMoney():
        This test checks if you can exhaust all your money initially set up and then keep on buying tower upgrades until money left is 0.
        It shows that player's money is correctly updated with ensuring that if the cost goes up of the upgrade, the test will adjust and throw failure.

Terry Ma:

    testBossHealth():
        This tests whether the final boss is initialized to the right health and that it will take damage from the tower

    testBossHealthPercent():
        This test tests if the calculation for how we calculate the health percentage for the boss is correct or not. If the boss has just been initialized then it should have a health percent of 1.
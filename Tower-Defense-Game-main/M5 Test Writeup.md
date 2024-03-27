M5 Tests

Ian Westcott:

    tower1AttackTest():
        This tests checks the attack method of Tower 1, the standard projectile tower, against a list of enemies, some in range and some out of range. The tests checks to make sure the tower attacks only the enemy furthest along the path that is within range of the tower. Thus, the test makes ensures that combat function of tower 1 works correctly, only attacking enemies within range and only attacking a single enemy at a time.

    tower2AttackTest():
        This tests checks the attack method of Tower 2, the AOE tower, against a list of enemies, some in range and some out of range. The tests checks to make sure the tower attacks every enemy in range of the tower. Thus, the test makes ensures that combat function of tower 1 works correctly, only attacking enemies within range and preforming its function of damaging every enemy in range.
Manu Gupta:

    testTowerFactoryPosition(): 
        This test checks whether the tower factory class correctly instantiates tower instances to have the correct location. It does this by testing a few dummy values for all the tower classes. 

    testTowerFactoryType():
        This test checks whether the tower factory class correctly instantiates the correct tower when different values of diff are passed in. It does this by testing the damage and range values of each 
tower when created 

Vedant Amin:

    testTower3Attack():
        This test is for sniper tower of type Tower 3 against a list of enemies. The test makes sure that the tower only attacks enemies along the path that are within the attack range of the tower. Hence, it makes sure that Tower 3 has a fully functioning combat.
    
    testRemoveEnemies():
        This test checks the functionality of removeDeadEnemies() which basically removes the enemies once its health reaches 0. It does that by creating a list of dummy enemies and killing some of them and checking if removeDeadEnemies() removes it from the screen.

Maharshi Patel:

    enemyAttackMonumentTest():
        This test checks setting difficulty level, and enemy attacking the monument to check if the health depletes. In addition, it checks the money stays the same since no towers are placed.

    gettingMoneyTest():
        This test will repeatedly hit the enemy with damage and then if it has no health remaining, the player will be able to get money to continue playing the game.

Terry Ma:

    tower3AttackRangeTest():
        This test checks the whether the range of the tower attack is working. If the enemy is outside the range the health should not deplete.
    
    tower2AttackRangeTest():
        This test checks the whether the range of the tower attack is working. If the enemy is outside the range the health should not deplete.

package com.example.java;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class GameOverScreen extends AppCompatActivity {
    @SuppressLint("SetTextI18n")
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.game_over_screen);

        TextView numEnemiesKilledStat = findViewById(R.id.numEnemiesKilledOver);
        TextView moneySpentStat = findViewById(R.id.moneySpentOver);
        TextView totalDamageTakenStat = findViewById(R.id.totalDamageTakenOver);

        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            if (totalDamageTakenStat != null) {
                totalDamageTakenStat.setText("Total Damage Taken: "
                        + extras.getInt("totalDamageTaken"));
            }
            if (moneySpentStat != null) {
                moneySpentStat.setText("Money Spent: $" +
                        extras.getInt("moneySpent"));
            }
            if (numEnemiesKilledStat != null) {
                numEnemiesKilledStat.setText("# Enemies Killed: " +
                        extras.getInt("numEnemiesKilled"));
            }
        }
        Button restart = findViewById(R.id.restartButton);
        restart.setOnClickListener(l -> {
            moveToStartScreen();
        });

        Button quit = findViewById(R.id.quit);
        quit.setOnClickListener(l -> {
            finish();
            System.exit(0);
        });
    }
    public void moveToStartScreen() {
        Intent i = new Intent(this, MainActivity.class);
        startActivity(i);
        finish();
    }
}

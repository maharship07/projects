package com.example.java;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

// Custom View Class for use in drawing Towers using Canvas class
public class GameCanvas extends View {
    private final Bitmap tower1 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_1_bitmap), 150, 150, true);
    private final Bitmap tower1Upgraded = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_1_upgraded), 150, 150, true);
    private final Bitmap tower2 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_2_bitmap), 150, 150, true);
    private final Bitmap tower2Upgraded = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_2_upgraded), 150, 150, true);
    private final Bitmap tower3 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_3_bitmap), 150, 150, true);
    private final Bitmap tower3Upgraded = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.tower_3_upgraded), 150, 150, true);
    private final Bitmap enemy1 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.enemy_1), 75, 75, true);
    private final Bitmap enemy2 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.enemy_2), 75, 75, true);
    private final Bitmap enemy3 = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.enemy_3), 75, 75, true);
    private final Bitmap finalBoss = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(
            getResources(), R.drawable.final_boss), 75, 75, true);
    private int move = 0;
    private List<TowerInterface> towerArray = new ArrayList<>();
    private List<Enemy> enemyArray = new ArrayList<Enemy>();
    private List<Float> attackArray = new ArrayList<>();
    private List<Boolean> upgraded = new ArrayList<>();

    public List<Float> getAttackArray() {
        return attackArray;
    }

    public void setAttackArray(List<Float> attackArray) {
        this.attackArray = attackArray;
    }

    public GameCanvas(Context context, AttributeSet attrs) {
        super(context, attrs);
        Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            public void run() {
                invalidate();
            }
        }, 1000);
    }
    //Draw tower at xy coordinates
    public void drawTower(int x, int y, int tower, boolean upgraded, Canvas canvas) {
        if (!upgraded) {
            switch (tower) {
                case 1:
                    canvas.drawBitmap(tower1, (float) x, (float) y, null);
                    break;
                case 2:
                    canvas.drawBitmap(tower2, (float) x, (float) y, null);
                    break;
                case 3:
                    canvas.drawBitmap(tower3, (float) x, (float) y, null);
                    break;
                default:
                    break;
            }
        } else {
            switch (tower) {
                case 1:
                    canvas.drawBitmap(tower1Upgraded, (float) x, (float) y, null);
                    break;
                case 2:
                    canvas.drawBitmap(tower2Upgraded, (float) x, (float) y, null);
                    break;
                case 3:
                    canvas.drawBitmap(tower3Upgraded, (float) x, (float) y, null);
                    break;
                default:
                    break;
            }
        }
    }
    //Add new tower to drawing array
    public void addTower(TowerInterface tower) {
        towerArray.add(tower);
        move = 1;
        invalidate(); //Redraw canvas when tower is added
    }

    public void setEnemyArray(List<Enemy> enemyArray) {
        this.enemyArray = enemyArray;
        move = 0;
        invalidate();
    }

    public void drawAttack(float type, float towerx, float towery, float enemyx, float enemyy,
                           Canvas canvas) {
        Paint paint1 = new Paint();
        Paint paint2 = new Paint();
        Paint paint3 = new Paint();
        paint1.setStrokeWidth(10);
        paint3.setStrokeWidth(10);
        paint1.setColor((255 << 16) | (255 << 8) | 255 | (255 << 24));
        paint2.setColor((255) | (50 << 24));
        paint3.setColor((255 << 16) | (255 << 8) | (255 << 24));
        switch ((int) type) {
        case 1:
            canvas.drawLine(towerx, towery, enemyx, enemyy, paint1);
            break;
        case 2:
            canvas.drawRect(towerx, towery, enemyx, enemyy, paint2);
            break;
        case 3:
            canvas.drawLine(towerx, towery, enemyx, enemyy, paint3);
            break;
        default:
            break;
        }
    }

    public List<Enemy> getEnemyArray() {
        return this.enemyArray;
    }
    public void drawEnemy(List<Enemy> enemyArray, Canvas canvas) {
        Paint paint = new Paint();
        paint.setColor((255 << 16) | (255 << 24));
        for (int i = 0; i < enemyArray.size(); i++) {
            Enemy curr = enemyArray.get(i);
            float x = curr.getxLoc();
            float y = curr.getyLoc();
            if (move == 0) {
                switch (curr.getPathDir()) {
                case 1:
                    if ((x - 37.5) == 0 || (x - 37.5) == 900 || (x - 37.5) == 1500) {
                        curr.setPathDir(2);
                    } else if ((curr.getxLoc() - 37.5) == 450 || (curr.getxLoc() - 37.5) == 1200) {
                        curr.setPathDir(3);
                    }
                    curr.setxLoc(x + 150);
                    break;
                case 2:
                    if ((y - 37.5) == 450 || ((y - 37.5) == 300 && (x - 37.5) == 1650)) {
                        curr.setPathDir(1);
                    }
                    curr.setyLoc(y + 150);
                    break;
                case 3:
                    if ((y - 37.5) == 300) {
                        curr.setPathDir(1);
                    }
                    curr.setyLoc(y - 150);
                    break;
                default:
                    break;
                }
            }
            if (curr instanceof Enemy1) {
                canvas.drawBitmap(enemy1, x, y, null);
            } else if (curr instanceof Enemy2) {
                canvas.drawBitmap(enemy2, x, y, null);
            } else if (curr instanceof Enemy3) {
                canvas.drawBitmap(enemy3, x, y, null);
            } else {
                canvas.drawBitmap(finalBoss, x, y, null);
            }
            canvas.drawRect((float) (x - 25), (float) (y + 77.5),
                    (float) (x + (100 * curr.getHealthPercentage())),
                    (float) (y + 100), paint);
        }
    }
    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        for (int i = 0; i < towerArray.size(); i += 1) { //Draw each tower player has placed
            drawTower(towerArray.get(i).getxLoc(),
                    towerArray.get(i).getyLoc(),
                    towerArray.get(i).getTower(),
                    towerArray.get(i).getUpgrade(), canvas);
        }
        for (int i = 0; i < attackArray.size(); i += 5) {
            drawAttack(attackArray.get(i), attackArray.get(i + 1), attackArray.get(i + 2),
                    attackArray.get(i + 3), attackArray.get(i + 4), canvas);
        }
        attackArray.clear();
        drawEnemy(enemyArray, canvas);
    }
}


"""Shared Android surface for the production ordinary-panel presentation helper."""
from pathlib import Path

def add_status_bar_support(files):
    source = Path(__file__).resolve().parents[1] / 'android/app/src/main/java/ls/augment/com/hook'
    files['ls/augment/com/hook/IslandPanelStatusBar.java'] = (source / 'IslandPanelStatusBar.java').read_text('utf-8')
    files.setdefault('android/os/SystemClock.java', 'package android.os; public class SystemClock {public static long now=1000;public static long uptimeMillis(){return now;}}')
    key = 'android/view/View.java'
    if 'getAlpha(' not in files[key]:
        pos = files[key].index('{') + 1
        extra = 'public float getAlpha(){return alpha;}'
        if 'float alpha' not in files[key]: extra += 'public float alpha=1f;'
        if 'setAlpha(' not in files[key]: extra += 'public void setAlpha(float v){alpha=v;}'
        files[key] = files[key][:pos] + extra + files[key][pos:]

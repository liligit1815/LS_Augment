"""Compile production slider policy and verify command/edge behavior without device mutation."""
from pathlib import Path
import os
import subprocess

ROOT=Path(__file__).resolve().parents[1]
JDK=Path(os.environ.get('JAVA_HOME',r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
OUT=ROOT/'audit-output/competitive-key-tests'
OUT.mkdir(parents=True,exist_ok=True)
SOURCE=ROOT/'android/app/src/main/java/ls/augment/com'
subprocess.run([str(JDK/'bin/javac.exe'),'-encoding','UTF-8','-d',str(OUT),
               *[str(SOURCE/item) for item in ('EnhancementOption.java','CompetitiveKeyOptions.java','CompetitiveKeyPolicy.java')],
               str(ROOT/'tools/TestCompetitiveKeyPolicy.java')],check=True)
subprocess.run([str(JDK/'bin/java.exe'),'-cp',str(OUT),'ls.augment.com.TestCompetitiveKeyPolicy'],check=True)

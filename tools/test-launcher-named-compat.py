"""Re-run production entry/workspace behavior against the named OEM API profile."""
from pathlib import Path
import re, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')

def fixture(name):
    path=ROOT/'tools'/name;ns={'__file__':str(path),'__name__':'fixture'}
    exec(path.read_text(encoding='utf-8').split('with tempfile.TemporaryDirectory(')[0],ns)
    return ns['files']

def run(files,runner,arg=()):
    with tempfile.TemporaryDirectory(prefix='duo-named-launcher-') as folder:
        paths=[]
        for name,value in files.items():
            p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');paths.append(str(p))
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*paths],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,runner,*arg],check=True)

files=fixture('test-entry-visibility-runtime.py');named={}
for key,value in files.items():
    if not key.startswith('ls/augment/com/') or '/Test' in key:
        for old,new in [('D','AllAppsStore'),('d','AppInfo'),('y','ItemInfoWithIcon'),('o','getApps'),('t','notifyUpdate'),('B','applyFromItemInfoWithIcon')]:
            value=re.sub(r'\b'+old+r'\b',new,value)
        for old,new in [('D','AllAppsStore'),('d','AppInfo'),('y','ItemInfoWithIcon')]:key=re.sub('/'+old+r'\.java$', '/'+new+'.java',key)
    named[key]=value
run(named,'ls.augment.com.hook.TestEntryVisibilityRuntime',('launcher',))

files=fixture('test-minors-workspace-runtime.py');named={}
# Apply member names before short type tokens to keep the parameter class's b() distinct.
for key,value in files.items():
    if not key.startswith('ls/augment/com/') or '/Test' in key:
        for old,new in [('c1.b','com.android.launcher3.celllayout.CellLayoutLayoutParams'),('z1.J3','com.android.launcher3.model.ModelWriterImpl'),('z1.y1','com.android.launcher3.model.LoaderCursor')]:value=value.replace(old,new)
        value=value.replace('package c1;', 'package com.android.launcher3.celllayout;').replace('package z1;','package com.android.launcher3.model;')
        if key=='c1/b.java':
            value=value.replace('int a()', 'int getCellX()').replace('int b()', 'int getCellY()').replace('void e(', 'void setCellX(').replace('void g(', 'void setCellY(')
        value=value.replace('p.a()', 'p.getCellX()').replace('p.b()', 'p.getCellY()')
        if key.endswith('/CellLayout.java') or '/TestMinors' in key:
            value=value.replace('cell.e(', 'cell.addViewToCellLayout(').replace('next.e(', 'next.addViewToCellLayout(').replace('boolean e(View', 'boolean addViewToCellLayout(View').replace('"e"','"addViewToCellLayout"')
        if key.endswith('/t0.java'):value=value.replace('boolean d(', 'boolean isRegionVacant(').replace('boolean c(', 'boolean findVacantCell(')
        if key=='z1/y1.java':
            value=value.replace('protected boolean e(y item,boolean value)', 'protected boolean checkItemPlacement(y item)').replace('"e"','"checkItemPlacement"').replace('new Class[]{y.class,boolean.class}', 'new Class[]{y.class}').replace('new Object[]{item,value}', 'new Object[]{item}').replace('return value;', 'return false;').replace('return e(item,value);','return checkItemPlacement(item);')
        if key.endswith('/C2.java'):value=value.replace('public com.android.launcher3.model.ModelWriterImpl i2()', 'public com.android.launcher3.model.IModelWriter getModelWriter()')
        if key=='z1/J3.java':value=value.replace('class J3 {', 'class J3 implements IModelWriter {').replace('void T(', 'void moveItemInDatabase(')
        for old,new in [('C2','Launcher'),('J3','ModelWriterImpl'),('y1','LoaderCursor'),('t0','GridOccupancy'),('y','ItemInfo'),('b','CellLayoutLayoutParams')]:value=re.sub(r'\b'+old+r'\b',new,value)
        key=key.replace('c1/b.java','com/android/launcher3/celllayout/CellLayoutLayoutParams.java').replace('z1/J3.java','com/android/launcher3/model/ModelWriterImpl.java').replace('z1/y1.java','com/android/launcher3/model/LoaderCursor.java').replace('/t0.java','/GridOccupancy.java').replace('/y.java','/ItemInfo.java').replace('/C2.java','/Launcher.java')
    named[key]=value
named['com/android/launcher3/model/IModelWriter.java']='package com.android.launcher3.model;public interface IModelWriter{void moveItemInDatabase(com.android.launcher3/model/data/ItemInfo i,int c,int s,int x,int y);}'.replace('com.android.launcher3/model/data/','com.android.launcher3.model.data.')
run(named,'ls.augment.com.hook.TestMinorsWorkspace')

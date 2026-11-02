"""Verify the new button hook's actual declared fields/methods against supplied OEM APKs."""
import argparse
import importlib.util
import json
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('monitor_targets',ROOT/'tools/check-game-performance-monitor-targets.py')
reader=importlib.util.module_from_spec(spec);spec.loader.exec_module(reader)
TYPES={'WindowManager.LayoutParams':'Landroid/view/WindowManager$LayoutParams;',
       'WindowManager':'Landroid/view/WindowManager;','Drawable':'Landroid/graphics/drawable/Drawable;',
       'float':'F','int':'I','Paint':'Landroid/graphics/Paint;'}

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--apk',type=Path,action='append',required=True)
    parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/ComboButtonSizeHook.java').read_text(encoding='utf-8')
    fields=[name+':'+TYPES[kind] for name,kind in re.findall(r'field\(type,"([^"]+)",([\w.]+)\.class\)',source)]
    methods=[]
    for name,params in re.findall(r'method\(type,"([^"]+)"([^)]*)\)',source):
        methods.append(name+'('+''.join(TYPES[p] for p in re.findall(r'(\w+)\.class',params))+')V')
    assert len(fields)==6 and len(methods)==3
    report=[]
    for apk in args.apk:
        identity,definitions,_=reader.load_apk(apk)
        definition=definitions.get('Lcn/nubia/gamehelper/view/DraggableProgressView;',{})
        missing=[]
        for kind,members in [('fields',fields),('methods',methods)]:
            for member in members:
                flags=definition.get(kind,{}).get(member)
                if flags is None or flags&8:missing.append(kind+':'+member)
        passed=not missing and identity.get('package')=='cn.nubia.gamehelpmodule'
        report.append({'apk':str(apk.resolve()),'identity':identity,'pass':passed,'missing':missing})
        print('PASS' if passed else 'FAIL',identity,missing)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps({'validation':'static interfaces only; no phone execution','results':report},ensure_ascii=False,indent=2),encoding='utf-8')
    if not all(item['pass'] for item in report):raise SystemExit(1)
if __name__=='__main__':main()

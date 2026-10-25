"""Read named physical-slider and privileged API definitions from captured phone framework jars."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import re
import zipfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex_reader',ROOT/'tools/check-launcher-module-targets.py')
reader=importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)

def definitions(path):
    result={}
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex',name):result.update(reader.dex_classes(archive.read(name)))
    return result

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--services',type=Path,required=True)
    parser.add_argument('--framework',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args()
    targets={
        'services':{
            'Lcom/android/server/policy/PhoneWindowManager;':['notifyGameSwitchChanged(JZ)V'],
            'Lcom/android/server/redmagic/GameKeysCtrl;':['notifyGameSwitchChanged(JZZ)V','systemReady()V'],
            'Lcom/android/server/redmagic/SlideKeysCtrl;':['notifyCameraSlideKeySwitchChanged(JZZ)V'],
            'Lcom/android/server/redmagic/game/GameModeController;':['isGameKeyOn()Z'],
        },
        'framework':{
            'Lcom/redmagic/game/GameKeysHelper;':['isSlideKeyStartGameLauncher(Landroid/content/Context;)Z'],
            'Landroid/media/AudioManager;':['setRingerModeInternal(I)V','getRingerModeInternal()I'],
            'Landroid/os/PowerManager;':['setPowerSaveModeEnabled(Z)Z'],
            'Landroid/app/ContextImpl;':['createContextAsUser(Landroid/os/UserHandle;I)Landroid/content/Context;','startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V'],
            'Landroid/app/ActivityManager;':['forceStopPackageAsUser(Ljava/lang/String;I)V'],
        }
    }
    report={}
    for kind,path in [('services',args.services),('framework',args.framework)]:
        source=definitions(path);found={}
        for owner,methods in targets[kind].items():
            assert owner in source,owner+' absent'
            found[owner]={}
            for method in methods:
                assert method in source[owner]['methods'],owner+'->'+method+' absent'
                found[owner][method]=source[owner]['methods'][method]
        report[kind]={'path':str(path.resolve()),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'targets':found}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    print('PASS real physical slider and privileged action API contracts')

if __name__=='__main__':main()

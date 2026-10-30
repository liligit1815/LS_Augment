"""Verify Magic Island contracts in real OEM APKs; interface evidence, not device acceptance."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)

def check(path,kind):
    classes,resources=dex.read_apk(path)
    missing=[];checked=[]
    def require(owner,member,static=False,field=False):
        checked.append(owner+'->'+member)
        match=dex.find_member(classes,owner,'fields' if field else 'methods',member)
        if not match or bool(match[1]&8)!=static or (not field and match[1]&1024):missing.append(checked[-1])
    if kind=='systemui':
        prefix='Lcom/zte/feature/dynamicisland/'
        require('Lcom/zte/tools/AppTools;','ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN:Z',True,True)
        for page in ['DynamicIslandSettingsActivity','DynamicIslandFullScreenSettingsActivity']:
            if prefix+'settings/'+page+';' not in classes:missing.append(page)
        require(prefix+'settings/DynamicIslandSwitchFullScreenSettingsFragment;','handleSubSwitchPreference(Ljava/lang/String;Landroidx/preference/SwitchPreference;)V')
        require(prefix+'settings/DynamicIslandSwitchFullScreenSettingsFragment;','isSubSwitchOn(Ljava/lang/String;)Z')
        require(prefix+'settings/DynamicIslandSwitchSettingsFragment;','updateDynamicIslandSwitchState(I)V')
        host=prefix+'PermanentIslandManager;'
        require(host,'mAppIslandList:Ljava/util/Map;',field=True)
        for method in ['isDynamicIslandDisabled(Ljava/lang/String;)Z','handleRemoveIsland(Ljava/lang/String;)V','handleCardMessage(Lcom/zte/toolsdk/common/CardMessage;Z)V']:
            require(host,method)
        require('Lcom/zte/toolsdk/common/CardMessage;','getCardId()Ljava/lang/String;')
        for resource in ['string/dynamic_island_settings_action_bar_label_fullscreen','string/dynamic_island_settings_action_bar_label_xinyun']:
            if resource not in resources:missing.append(resource)
    else:
        prefix='Lcom/zte/briefagent/'
        require(prefix+'data/config/EnvironmentConfig;','isFeatureStarryIslandSupported(Landroid/content/Context;)Z',True)
        renderer=prefix+'event/cards/render/StarryIslandCardRender;'
        require(renderer,'context:Landroid/content/Context;',field=True)
        require(renderer,'cardIdToAdapterMap:Ljava/util/Map;',field=True)
        for method in ['removeCard(Ljava/lang/String;)V','initCardPusher()V','render(Ljava/util/List;)V']:require(renderer,method)
        require(prefix+'event/EventProcessor;','deInit(Landroid/content/Context;)V')
        adapters=['meeting/starryisland/Meeting','electronicguide/starryisland/ElectronicGuide','charge/starryisland/ChargingReminder',
                  'cycling/starryisland/ReturnBike','travel/starryisland/Flight','travel/starryisland/BatteryCharging',
                  'weather/starryisland/Weather','taxi/starryisland/Taxi','takeout/notification/Takeout',
                  'travel/starryisland/Train12306','travel/starryisland/TravelToolTrain']
        for adapter in adapters:
            owner=prefix+'event/scene/'+adapter+'StarryIslandAdapter;'
            require(owner,'createCardMessage('+prefix+'event/cards/CardContext;)Lcom/zte/toolsdk/common/CardMessage;')
    return dict(apk=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),kind=kind,checked=checked,
                missing=missing,passed=not missing,evidence='OEM DEX/resources; no device or real-business acceptance')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--systemui',type=Path,required=True);parser.add_argument('--personalagent',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    results=[check(args.systemui,'systemui'),check(args.personalagent,'personalagent')]
    args.output.write_text(json.dumps(results,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    for result in results:print(result['kind'], 'PASS' if result['passed'] else 'FAIL',len(result['checked']),'contracts',result['missing'])
    if any(not result['passed'] for result in results):raise SystemExit(1)

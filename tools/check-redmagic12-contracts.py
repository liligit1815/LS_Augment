"""Read-only audit of the supplied RedMagic 12 package contracts. No phone behavior is inferred."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT=Path(__file__).resolve().parents[1]
def module(name):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/(name+'.py'))
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--systemui',type=Path,required=True)
    parser.add_argument('--launcher',type=Path,required=True)
    parser.add_argument('--themes',type=Path,nargs='*',default=[])
    parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args();dex=module('check-launcher-module-targets')
    inputs=[];indexes={}
    for path in [args.systemui,args.launcher,*args.themes]:
        with zipfile.ZipFile(path) as archive:identity=dex.manifest_identity(archive.read('AndroidManifest.xml'))
        inputs.append(dict(file=path.name,identity=identity,sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
        if path in [args.systemui,args.launcher]:indexes[path]=dex.read_apk(path)
    classes,_=indexes[args.systemui];checks=[]
    def member(owner,kind,signature,static=False):
        value=dex.find_member(classes,owner,kind,signature)
        ok=value is not None and bool(value[1]&8)==static and not value[1]&1024
        checks.append(dict(owner=owner,member=signature,definedBy=value[0] if value else None,passed=bool(ok)))
    for owner,signature in [
        ('com/android/systemui/common/shared/model/Icon$Resource','getResId()Ljava/lang/Integer;'),
        ('com/android/systemui/statusbar/policy/Clock','updateClock()V'),
        ('com/android/systemui/statusbar/pipeline/mobile/ui/view/ModernStatusBarMobileView','getSubId()I'),
        ('com/android/systemui/doze/DozeUi','roundToNextMinute(J)J'),
        ('com/android/systemui/doze/DozeUi','scheduleTimeTick()V'),
        ('com/android/systemui/doze/DozeUi','unscheduleTimeTick()V'),
        ('com/zte/mifavor/keyguard/clock/AnimatableClockView','refreshTime()V'),
        ('com/zte/mifavor/qs/customize/TileAdapter','onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/zte/mifavor/qs/customize/TileAdapter$Holder;'),
        ('com/zte/mifavor/qs/customize/TileAdapter','getNumColumns()I'),
        ('com/zte/mifavor/qs/customize/TileAdapter','updateNumColumns()Z'),
        ('com/zte/mifavor/qs/customize/QSCustomizer','getRecyclerView()Landroidx/recyclerview/widget/RecyclerView;'),
        ('com/zte/feature/volume/VolumeDialogImpl','showSafetyWarningH(I)V'),
        ('com/zte/feature/volume/VolumeDialogImpl','showCsdWarningH(II)V'),
        ('com/zte/feature/volume/VolumeDialogImpl','updateVolumeRowH(Lcom/zte/feature/volume/VolumeDialogImpl$VolumeRow;)V'),
    ]:member('L'+owner+';','methods',signature)
    for name in ['Default','Artword','Horizen','Vertical','BigFont','Clip','Dual']:
        member('Lcom/zte/feature/doze/AodClock/KeyguardAodClockStyle/AodLockScreenClock'+name+';','methods','dozeTimeTick()V')
    for owner,signature in [('com/android/systemui/common/shared/model/Icon$Resource','resId:I'),
                            ('com/zte/mifavor/keyguard/clock/AnimatableClockView','format:Ljava/lang/CharSequence;'),
                            ('com/zte/mifavor/keyguard/clock/AnimatableClockView','calendar:Ljava/util/Calendar;'),
                            ('com/zte/controlcenter/CCCustomizerController','mTileAdapter:Lcom/zte/mifavor/qs/customize/TileAdapter;'),
                            ('com/zte/feature/volume/VolumeDialogImpl$VolumeRow','ss:Lcom/android/systemui/plugins/VolumeDialogController$StreamState;')]:
        member('L'+owner+';','fields',signature)
    adapted={}
    for name,entry in [('check-launcher-grid-contracts','inspect'),('check-launcher-customization-targets','check')]:
        audit=module(name);reader=getattr(audit,'dex',getattr(audit,'DEX',None));reader.read_apk=lambda path:indexes[path]
        adapted[name]=getattr(audit,entry)(args.launcher)
    # Preserve known gaps as gaps: these components reorganized native data migration.
    pending={}
    for name,entry in [('check-launcher-pages-contracts','check'),('check-launcher-new-apps-contracts','inspect')]:
        audit=module(name);reader=getattr(audit,'dex',getattr(audit,'DEX',None));reader.read_apk=lambda path:indexes[path]
        result=getattr(audit,entry)(args.launcher)
        pending[name]=[c for c in result['checks'] if not c.get('passed',c.get('pass',False))]
    passed=all(c['passed'] for c in checks) and all(r.get('interfacePass',r.get('pass',False)) for r in adapted.values())
    result=dict(inputs=inputs,systemui=checks,launcher=adapted,unadaptedContracts=pending,
                supportedContractsPass=passed,deviceBehaviorVerified=False,
                limits=['Only the input APK identities and the listed contracts are covered; match them to the running packages separately.',
                        'Failed migration contracts remain pending even when the supported-contract subset passes.',
                        'This APK audit does not verify framework services, Settings, hardware interfaces or device behavior.'])
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    total=len(checks)+sum(len(r['checks']) for r in adapted.values())
    print(('PASS' if passed else 'FAIL')+f' {total} adapted package contract checks; device behavior unverified')
    for c in checks:
        if not c['passed']:print(c)
    print('Unadapted launcher contracts remain recorded in '+str(args.output))
    return 0 if passed else 1
if __name__=='__main__':raise SystemExit(main())

"""Bounded device-session capture; backup stops only the two explicitly selected task apps."""
import argparse, hashlib, json, shlex, subprocess, tarfile
from pathlib import Path

PACKAGES = ('ls.augment.com', 'com.zte.mifavor.launcher')

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--adb',required=True);p.add_argument('--output',required=True)
    args=p.parse_args();out=Path(args.output).resolve();out.mkdir(parents=True,exist_ok=True)
    def adb(*parts,timeout=60):
        return subprocess.check_output([args.adb,*parts],timeout=timeout)
    def shell(command):
        return adb('shell','su -c '+shlex.quote(command)).decode('utf-8','replace').strip()
    devices=adb('devices').decode();assert len([x for x in devices.splitlines() if x.endswith('\tdevice')])==1
    assert shell('id -u')=='0'
    report={'packages':{},'data':[]}
    report['build']={k:adb('shell','getprop',k).decode().strip() for k in ('ro.product.model','ro.build.display.id','ro.build.version.sdk')}
    assert report['build']['ro.product.model']=='NX809J', 'Unexpected device'
    # Stop before archiving databases and WAL files; no data is removed or rewritten.
    for pkg in PACKAGES:
        shell('am force-stop '+pkg)
        raw=adb('shell','pm','path',pkg).decode().strip().splitlines()
        paths=[line[8:] for line in raw if line.startswith('package:')]
        assert paths
        targets=[]
        for i,path in enumerate(paths):
            local=out/(pkg+('' if i==0 else '-split'+str(i))+'.apk')
            if local.exists():raise RuntimeError('Refusing to overwrite session backup '+str(local))
            subprocess.run([args.adb,'pull',path,str(local)],check=True,capture_output=True,timeout=120)
            targets.append({'file':local.name,'sha256':hashlib.sha256(local.read_bytes()).hexdigest()})
        report['packages'][pkg]=targets
        (out/(pkg+'-package.txt')).write_bytes(adb('shell','dumpsys','package',pkg))
    for base in ('/data/user/0','/data/user_de/0'):
        found=[pkg for pkg in PACKAGES if shell('test -d '+base+'/'+pkg+' && printf yes || true')=='yes']
        if not found:continue
        target=out/('user_de_0.tar' if 'user_de' in base else 'user_0.tar')
        if target.exists():raise RuntimeError('Refusing to overwrite data backup')
        command='tar -C '+base+' -cf - '+' '.join(found)
        with target.open('wb') as stream:
            subprocess.run([args.adb,'exec-out','su -c '+shlex.quote(command)],stdout=stream,stderr=subprocess.PIPE,check=True,timeout=120)
        with tarfile.open(target) as archive:
            files=[entry for entry in archive.getmembers() if entry.isfile()]
            assert files,'Empty data backup'
            listing=[{'name':e.name,'size':e.size} for e in files]
        report['data'].append({'file':target.name,'sha256':hashlib.sha256(target.read_bytes()).hexdigest(),'files':len(files)})
        (out/(target.stem+'-contents.json')).write_text(json.dumps(listing,ensure_ascii=False,indent=2),encoding='utf-8')
    (out/'backup-manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps({'backup':str(out),'archives':report['data'],'packages':list(report['packages'])},ensure_ascii=False))

if __name__=='__main__':main()

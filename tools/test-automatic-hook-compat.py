"""Offline production-resolver tests. Requires JDK and Android SDK; never touches a device.

Optional --permission-apk APK EXPECTED_METHOD pairs verify captured real applications.
"""
import argparse
import importlib.util
import os
from pathlib import Path
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
HOOKS = ROOT / "android/app/src/main/java/ls/augment/com/hook"


def run(*args):
    subprocess.run(list(map(str, args)), check=True)


def verify_home_contract(apk):
    """Check the complete reflective UI contract against actual defined DEX members."""
    spec=importlib.util.spec_from_file_location("launcher_dex_reader",ROOT / "tools/check-launcher-module-targets.py")
    reader=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(reader)
    classes={}
    with zipfile.ZipFile(apk) as archive:
        for name in archive.namelist():
            if name.startswith("classes") and name.endswith(".dex"):
                classes.update(reader.dex_classes(archive.read(name)))
    fragment="Lcom/android/permissioncontroller/role/ui/DefaultAppChildFragment;"
    model="Lcom/android/permissioncontroller/role/ui/DefaultAppViewModel;"

    def instance(owner, kind, signature):
        flags=classes.get(owner,{}).get(kind,{}).get(signature)
        return flags is not None and not flags & (8 | 0x400)

    modern="addApplicationPreferences(Landroidx/preference/PreferenceGroup;Ljava/util/List;Landroid/util/ArrayMap;Landroid/content/Context;)V"
    legacy="onRoleChanged(Ljava/util/List;)V"
    is_modern=instance(fragment,"methods",modern)
    is_legacy=instance(fragment,"methods",legacy)
    assert is_modern != is_legacy,"missing or ambiguous HOME list contract"
    for field in ("mRoleName:Ljava/lang/String;","isCtsPkg:Z","mViewModel:"+model):
        assert instance(fragment,"fields",field),"invalid HOME field: "+field
    assert "Landroidx/preference/PreferenceGroup;" in classes
    assert instance(fragment,"methods","onActivityCreated(Landroid/os/Bundle;)V")
    assert instance("Landroidx/fragment/app/Fragment;","methods","onDestroy()V")
    if is_modern:
        assert instance(fragment,"methods","onApplicationListChanged()V")
    for name in (("getLiveData","getRecommendedLiveData") if is_modern else ("getRoleLiveData",)):
        getters=[signature for signature in classes[model]["methods"]
                 if signature.startswith(name+"()") and instance(model,"methods",signature)]
        assert len(getters)==1,"invalid HOME source: "+name
        result=getters[0].split(")",1)[1]
        assert instance(result,"methods","getValue()Ljava/lang/Object;"),"invalid HOME LiveData shape"
    print("Real HOME UI contract passed: "+("addApplicationPreferences" if is_modern else "onRoleChanged"),flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--permission-apk", nargs=2, action="append", default=[])
    args = parser.parse_args()
    sdk = Path(os.environ.get("ANDROID_HOME", str(Path.home() / "AppData/Local/Android/Sdk")))
    d8 = sdk / "build-tools/35.0.0/lib/d8.jar"
    android = sdk / "platforms/android-36/android.jar"
    java = Path(os.environ["JAVA_HOME"]) / "bin/java.exe" if os.name == "nt" and "JAVA_HOME" in os.environ else "java"
    javac = Path(os.environ["JAVA_HOME"]) / "bin/javac.exe" if os.name == "nt" and "JAVA_HOME" in os.environ else "javac"
    with tempfile.TemporaryDirectory(prefix="lsa-auto-compat-") as temp:
        root = Path(temp)
        classes = root / "tests"
        run(javac, "-encoding", "UTF-8", "-d", classes,
            *[HOOKS / name for name in ("HomeCandidateDexResolver.java", "HookCompatibility.java", "GameExtrasPolicy.java")],
            *[ROOT / "tools" / name for name in ("TestHomeCandidateDexResolver.java", "TestAutomaticHookCompatibility.java", "TestGameExtrasPolicy.java")])
        for name in ("TestAutomaticHookCompatibility", "TestGameExtrasPolicy"):
            run(java, "-cp", classes, "ls.augment.com.hook." + name)

        def resolve(expected, *archives, list_name=None):
            options=[] if list_name is None else ["-Dls.test.home.list="+list_name]
            run(java, *options, "-cp", classes, "ls.augment.com.hook.TestHomeCandidateDexResolver", expected, *archives)

        for apk, method in args.permission_apk:
            verify_home_contract(apk)
            resolve(method, apk)

        def fixture(name, predicate="q", ambiguous=False, direct=True, home=True, signature="String",
                    legacy=False, filter_call=True, static_list=False, both_lists=False):
            folder=root / name
            src=folder / "src"
            def write(path, text):
                target=src / path
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(text, encoding="utf-8")
            expression='s.startsWith("android.") && s.contains(".cts.") && Boolean.getBoolean("persist.sys.stc")'
            # Wrong same-name m(Context) and unreferenced same-pattern decoy must not win.
            write("x/Z.java", 'package x; public class Z { public static boolean m(android.content.Context c){return true;} '
                + f'public static boolean {predicate}({signature} s){{return {expression if signature == "String" else "true"};}}'
                + f'public static boolean allow(android.content.pm.ApplicationInfo info){{return {predicate}(({signature})null);}}'
                + f'public static boolean decoy(String s){{return {expression};}}' + '}')
            body=f'boolean result=x.Z.{predicate}(({signature})null);' if direct else 'boolean result=true;'
            if legacy and filter_call:
                body+='result |= x.Z.allow(null);'
            if ambiguous:
                body+='result |= x.Z.decoy(null);'
            role='android.app.role.HOME' if home else 'android.app.role.BROWSER'
            write("androidx/preference/PreferenceGroup.java", 'package androidx.preference; public class PreferenceGroup {}')
            modern='addApplicationPreferences(androidx.preference.PreferenceGroup g,java.util.List l,android.util.ArrayMap m,android.content.Context c)'
            entry='onRoleChanged(java.util.List l)' if legacy else modern
            method=('public static void ' if static_list else 'public void ')+entry+'{'+body+f' System.out.println("{role}"+result);'+'}'
            if both_lists:
                method+='public void '+modern+'{'+body+f' System.out.println("{role}"+result);'+'}'
            write("com/android/permissioncontroller/role/ui/DefaultAppChildFragment.java",
                'package com.android.permissioncontroller.role.ui; public class DefaultAppChildFragment {'
                + method + '}')
            compiled=folder / "classes"
            run(javac,"-encoding","UTF-8","--release","17","-classpath",android,"-d",compiled,*src.rglob("*.java"))
            output=folder / "dex"
            output.mkdir()
            run(java,"-cp",d8,"com.android.tools.r8.D8","--lib",android,"--min-api","34","--output",output,*compiled.rglob("*.class"))
            apk=folder / "fixture.apk"
            with zipfile.ZipFile(apk,"w") as archive:
                archive.write(output / "classes.dex","classes.dex")
            return apk

        renamed=fixture("renamed")
        resolve("Lx/Z;->q(Ljava/lang/String;)Z",renamed)
        resolve("Lx/Z;->m(Ljava/lang/String;)Z",fixture("overloaded","m"))
        resolve("REJECT",fixture("ambiguous",ambiguous=True))
        resolve("REJECT",fixture("unreferenced",direct=False))
        resolve("REJECT",fixture("other-role",home=False))
        resolve("REJECT",fixture("wrong-type",signature="Object"))
        legacy=fixture("legacy-role-list",legacy=True)
        resolve("Lx/Z;->q(Ljava/lang/String;)Z",legacy,list_name="onRoleChanged")
        resolve("REJECT",legacy,list_name="addApplicationPreferences")
        resolve("REJECT",renamed,list_name="onRoleChanged")
        resolve("REJECT",legacy,list_name="unrelatedList")
        resolve("REJECT",fixture("legacy-no-app-filter",legacy=True,filter_call=False))
        resolve("REJECT",fixture("legacy-unreferenced",legacy=True,direct=False))
        resolve("REJECT",fixture("legacy-other-role",legacy=True,home=False))
        resolve("REJECT",fixture("legacy-static-list",legacy=True,static_list=True))
        resolve("REJECT",fixture("modern-static-list",static_list=True))
        resolve("REJECT",fixture("ambiguous-list-shapes",legacy=True,both_lists=True))
        # A split APK may hold the methods; the base may be resource-only.
        empty=root / "base.apk"
        with zipfile.ZipFile(empty,"w"):
            pass
        resolve("Lx/Z;->q(Ljava/lang/String;)Z",empty,renamed)
        with zipfile.ZipFile(renamed) as archive:
            data=archive.read("classes.dex")
        for name,content in (("truncated",data[:128]),("bad-magic",b"not-dex!"+data[8:])):
            apk=root / (name+".apk")
            with zipfile.ZipFile(apk,"w") as archive:
                archive.writestr("classes.dex",content)
            resolve("REJECT",apk)
        print("All automatic compatibility tests passed")


if __name__ == "__main__":
    main()

"""Run the production page lifecycle against Android 15's audited named API.

The same identity, rollback, persisted empty-page and asynchronous model-queue
assertions run on both ROM adapters. These are Android/OEM boundary doubles, not
a device test; check-launcher-pages-contracts.py verifies the real APK members.
"""
from pathlib import Path
import re
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
original = runpy.run_path(str(ROOT / 'tools/test-launcher-pages-lifecycle.py'))['SOURCES']
types = {'C2': 'Launcher', 'B4': 'ModelCallbacks', 'N5': 'Utilities',
         'J3': 'LauncherPrefs', 'V4': 'PagedView', 'P2': 'LauncherAppState',
         'D3': 'LauncherModel', 'F1': 'InvariantDeviceProfile', 'x0': 'IntArray', 'z0': 'IntSet',
         'k2': 'ModelDbController', 'Z': 'ScreenUtil', 'm0': 'Executors'}
sources = {}
for name, content in original.items():
    if 'AIFutureWidgetUtils' in name:
        continue  # This owner genuinely does not exist in the audited 10 launcher.
    for old, new in types.items():
        name = re.sub(r'\b' + old + r'\b', new, name)
        content = re.sub(r'\b' + old + r'\b', new, content)
    content = content.replace('z1.ModelDbController', 'com.android.launcher3.model.ModelDbController')
    content = content.replace('x1.ScreenUtil', 'com.android.launcher3.mfvUtil.ScreenUtil')
    content = content.replace('.A()', '.toArray()')
    content = content.replace('ws.n(', 'ws.getScreenWithId(').replace('old.n(', 'old.getScreenWithId(')
    content = content.replace('workspace.n.', 'workspace.mWorkspaceScreens.')
    content = content.replace('ws.n.', 'ws.mWorkspaceScreens.')
    content = content.replace('workspace.v1(', 'workspace.insertNewWorkspaceScreen(')
    content = re.sub(r'\bmenu\.m\b', 'menu.mHomeMenuLinearLayout', content)
    content = re.sub(r'\bmenu\.g\b', 'menu.mActivity', content)
    content = content.replace('LauncherPrefs.m(', 'LauncherPrefs.getPrefs(')
    content = content.replace('launcher.h.j', 'launcher.mModelCallbacks.isFirstPagePinnedItemEnabled')
    for old, new in [('f', 'bindScreens'), ('h', 'finishBindingItems'), ('i3', 'stripEmptyScreens'),
                     ('Q0', 'convertFinalScreenToEmptyScreenIfNecessary'),
                     ('G2', 'removeExtraEmptyScreenDelayed'), ('G', 'setupHomeMenu')]:
        content = content.replace('module.call("' + old + '"', 'module.call("' + new + '"')
        content = content.replace('nativeCall("' + old + '"', 'nativeCall("' + new + '"')
    if name.endswith('/IntArray.java'):
        content = content.replace(' m(', ' add(').replace(' A(', ' toArray(').replace(' q(', ' clone(')
        content = content.replace('IntArray(A())', 'IntArray(toArray())')
    elif name.endswith('/ModelCallbacks.java'):
        content = content.replace('boolean j;', 'boolean isFirstPagePinnedItemEnabled;')
    elif name.endswith('/Utilities.java'):
        content = content.replace('boolean j;', 'boolean SHOULD_SHOW_FIRST_PAGE_WIDGET;')
    elif name.endswith('/LauncherPrefs.java'):
        content = content.replace(' m(', ' getPrefs(')
    elif name.endswith('/Workspace.java'):
        content = content.replace('> n=', '> mWorkspaceScreens=').replace('Launcher x;', 'Launcher mLauncher;')
        content = re.sub(r'\bn\.', 'mWorkspaceScreens.', content)
        for old, new in [(' n(', ' getScreenWithId('), (' v1(', ' insertNewWorkspaceScreen('),
                         (' i3(', ' stripEmptyScreens('), (' Q0(', ' convertFinalScreenToEmptyScreenIfNecessary('),
                         (' G2(', ' removeExtraEmptyScreenDelayed(')]:
            content = content.replace(old, new)
    elif name.endswith('/Launcher.java'):
        content = content.replace('ModelCallbacks h=', 'ModelCallbacks mModelCallbacks=')
        content = content.replace('workspace.x=this', 'workspace.mLauncher=this')
        for old, new in [(' B2(', ' getWorkspace('), (' f(', ' bindScreens('),
                         (' h(', ' finishBindingItems('), (' w2(', ' getScreenUtil('), (' C(', ' getState(')]:
            content = content.replace(old, new)
    elif name.endswith('/LauncherAppState.java'):
        content = content.replace(' h(', ' getInstance(').replace(' j(', ' getModel(').replace(' e(', ' getIDP(')
    elif name.endswith('/InvariantDeviceProfile.java'):
        content = content.replace(' E1=', ' dbFile=')
    elif name.endswith('/LauncherModel.java'):
        content = content.replace(' Executors(', ' getModelDbController(')
    elif name.endswith('/ModelDbController.java'):
        name = 'com/android/launcher3/model/ModelDbController.java'
        content = content.replace('package z1;', 'package com.android.launcher3.model;').replace(' F(', ' getNewScreenId(')
    elif name.endswith('/ScreenUtil.java'):
        name = 'com/android/launcher3/mfvUtil/ScreenUtil.java'
        content = content.replace('package x1;', 'package com.android.launcher3.mfvUtil;').replace(' b(', ' bindDefaultPage(')
    elif name.endswith('/Executors.java'):
        content = content.replace('Executor h=', 'Executor MODEL_EXECUTOR=')
    elif name.endswith('/MenuContainer.java'):
        content = content.replace('LinearLayout m;', 'LinearLayout mHomeMenuLinearLayout;')
        content = content.replace('Object g;', 'Object mActivity;').replace('m=new LinearLayout', 'mHomeMenuLinearLayout=new LinearLayout')
        content = content.replace(' G(', ' setupHomeMenu(')
    elif name.endswith('/TestLauncherPagesLifecycle.java'):
        content = content.replace('TestLauncherPagesLifecycle', 'TestLauncherPagesNamedLifecycle').replace('LauncherAppState.profile.E1', 'LauncherAppState.profile.dbFile')
        name = name.replace('TestLauncherPagesLifecycle', 'TestLauncherPagesNamedLifecycle')
        content = content.replace('TestLauncherPagesNamedLifecycle.class.getClassLoader()', 'namedLoader(null)')
        content = content.replace('check(module.hooks.size()==5,"all page lifecycle hooks installed");',
                                  'check(module.hooks.size()==5,"all named page lifecycle hooks installed");'
                                  'check(c().t.adapter.equals("android15_named")&&c().t.future==null,"complete named contract without absent AI Future owner");')
        content = content.replace('System.out.println("PASS LauncherPages lifecycle ',
                                  'testContracts();System.out.println("PASS LauncherPages Android 15 named lifecycle ')
        index = content.rfind('}')
        content = content[:index] + '''
    static ClassLoader namedLoader(String blocked) {
        return new ClassLoader(TestLauncherPagesNamedLifecycle.class.getClassLoader()) {
            @Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException {
                if(name.equals("com.android.launcher3.C2")||name.equals(blocked))throw new ClassNotFoundException(name);
                return super.loadClass(name,resolve);
            }
        };
    }
    static void testContracts()throws Exception {
        Field installed=LauncherPagesHook.class.getDeclaredField("installed");installed.setAccessible(true);
        for(String blocked:new String[]{"com.android.launcher3.model.ModelDbController","com.android.launcher3.Utilities","com.android.launcher3.util.IntArray"}) {
            installed.setBoolean(null,false);AugmentModule rejected=new AugmentModule();
            LauncherPagesHook.install(rejected,namedLoader(blocked));
            check(rejected.hooks.isEmpty()&&rejected.errors.size()==1,"incomplete named contract registers no hooks: "+blocked);
        }
        installed.setBoolean(null,false);AugmentModule mixed=new AugmentModule();
        LauncherPagesHook.install(mixed,TestLauncherPagesNamedLifecycle.class.getClassLoader());
        check(mixed.hooks.isEmpty()&&mixed.errors.size()==1,"incomplete obfuscated family never falls back to named members");
    }
''' + content[index:]
    sources[name] = content

# A present but incomplete obfuscated owner proves selection never mixes families.
sources['com/android/launcher3/C2.java'] = 'package com.android.launcher3;public class C2 {}'


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-pages-named-') as directory:
        root = Path(directory)
        for name, content in sources.items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
        hooks = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
        files = list(root.rglob('*.java')) + [hooks / name for name in (
            'LauncherPagesHook.java', 'LauncherPageOrder.java', 'TargetReflection.java')] + [hooks.parent / 'LauncherPageOrigins.java']
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestLauncherPagesNamedLifecycle'], check=True)


if __name__ == '__main__':
    main()

"""Exact ROM method/field gates for the Bundle and workbench adaptations; no runtime admission."""
import importlib.util
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/redmagic12-12.0.15MR1'
evidence=json.loads((OUT/'inspected/stage4/capabilities.json').read_text())
classes=evidence['classes']; checks=[]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
def method(group,owner,signature,static=False,abstract=False):
    found=dex.find_member(classes,owner,'methods',signature)
    checks.append({'group':group,'owner':owner,'member':signature,'declaringOwner':None if not found else found[0],
                   'flags':None if not found else found[1],'passed':bool(found and bool(found[1]&8)==static and bool(found[1]&0x400)==abstract)})
def field(group,owner,signature,immutable=False):
    found=dex.find_member(classes,owner,'fields',signature)
    checks.append({'group':group,'owner':owner,'member':signature,'flags':None if not found else found[1],
                   'passed':bool(found and not found[1]&8 and (not immutable or found[1]&16))})
UI='Lcom/android/systemui/statusbar/notification/'
ROW=UI+'row/ExpandableNotificationRow;'; BUNDLE=UI+'collection/BundleEntry;'
ADAPTER=UI+'collection/BundleEntryAdapter;'
method('bundle',ROW,'getEntryAdapter()'+UI+'collection/EntryAdapter;')
for owner,signatures in {ADAPTER:['getEntry()'+BUNDLE,'getKey()Ljava/lang/String;','isBundle()Z','getRow()'+ROW],
                         BUNDLE:['getKey()Ljava/lang/String;','getRow()'+ROW,'getChildren()Ljava/util/List;','isClearable()Z']}.items():
    for signature in signatures:method('bundle',owner,signature)
WM='Lcom/android/server/wm/'
AREA=WM+'TaskDisplayArea;'; ROOT_WINDOW=WM+'RootWindowContainer;'
for owner,signatures in {
    ROOT_WINDOW:['startHomeOnTaskDisplayArea(ILjava/lang/String;'+AREA+'ZZZ)Z','onDisplayRemoved(I)V',
                 'canStartHomeOnDisplayArea(Landroid/content/pm/ActivityInfo;'+AREA+'Z)Z','shouldPlacePrimaryHomeOnDisplay(I)Z',
                 'moveRootTaskToDisplay(IIZ)V','resumeFocusedTasksTopActivities()Z','getRootTask(I)'+WM+'Task;',
                 'anyTaskForId(II)'+WM+'Task;','getDisplayContent(I)'+WM+'DisplayContent;'],
    WM+'ActivityTaskManagerService;':['moveRootTaskToDisplay(II)V'],
    WM+'DisplayContent;':['isHomeSupported()Z'],AREA:['canHostHomeTask()Z'],
    WM+'Task;':['getBaseIntent()Landroid/content/Intent;'],
    WM+'WindowManagerService;':['getDisplayContentOrCreate(ILandroid/os/IBinder;)'+WM+'DisplayContent;',
                               'setDisplayImePolicy(II)V','onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z'],
    WM+'DragDropController;':['dragDropActiveLocked()Z','performDrag(IILandroid/view/IWindow;ILandroid/view/SurfaceControl;IIIFFFFLandroid/content/ClipData;)Landroid/os/IBinder;'],
    'Lcom/android/server/input/InputManagerService;':['injectInputEventToTarget(Landroid/view/InputEvent;II)Z'],
}.items():
    for signature in signatures:method('workbench-system',owner,signature)
for owner,signatures in {
    'Landroid/app/IActivityTaskManager$Stub$Proxy;':['getTasks(IZZI)Ljava/util/List;','moveRootTaskToDisplay(II)V',
                    'getAllRootTaskInfosOnDisplay(I)Ljava/util/List;','setFocusedTask(I)V','startActivityFromRecents(ILandroid/os/Bundle;)I'],
    'Landroid/view/IWindowManager$Stub$Proxy;':['setDisplayImePolicy(II)V','getDisplayImePolicy(I)I'],
    'Landroid/window/WindowContainerTransaction;':['setHidden(Landroid/window/WindowContainerToken;Z)Landroid/window/WindowContainerTransaction;',
                         'reorder(Landroid/window/WindowContainerToken;Z)Landroid/window/WindowContainerTransaction;'],
    'Landroid/window/WindowOrganizer;':['applyTransaction(Landroid/window/WindowContainerTransaction;)V'],
    'Landroid/hardware/input/InputManagerGlobal;':['injectInputEvent(Landroid/view/InputEvent;I)Z'],
    'Landroid/view/MotionEvent;':['setDisplayId(I)V'],
}.items():
    for signature in signatures:method('workbench-root-backend',owner,signature)
method('workbench-root-backend','Landroid/hardware/input/InputManagerGlobal;','getInstance()Landroid/hardware/input/InputManagerGlobal;',True)
method('workbench-root-backend','Landroid/view/InputEvent;','setDisplayId(I)V',abstract=True)
DMS='Lcom/android/server/display/DisplayManagerService;'
LOCAL='Lcom/android/server/display/DisplayManagerService$LocalService;'
DDI='Lcom/android/server/display/DisplayDeviceInfo;'
method('display-proof',DMS,'getDisplayDeviceInfoInternal(I)'+DDI)
method('display-proof',DDI,'flagsToString(I)Ljava/lang/String;',True)
for owner,signature in [(WM+'WindowManagerService;','mGlobalLock:'+WM+'WindowManagerGlobalLock;'),
                        (WM+'WindowManagerService;','mDisplayManagerInternal:Landroid/hardware/display/DisplayManagerInternal;'),
                        (LOCAL,'this$0:'+DMS),(DMS,'mSyncRoot:Lcom/android/server/display/DisplayManagerService$SyncRoot;'),
                        ('Landroid/view/Display;','mLock:Ljava/lang/Object;')]:field('display-proof',owner,signature,True)
for signature in ['flags:I','type:I','ownerUid:I','name:Ljava/lang/String;','uniqueId:Ljava/lang/String;']:field('display-proof',DDI,signature)
field('display-proof','Landroid/view/Display;','mDisplayInfo:Landroid/view/DisplayInfo;')
IME='Lcom/android/server/inputmethod/'
for owner,signatures in {
    IME+'InputMethodManagerService;':['mUserDataRepository:'+IME+'UserDataRepository;','mCurrentImeUserId:I'],
    IME+'UserDataRepository;':['mUserData:'+IME+'ImmutableSparseArray;'],
    IME+'UserData;':['mUserId:I','mCurClient:'+IME+'ClientState;','mCurEditorInfo:Landroid/view/inputmethod/EditorInfo;',
                    'mCurInputConnection:Lcom/android/internal/inputmethod/IRemoteInputConnection;',
                    'mCurRemoteAccessibilityInputConnection:Lcom/android/internal/inputmethod/IRemoteAccessibilityInputConnection;',
                    'mImeBindingState:'+IME+'ImeBindingState;'],
    IME+'ImeBindingState;':['mFocusedWindow:Landroid/os/IBinder;','mFocusedWindowClient:'+IME+'ClientState;',
                          'mFocusedWindowEditorInfo:Landroid/view/inputmethod/EditorInfo;','mUserId:I'],
    IME+'ClientState;':['mUid:I','mPid:I','mSelfReportedDisplayId:I'],
}.items():
    for signature in signatures:field('editor-proof',owner,signature)
report={'deviceValidated':False,'runtimeAdmission':False,'checks':checks,'passed':all(row['passed'] for row in checks),
        'artifacts':evidence['artifacts'],'scope':'Declared/inherited exact shape only; no focus, lock, privacy or permission proof from signatures alone'}
(OUT/'tests/stage4/contracts.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
for group in sorted({row['group'] for row in checks}):
    rows=[r for r in checks if r['group']==group];print(group,sum(r['passed'] for r in rows),'/',len(rows))
for row in checks:
    if not row['passed']:print('FAILED',row)
raise SystemExit(0 if report['passed'] else 1)

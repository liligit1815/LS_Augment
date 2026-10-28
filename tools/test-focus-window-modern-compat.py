"""Exercise actual focus-window guards with the new WindowRelayoutResult API shape."""
from pathlib import Path
import runpy,tempfile
base=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-focus-window-hook.py')))
sources=dict(base['SOURCES'])
sources['ls/augment/com/hook/TestFocusWindowHook.java']=base['TEST'].replace('  System.out.println("FOCUS WINDOW HOOK RESULT "',base['FIT_INSETS_TEST']+base['DEVICE_EVIDENCE_TEST']+'  System.out.println("FOCUS WINDOW HOOK RESULT "')
for key,value in list(sources.items()):
    value=value.replace('InputChannel channel,InsetsState state,InsetsSourceControl.Array controls,android.graphics.Rect frame,float[] scale','InputChannel channel,WindowRelayoutResult outResult')
    value=value.replace('InputChannel.class,InsetsState.class,InsetsSourceControl.Array.class,android.graphics.Rect.class,float[].class','InputChannel.class,WindowRelayoutResult.class')
    value=value.replace('new InputChannel(),new InsetsState(),new InsetsSourceControl.Array(),new android.graphics.Rect(),new float[1]','new InputChannel(),new WindowRelayoutResult()')
    value=value.replace('int last,WindowRelayoutResult result)', 'int last,WindowRelayoutResult result,android.view.SurfaceControl surface)')
    if key.endswith('/TestFocusWindowHook.java'):
        value=value.replace('int.class,int.class,WindowRelayoutResult.class};','int.class,int.class,WindowRelayoutResult.class,android.view.SurfaceControl.class};')
        value=value.replace('0,0,0,0,new WindowRelayoutResult());','0,0,0,0,new WindowRelayoutResult(),new android.view.SurfaceControl());')
    if key.endswith('/DisplayManagerService.java'):value=value.replace('public DisplayDeviceInfo getDisplayDeviceInfoInternal','DisplayDeviceInfo getDisplayDeviceInfoInternal')
    sources[key]=value
sources['android/view/SurfaceControl.java']='package android.view;public class SurfaceControl{}'
with tempfile.TemporaryDirectory(prefix='duo-window-modern-') as folder:
    base['SUPPORT']['compile_run'](Path(folder),sources,['hook/AtomicWorkbenchImeHook.java','hook/AtomicWorkbenchFocusWindowHook.java','hook/AtomicWorkbenchDisplayDeviceEvidence.java','hook/AtomicWorkbenchFocusWindowDiagnostics.java','AtomicWorkbenchLogPolicy.java'],'ls.augment.com.hook.TestFocusWindowHook')

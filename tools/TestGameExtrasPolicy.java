package ls.augment.com.hook;

public final class TestGameExtrasPolicy {
    public static void main(String[] args){
        check(GameExtrasPolicy.recordMode(1,true)==2,"saving mode record");
        check(GameExtrasPolicy.recordMode(5,true)==2,"diablo record");
        check(GameExtrasPolicy.recordMode(5,false)==5,"other readers unchanged");
        check(GameExtrasPolicy.recordMode(3,true)==3,"unrelated mode unchanged");
        check(GameExtrasPolicy.recordingCaller(stack("cn.nubia.gamehighlights.Activity.MainActivity$g"),true),"main caller");
        check(GameExtrasPolicy.recordingCaller(stack("cn.nubia.gamehighlights.service.ScreenRecordService"),false),"record service");
        check(GameExtrasPolicy.recordingCaller(stack("cn.nubia.gamehighlights.service.TopService"),true),"top service chicken");
        check(GameExtrasPolicy.recordingCaller(stack("cn.nubia.gamehighlights.Service.TopService$d"),false),"background endurance monitor");
        check(!GameExtrasPolicy.recordingCaller(stack("cn.nubia.gamehighlights.Service.OtherTopService"),false),"unrelated background service");
        check(!GameExtrasPolicy.recordingCaller(stack("cn.nubia.OtherMainActivity"),true),"no substring collision");
        check(GameExtrasPolicy.isExplicitDismiss("user_back"),"manual dismiss retained");
        check(GameExtrasPolicy.isExplicitDismiss("touch_outside"),"outside retained");
        check(!GameExtrasPolicy.isExplicitDismiss("biablo_mode_changed"),"automatic mode panel dismiss");
        check(!GameExtrasPolicy.isAutomaticPanelDismiss("showBiabloModeDialog"),"confirmation must remain touchable");
        check(GameExtrasPolicy.isAutomaticPanelDismiss("biablo_mode_changed"),"completed mode change may keep panel");
        check(GameExtrasPolicy.isModeConfirmationCaller(new StackTraceElement[]{new StackTraceElement("cn.nubia.gameassist.performance.PerformanceModeController","F0","x",1)}),"actual confirmation caller");
        check(GameExtrasPolicy.isModeConfirmationCaller(new StackTraceElement[]{new StackTraceElement("cn.nubia.gameassist.performance.PerformanceModeController","showBiabloModeDialog","x",1)}),"named confirmation caller");
        check(!GameExtrasPolicy.isModeConfirmationCaller(stack("cn.nubia.gameassist.performance.PerformanceModeController")),"other performance dialogs unchanged");
        check(GameExtrasPolicy.isModeConfirmationCaller(stack("cn.nubia.gameassist.plugin.tiles.SuperResolutionTile")),"super confirmation caller");
        check(!GameExtrasPolicy.isModeConfirmationCaller(stack("cn.nubia.gameassist.plugin.tiles.OtherTile")),"other tiles unchanged");
        check(!GameExtrasPolicy.isAutomaticPanelDismiss("touch_outside"),"manual outside never blocked");
        check(!GameExtrasPolicy.isAutomaticPanelDismiss("tilehost"),"another tile is not blocked by timer");
        check(!GameExtrasPolicy.isAutomaticPanelDismiss("unknown"),"unknown closure retained");
        System.out.println("Game caller isolation and dismissal policy passed");
    }
    private static StackTraceElement[] stack(String cls){return new StackTraceElement[]{new StackTraceElement(cls,"run","x",1)};}
    private static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
}

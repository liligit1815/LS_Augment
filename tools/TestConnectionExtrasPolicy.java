package ls.augment.com;

public final class TestConnectionExtrasPolicy {
    public static void main(String[] args){
        int[] modes={0,2,3,4};for(int i=0;i<modes.length;i++)check(ConnectionExtrasPolicy.usbMode(i)==modes[i],"USB OEM mapping "+i);
        check(ConnectionExtrasPolicy.usbMode(4)==-1,"invalid USB mode not guessed");
        check(ConnectionExtrasPolicy.nfcScreenState(1)==8,"off unlocked NFC");
        check(ConnectionExtrasPolicy.nfcScreenState(2)==8,"off locked NFC");
        check(ConnectionExtrasPolicy.nfcScreenState(4)==8,"on locked NFC");
        check(ConnectionExtrasPolicy.nfcScreenState(8)==8,"on unlocked unchanged");
        check(ConnectionExtrasPolicy.nfcScreenState(99)==99,"unknown state retained");
        for(int hour=0;hour<24;hour++)check(ConnectionExtrasPolicy.periodIndex(hour)>=0,"full day "+hour);
        check(ConnectionExtrasPolicy.period(5).equals("凌晨")&&ConnectionExtrasPolicy.period(6).equals("早上"),"dawn boundary");
        check(ConnectionExtrasPolicy.period(12).equals("中午")&&ConnectionExtrasPolicy.period(13).equals("下午"),"noon boundary");
        check(ConnectionExtrasPolicy.time(0,5,false,"").equals("凌晨 12:05"),"12-hour midnight");
        check(ConnectionExtrasPolicy.time(12,5,false,"").equals("中午 12:05"),"12-hour noon");
        check(ConnectionExtrasPolicy.time(18,30,true,"关机 ").equals("关机 傍晚 18:30"),"title prefix retained");
        for(int i=0;i<7;i++)check(ConnectionExtrasPolicy.periodIndex(ConnectionExtrasPolicy.periodHour(i))==i,"period selection changes hour "+i);
        check(ConnectionExtrasPolicy.normalizeClockPattern("HH:mm:ss")!=null,"seconds pattern");
        check(ConnectionExtrasPolicy.normalizeClockPattern("HH:mm '")==null,"unclosed literal rejected");
        check(ConnectionExtrasPolicy.normalizeClockPattern("")==null,"empty clock rejected");
        System.out.println("Connection OEM mappings, NFC state isolation, period boundaries and clock validation passed");
    }
    private static void check(boolean result,String message){if(!result)throw new AssertionError(message);}
}

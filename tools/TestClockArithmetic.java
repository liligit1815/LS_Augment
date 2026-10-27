package ls.augment.com.hook;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public final class TestClockArithmetic {
    static int checks;
    static void check(boolean condition,String why){checks++;if(!condition)throw new AssertionError(why);}
    static void expect(long time,String pattern,String expected){
        var result=StatusBarClockFormatter.formatDetailed(time,Locale.US,true,false,false,false,pattern,"");
        check(result.valid&&expected.equals(result.text),pattern+" = "+result.text+"; "+result.error);
    }
    public static void main(String[] args){
        TimeZone previous=TimeZone.getDefault();
        try{
            TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
            Calendar date=Calendar.getInstance();date.clear();date.set(2026,0,1,2,5,9);long time=date.getTimeInMillis();
            expect(time,"HH-15:mm-10","10:55");
            expect(time,"yyyy-MM-dd E HH-15:mm-10","2025-12-31 Wed 10:55");
            expect(time,"HH:mm+120","04:05");expect(time,"HH+22:mm+55","01:00");
            expect(time,"hh-15:mm-10 a","10:55 AM");expect(time,"HH+1-2:mm+5-10","01:00");
            expect(time,"HH'-15':mm'-10'","02-15:05-10");expect(time,"'HH-15:mm-10' HH:mm","HH-15:mm-10 02:05");
            expect(time,"HH+0:mm-0:ss","02:05:09");
            var lines=StatusBarClockFormatter.formatDetailed(time,Locale.CHINA,true,false,true,true,"HH-15:mm-10","HH+1:mm");
            check(lines.valid&&lines.text.startsWith("10:55 上午 ")&&lines.text.endsWith("\n03:05"),"per-line duration and derived period");
            var bad=StatusBarClockFormatter.formatDetailed(time,Locale.US,true,false,false,false,"HH+999999999999999999999:mm","");
            check(!bad.valid&&!bad.error.isEmpty(),"overflow must fail visibly");
            TimeZone.setDefault(TimeZone.getTimeZone("America/New_York"));date=Calendar.getInstance();date.clear();date.set(2026,2,8,1,30,0);
            expect(date.getTimeInMillis(),"HH+1:mm","03:30");
            check(StatusBarClockFormatter.needsSecondRefresh("HH-15:mm-10:ss"),"seconds scheduler retained");
            check(!StatusBarClockFormatter.needsSecondRefresh("HH-15:mm-10 'ss'"),"quoted seconds are literal");
        }finally{TimeZone.setDefault(previous);}
        System.out.println("Clock arithmetic: "+checks+" checks passed");
    }
}

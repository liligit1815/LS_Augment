package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.SystemClock;
import ls.augment.com.IslandBatteryReading;

/** Read-only Android battery source. Called by the visible charging view's worker. */
final class IslandBatterySource {
    static IslandBatteryReading read(Context context){
        long at=SystemClock.elapsedRealtime();
        try{
            Intent intent=context.registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            if(intent==null)return IslandBatteryReading.unavailable(at);
            BatteryManager manager=context.getSystemService(BatteryManager.class);
            int current=Integer.MIN_VALUE;
            try{if(manager!=null)current=manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_NOW);}
            catch(RuntimeException unavailable){ /* Other actual readings remain usable. */ }
            return new IslandBatteryReading(at,intent.getBooleanExtra(BatteryManager.EXTRA_PRESENT,false),
                    intent.getIntExtra(BatteryManager.EXTRA_PLUGGED,0),intent.getIntExtra(BatteryManager.EXTRA_STATUS,0),
                    intent.getIntExtra(BatteryManager.EXTRA_LEVEL,-1),intent.getIntExtra(BatteryManager.EXTRA_SCALE,0),
                    intent.getIntExtra(BatteryManager.EXTRA_VOLTAGE,-1),current,
                    intent.getIntExtra(BatteryManager.EXTRA_TEMPERATURE,Integer.MIN_VALUE));
        }catch(RuntimeException unavailable){return IslandBatteryReading.unavailable(at);}
    }
    private IslandBatterySource(){}
}

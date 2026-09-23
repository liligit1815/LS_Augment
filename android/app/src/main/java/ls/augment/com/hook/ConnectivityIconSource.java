package ls.augment.com.hook;

import android.content.*;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.NetworkRequest;
import android.net.wifi.*;
import android.os.*;
import android.provider.Settings;
import android.telephony.*;
import java.util.*;
import java.util.concurrent.Executor;
import ls.augment.com.ConnectivityIconState;

/** SystemUI-owned callbacks. Binder reads never run in the status bar's draw pass. */
final class ConnectivityIconSource {
    private final Context context;
    private final HandlerThread thread=new HandlerThread("LS-connectivity-icon",android.os.Process.THREAD_PRIORITY_BACKGROUND);
    private final Handler worker;
    private final Executor executor;
    private final Runnable changed;
    // Same runtime setting observed by the ROM's MFVBatteryMeterView.
    private static final String CHARGE_SEPARATION = "charge_separation_switch";
    private final android.database.ContentObserver powerObserver;
    private boolean powerObserverRegistered,plugged;
    private int chargeSeparation,batteryStatus=-1;
    private String powerError="";
    private final Map<Integer,Radio> radios=new LinkedHashMap<>();
    private SubscriptionManager subscriptions;
    private SubscriptionManager.OnSubscriptionsChangedListener subscriptionListener;
    private ConnectivityManager connectivity;
    private ConnectivityManager.NetworkCallback wifiCallback;
    private String wifiError="",wifiListenerError="",wifiReason="initial",wifiPhase="unread";
    private int wifiRadioState=WifiManager.WIFI_STATE_UNKNOWN;
    private boolean wifiLinkConnected;
    private boolean receiverRegistered,subscriptionListening,wifiRead,subscriptionsRead;
    volatile boolean ready;
    private volatile boolean closed;
    private final Runnable wifiRecheck=()->{if(!closed){wifi();publish();}};
    private int battery=-1,wifiLevel,data=-1;
    private int signalBars=4;
    private java.lang.reflect.Method operatorLevelMethod;
    private boolean charging,wifiConnected,airplane;
    volatile ConnectivityIconState state=ConnectivityIconState.unknown();
    volatile String error="";
    ConnectivityIconSource(Context context,Runnable changed){this.context=context;this.changed=changed;
        thread.start();worker=new Handler(thread.getLooper());executor=task->{if(!closed)worker.post(task);};
        powerObserver=new android.database.ContentObserver(worker){
            @Override public void onChange(boolean selfChange){if(!closed){readPowerMode();publish();}}
        };
        worker.post(this::start);}
    private final BroadcastReceiver receiver=new BroadcastReceiver(){@Override public void onReceive(Context c,Intent intent){
        if(closed)return;
        if(Intent.ACTION_BATTERY_CHANGED.equals(intent.getAction()))battery(intent);
        else{refreshWifi(intent.getAction());if(Intent.ACTION_AIRPLANE_MODE_CHANGED.equals(intent.getAction())
                ||"android.intent.action.ACTION_DEFAULT_DATA_SUBSCRIPTION_CHANGED".equals(intent.getAction()))refreshSubscriptions();return;}
        publish();}};
    private void start(){if(closed)return;initializeSignalPolicy();try{
        IntentFilter filter=new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
        filter.addAction(WifiManager.RSSI_CHANGED_ACTION);filter.addAction(WifiManager.NETWORK_STATE_CHANGED_ACTION);
        filter.addAction(WifiManager.SUPPLICANT_STATE_CHANGED_ACTION);
        filter.addAction(WifiManager.WIFI_STATE_CHANGED_ACTION);filter.addAction(Intent.ACTION_AIRPLANE_MODE_CHANGED);
        filter.addAction("android.intent.action.ACTION_DEFAULT_DATA_SUBSCRIPTION_CHANGED");
        Intent sticky=context.registerReceiver(receiver,filter,null,worker,Context.RECEIVER_EXPORTED);receiverRegistered=true;
        if(sticky!=null)battery(sticky);
        subscriptions=context.getSystemService(SubscriptionManager.class);
        if(subscriptions!=null){subscriptionListener=new SubscriptionManager.OnSubscriptionsChangedListener(){
            @Override public void onSubscriptionsChanged(){if(!closed)refreshSubscriptions();}};
            subscriptions.addOnSubscriptionsChangedListener(executor,subscriptionListener);subscriptionListening=true;}
    }catch(RuntimeException failure){error="start:"+failure.getClass().getSimpleName();}
        try{context.getContentResolver().registerContentObserver(Settings.Global.getUriFor(CHARGE_SEPARATION),false,powerObserver);powerObserverRegistered=true;}
        catch(RuntimeException failure){powerError="observer:"+failure.getClass().getSimpleName();}
        readPowerMode();startWifiListener();refreshWifi("initial");refreshSubscriptions();publish();}
    private void battery(Intent intent){int level=intent.getIntExtra(BatteryManager.EXTRA_LEVEL,-1),scale=intent.getIntExtra(BatteryManager.EXTRA_SCALE,100);
        battery=level<0||scale<=0?-1:Math.round(level*100f/scale);
        batteryStatus=intent.getIntExtra(BatteryManager.EXTRA_STATUS,-1);
        plugged=intent.getIntExtra(BatteryManager.EXTRA_PLUGGED,0)!=0;
        charging=batteryStatus==BatteryManager.BATTERY_STATUS_CHARGING||batteryStatus==BatteryManager.BATTERY_STATUS_FULL;
        readPowerMode();}
    private void readPowerMode(){
        try{chargeSeparation=Settings.Global.getInt(context.getContentResolver(),CHARGE_SEPARATION,0);}
        catch(RuntimeException failure){chargeSeparation=0;powerError="read:"+failure.getClass().getSimpleName();}
    }
    private void startWifiListener(){
        connectivity=context.getSystemService(ConnectivityManager.class);
        if(connectivity==null)return;
        ConnectivityManager.NetworkCallback callback=new ConnectivityManager.NetworkCallback(){
            @Override public void onAvailable(Network network){refreshWifi("network_available");}
            @Override public void onCapabilitiesChanged(Network network,NetworkCapabilities capabilities){refreshWifi("network_capabilities");}
            @Override public void onLost(Network network){refreshWifi("network_lost");}
        };
        try{
            // Observe Wi-Fi even when mobile data/VPN is the default route, or
            // the access point has no Internet. No SSID/location data is needed.
            NetworkRequest request=new NetworkRequest.Builder().clearCapabilities()
                    .addTransportType(NetworkCapabilities.TRANSPORT_WIFI).build();
            connectivity.registerNetworkCallback(request,callback,worker);wifiCallback=callback;
        }catch(RuntimeException failure){wifiListenerError=failure.getClass().getSimpleName();}
    }
    private void refreshWifi(String reason){
        if(closed)return;
        wifiReason=reason;
        // Coalesce rapid transitions; delayed jobs always read current services,
        // never replay an old broadcast's WifiInfo/connected flag.
        worker.removeCallbacks(wifiRecheck);wifi();publish();
        for(long delay:new long[]{250,1000,2500,5000})worker.postDelayed(wifiRecheck,delay);
    }
    @SuppressWarnings("deprecation")
    private void wifi(){try{WifiManager manager=context.getSystemService(WifiManager.class);
        wifiRadioState=manager==null?WifiManager.WIFI_STATE_UNKNOWN:manager.getWifiState();
        WifiInfo info=wifiRadioState==WifiManager.WIFI_STATE_ENABLED?manager.getConnectionInfo():null;
        wifiPhase=info==null?"none":String.valueOf(info.getSupplicantState());
        // getConnectionInfo can briefly retain the previous association after a
        // disconnect. Require the current primary Wi-Fi link to be connected too.
        NetworkInfo link=connectivity==null?null:connectivity.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        wifiLinkConnected=link!=null&&link.isConnected();
        wifiConnected=wifiRadioState==WifiManager.WIFI_STATE_ENABLED&&wifiLinkConnected&&info!=null
                &&info.getSupplicantState()==SupplicantState.COMPLETED;
        wifiLevel=wifiConnected?WifiManager.calculateSignalLevel(info.getRssi(),4):0;wifiRead=true;wifiError="";
    }catch(RuntimeException failure){wifiConnected=false;wifiLevel=0;wifiError=failure.getClass().getSimpleName();}
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_wifi_input","radio="+wifiRadioState
                +";link="+wifiLinkConnected+";phase="+wifiPhase+";connected="+wifiConnected+";level="+wifiLevel
                +";callback="+(wifiCallback!=null)+";event="+wifiReason+";error="+wifiError+";listenerError="+wifiListenerError);
    }
    // Runs in the SystemUI host, whose permissions are independent of the module manifest.
    // Permission denial is handled explicitly; do not request phone/location access in the APK.
    @android.annotation.SuppressLint("MissingPermission")
    private void refreshSubscriptions(){if(closed)return;
        try{airplane=Settings.Global.getInt(context.getContentResolver(),Settings.Global.AIRPLANE_MODE_ON,0)!=0;
            data=SubscriptionManager.getDefaultDataSubscriptionId();
            List<SubscriptionInfo> active=subscriptions==null?Collections.emptyList():subscriptions.getActiveSubscriptionInfoList();
            if(active==null)active=Collections.emptyList();Set<Integer> keep=new HashSet<>();
            for(SubscriptionInfo sub:active)if(sub.getSimSlotIndex()>=0){int id=sub.getSubscriptionId();keep.add(id);
                Radio old=radios.get(id);if(old!=null&&old.slot==sub.getSimSlotIndex()&&old.listening)continue;
                if(old!=null)old.close();Radio radio=new Radio(id,sub.getSimSlotIndex());radios.put(id,radio);radio.start();}
            for(Integer id:new ArrayList<>(radios.keySet()))if(!keep.contains(id))radios.remove(id).close();
            subscriptionsRead=subscriptions!=null;
        }catch(SecurityException denied){
            subscriptionsRead=false;
            for(Radio radio:radios.values())radio.close();radios.clear();
            error="subscriptions:permission_denied";
        }catch(RuntimeException failure){error="subscriptions:"+failure.getClass().getSimpleName();}
        publish();}
    private final class Radio extends TelephonyCallback implements TelephonyCallback.SignalStrengthsListener,TelephonyCallback.ServiceStateListener {
        final int id,slot;TelephonyManager manager;int level=-1,standardLevel=-1,nativeLevel=-1;String levelSource="unread";ServiceState service;boolean listening;
        Radio(int id,int slot){this.id=id;this.slot=slot;}
        // SystemUI host authorization is enforced by telephony; NONE omits location data.
        // Both the initial query and callback registration tolerate revoked host access.
        @android.annotation.SuppressLint("MissingPermission")
        void start(){try{TelephonyManager base=context.getSystemService(TelephonyManager.class);if(base==null)return;
            manager=base.createForSubscriptionId(id);
            // Signal levels and service availability do not need location fields.
            try{service=manager.getServiceState(TelephonyManager.INCLUDE_LOCATION_DATA_NONE);}
            catch(SecurityException denied){service=null;} // An allowed callback may still supply state.
            catch(RuntimeException ignored){} // The initial callback can still supply service state.
            SignalStrength strength=manager.getSignalStrength();readLevel(strength);
            manager.registerTelephonyCallback(TelephonyManager.INCLUDE_LOCATION_DATA_NONE,executor,this);listening=true;
        }catch(SecurityException denied){listening=false;error="radio:permission_denied";}
        catch(RuntimeException failure){error="radio:"+failure.getClass().getSimpleName();}}
        @Override public void onSignalStrengthsChanged(SignalStrength strength){if(closed||radios.get(id)!=this)return;readLevel(strength);publish();}
        @Override public void onServiceStateChanged(ServiceState service){if(closed||radios.get(id)!=this)return;this.service=service;publish();}
        void readLevel(SignalStrength strength){
            nativeLevel=-1;
            if(strength==null){level=-1;standardLevel=-1;levelSource="unread";return;}
            standardLevel=Math.max(0,Math.min(4,strength.getLevel()));
            if(operatorLevelMethod!=null)try{
                Object raw=operatorLevelMethod.invoke(strength);
                if(raw instanceof Integer){
                    nativeLevel=(Integer)raw;
                    if(nativeLevel>=0&&nativeLevel<=5){
                        level=Math.min(signalBars,nativeLevel);levelSource="operator";return;
                    }
                }
            }catch(ReflectiveOperationException|RuntimeException ignored){}
            // Match the native fallback: use the primary radio's aggregate level,
            // never the strongest unrelated radio technology in the list.
            level=standardLevel;levelSource=operatorLevelMethod==null?"android":"android_fallback";
        }
        int displayedLevel(){if(service==null)return level;
            if(service.getState()==ServiceState.STATE_IN_SERVICE)return level;
            for(NetworkRegistrationInfo info:service.getNetworkRegistrationInfoList())if(info.isRegistered())return level;
            return 0;}
        void close(){if(listening&&manager!=null)try{manager.unregisterTelephonyCallback(this);}catch(RuntimeException ignored){}listening=false;}
    }
    private void initializeSignalPolicy(){
        String policy="android_default";
        try{
            // The ROM's USE_FIVE_LEVEL_SIGNAL selects a SoftBank icon variant;
            // false still uses six entries (levels 0..5) on this ROM. Read the
            // actual default icon table instead of interpreting that flag.
            Class<?> icons=Class.forName("com.zte.feature.signal.icons.StrengthIcon",true,context.getClassLoader());
            Object table=icons.getField("strengths").get(icons.getConstructor().newInstance());
            if(table instanceof List){
                int bars=((List<?>)table).size()-1;
                if(bars==4||bars==5){signalBars=bars;policy="native_icon_table";}
            }
        }catch(ReflectiveOperationException|RuntimeException|LinkageError unavailable){policy="android_default:"+unavailable.getClass().getSimpleName();}
        try{
            // Same API used by MobileSignalFeature on this Qualcomm ROM.
            operatorLevelMethod=SignalStrength.class.getMethod("getOperatorLevel");
            operatorLevelMethod.setAccessible(true);
        }catch(ReflectiveOperationException|RuntimeException|LinkageError unavailable){operatorLevelMethod=null;}
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_signal_bars",String.valueOf(signalBars));
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_signal_policy",policy);
    }
    private void publish(){if(closed)return;ArrayList<ConnectivityIconState.Sim> sims=new ArrayList<>();
        for(Radio radio:radios.values())sims.add(new ConnectivityIconState.Sim(radio.id,radio.slot,radio.displayedLevel(),signalBars));
        ConnectivityIconState.PowerState power=ConnectivityIconState.powerState(plugged,charging,chargeSeparation);
        state=new ConnectivityIconState(battery,power,wifiConnected,wifiLevel,airplane,data,sims);
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_charge_input","plugged="+plugged+";status="+batteryStatus
                +";separation="+chargeSeparation+";mode="+power+";observer="+powerObserverRegistered+";error="+powerError);
        boolean radiosReady=true;for(Radio radio:radios.values())radiosReady&=radio.listening;
        ready=receiverRegistered&&subscriptionListening&&battery>=0&&wifiRead&&subscriptionsRead&&radiosReady;
        StringBuilder witness=new StringBuilder("bars=").append(signalBars);
        for(Radio radio:radios.values())witness.append(";SIM").append(radio.slot+1).append("{source=").append(radio.levelSource)
                .append(",standard=").append(radio.standardLevel).append(",native=").append(radio.nativeLevel)
                .append(",display=").append(radio.displayedLevel()).append('}');
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_signal_input",witness.toString());
        changed.run();}
    void close(){if(closed)return;closed=true;worker.post(()->{
        worker.removeCallbacks(wifiRecheck);
        if(powerObserverRegistered)try{context.getContentResolver().unregisterContentObserver(powerObserver);}catch(RuntimeException ignored){}
        if(connectivity!=null&&wifiCallback!=null)try{connectivity.unregisterNetworkCallback(wifiCallback);}catch(RuntimeException ignored){}
        if(receiverRegistered)try{context.unregisterReceiver(receiver);}catch(RuntimeException ignored){}
        if(subscriptions!=null&&subscriptionListener!=null)try{subscriptions.removeOnSubscriptionsChangedListener(subscriptionListener);}catch(RuntimeException ignored){}
        for(Radio radio:radios.values())radio.close();radios.clear();thread.quitSafely();});}
}

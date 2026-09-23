package com.android.server.utils;

/** Compilation signature only. This class must never be packaged in the APK. */
public interface Watchable {
    void registerObserver(Watcher observer);
    void unregisterObserver(Watcher observer);
    boolean isRegisteredObserver(Watcher observer);
    void dispatchChange(Watchable what);
}

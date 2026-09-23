package com.android.server.utils;

/** Compilation signature only. The actual superclass is owned by system_server. */
public abstract class Watcher {
    public Watcher() {}
    public abstract void onChange(Watchable what);
}

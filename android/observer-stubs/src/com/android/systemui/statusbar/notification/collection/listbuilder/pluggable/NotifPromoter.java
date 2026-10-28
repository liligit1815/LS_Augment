package com.android.systemui.statusbar.notification.collection.listbuilder.pluggable;

import com.android.systemui.statusbar.notification.collection.NotificationEntry;

/** Compile-only signature, resolved from the target SystemUI loader. */
public abstract class NotifPromoter extends Pluggable<NotifPromoter> {
    public NotifPromoter(String name) { super(name); }
    public abstract boolean shouldPromoteToTopLevel(NotificationEntry entry);
}

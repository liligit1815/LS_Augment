package ls.augment.com;

import com.android.systemui.statusbar.notification.collection.NotificationEntry;
import com.android.systemui.statusbar.notification.collection.listbuilder.pluggable.NotifPromoter;
import java.util.function.Predicate;

/** Loaded only through a SystemUI-parent loader; the callback uses a boot-library type. */
public final class IndependentNotificationPromoter extends NotifPromoter {
    private final Predicate<Object> callback;

    public IndependentNotificationPromoter(Predicate<Object> callback) {
        super("RedMagicDuoIndependentNotifications");
        this.callback = callback;
    }

    @Override public boolean shouldPromoteToTopLevel(NotificationEntry entry) {
        return callback.test(entry);
    }
}

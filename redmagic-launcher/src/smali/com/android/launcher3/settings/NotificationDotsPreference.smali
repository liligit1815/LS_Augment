.class public Lcom/android/launcher3/settings/NotificationDotsPreference;
.super Landroidx/preference/Preference;
.source "NotificationDotsPreference.java"

# interfaces
.implements Lcom/android/launcher3/util/p2$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/settings/NotificationDotsPreference$NotificationAccessConfirmation;
    }
.end annotation


# instance fields
.field private W:Z

.field private final X:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->W:Z

    .line 6
    .line 7
    new-instance p1, Lcom/android/launcher3/settings/NotificationDotsPreference$a;

    .line 8
    .line 9
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/settings/NotificationDotsPreference$a;-><init>(Lcom/android/launcher3/settings/NotificationDotsPreference;Landroid/os/Handler;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->X:Landroid/database/ContentObserver;

    .line 19
    .line 20
    return-void
.end method

.method static bridge synthetic U0(Lcom/android/launcher3/settings/NotificationDotsPreference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/NotificationDotsPreference;->W0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V0(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->W:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->W:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/preference/Preference;->Q()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private W0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/util/p2;

    .line 12
    .line 13
    sget-object v1, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/settings/NotificationDotsPreference;->onSettingsChanged(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/util/p2;

    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "enabled_notification_listeners"

    .line 30
    .line 31
    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x0

    .line 36
    iget-object v3, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->X:Landroid/database/ContentObserver;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/launcher3/settings/NotificationDotsPreference;->W0()V

    .line 42
    .line 43
    .line 44
    new-instance v0, Landroid/os/Bundle;

    .line 45
    .line 46
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v1, ":settings:fragment_args_key"

    .line 50
    .line 51
    const-string v2, "notification_badging"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Landroid/content/Intent;

    .line 57
    .line 58
    const-string v2, "android.settings.NOTIFICATION_SETTINGS"

    .line 59
    .line 60
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v2, ":settings:show_fragment_args"

    .line 64
    .line 65
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public W(Landroidx/preference/h;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020018

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->W:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 p0, 0x8

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/util/p2;

    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/settings/NotificationDotsPreference;->X:Landroid/database/ContentObserver;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onSettingsChanged(Z)V
    .locals 5

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const v0, 0x7f1402cd

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const v0, 0x7f1402cc

    .line 8
    .line 9
    .line 10
    :goto_0
    const/4 v1, 0x1

    .line 11
    if-eqz p1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v2, "enabled_notification_listeners"

    .line 22
    .line 23
    invoke-static {p1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v2, Landroid/content/ComponentName;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-class v4, Lcom/android/launcher3/notification/NotificationListener;

    .line 34
    .line 35
    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_2

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const/4 v1, 0x0

    .line 62
    :cond_2
    :goto_1
    if-nez v1, :cond_3

    .line 63
    .line 64
    const v0, 0x7f14045a

    .line 65
    .line 66
    .line 67
    :cond_3
    xor-int/lit8 p1, v1, 0x1

    .line 68
    .line 69
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/NotificationDotsPreference;->V0(Z)V

    .line 70
    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    const-class p1, Lcom/android/launcher3/settings/NotificationDotsPreference$NotificationAccessConfirmation;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :goto_2
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->x0(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->I0(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

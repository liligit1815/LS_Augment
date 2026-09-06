.class Lcom/android/launcher3/settings/NotificationDotsPreference$a;
.super Landroid/database/ContentObserver;
.source "NotificationDotsPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/settings/NotificationDotsPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/settings/NotificationDotsPreference;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/NotificationDotsPreference;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/NotificationDotsPreference$a;->a:Lcom/android/launcher3/settings/NotificationDotsPreference;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/NotificationDotsPreference$a;->a:Lcom/android/launcher3/settings/NotificationDotsPreference;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/settings/NotificationDotsPreference;->U0(Lcom/android/launcher3/settings/NotificationDotsPreference;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

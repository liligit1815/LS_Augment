.class public Landroidx/core/app/i;
.super Ljava/lang/Object;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/app/i$a;,
        Landroidx/core/app/i$c;,
        Landroidx/core/app/i$e;,
        Landroidx/core/app/i$b;,
        Landroidx/core/app/i$f;,
        Landroidx/core/app/i$d;
    }
.end annotation


# direct methods
.method public static a(Landroid/app/Notification;)Landroid/os/Bundle;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

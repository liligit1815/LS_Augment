.class public Lcom/android/launcher3/util/j2;
.super Landroid/database/ContentObserver;
.source "SecureSettingsObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/j2$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/ContentResolver;

.field private final b:Ljava/lang/String;

.field private final c:I

.field private final d:Lcom/android/launcher3/util/j2$a;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Lcom/android/launcher3/util/j2$a;Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/util/j2;->a:Landroid/content/ContentResolver;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/launcher3/util/j2;->d:Lcom/android/launcher3/util/j2$a;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/android/launcher3/util/j2;->b:Ljava/lang/String;

    .line 14
    .line 15
    iput p4, p0, Lcom/android/launcher3/util/j2;->c:I

    .line 16
    .line 17
    return-void
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/util/j2$a;)Lcom/android/launcher3/util/j2;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/j2;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "notification_badging"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/launcher3/util/j2;-><init>(Landroid/content/ContentResolver;Lcom/android/launcher3/util/j2$a;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/j2;->onChange(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/j2;->a:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/j2;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/j2;->c:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public d()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/j2;->a:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/j2;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/j2;->a:Landroid/content/ContentResolver;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onChange(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/util/j2;->d:Lcom/android/launcher3/util/j2$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/j2;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-interface {p1, p0}, Lcom/android/launcher3/util/j2$a;->onSettingsChanged(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

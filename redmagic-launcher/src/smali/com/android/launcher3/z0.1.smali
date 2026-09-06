.class public Lcom/android/launcher3/z0;
.super Ljava/lang/Object;
.source "GestureNavContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/z0$a;
    }
.end annotation


# static fields
.field private static d:Lcom/android/launcher3/z0$a;


# instance fields
.field public final a:Landroid/content/ComponentName;

.field public final b:Landroid/os/UserHandle;

.field private final c:Landroid/os/Message;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/z0;->a:Landroid/content/ComponentName;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/z0;->b:Landroid/os/UserHandle;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/z0;->c:Landroid/os/Message;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Landroid/content/Intent;)Lcom/android/launcher3/z0;
    .locals 4

    .line 1
    const-string v0, "gesture_nav_contract_v1"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "android.intent.extra.COMPONENT_NAME"

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/content/ComponentName;

    .line 21
    .line 22
    const-string v0, "android.intent.extra.USER"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/os/UserHandle;

    .line 29
    .line 30
    const-string v3, "android.intent.extra.REMOTE_CALLBACK"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Landroid/os/Message;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object v3, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 45
    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    new-instance v2, Lcom/android/launcher3/z0;

    .line 49
    .line 50
    invoke-direct {v2, p0, v0, v1}, Lcom/android/launcher3/z0;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/os/Message;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-object v2
.end method


# virtual methods
.method public b(Landroid/graphics/RectF;Lcom/android/launcher3/views/k;Landroid/view/SurfaceControl;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "gesture_nav_contract_icon_position"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "gesture_nav_contract_surface_control"

    .line 12
    .line 13
    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/android/launcher3/z0;->d:Lcom/android/launcher3/z0$a;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Lcom/android/launcher3/z0$a;

    .line 21
    .line 22
    const/4 p3, 0x0

    .line 23
    invoke-direct {p1, p3}, Lcom/android/launcher3/z0$a;-><init>(Lcom/android/launcher3/A0;)V

    .line 24
    .line 25
    .line 26
    sput-object p1, Lcom/android/launcher3/z0;->d:Lcom/android/launcher3/z0$a;

    .line 27
    .line 28
    :cond_0
    sget-object p1, Lcom/android/launcher3/z0;->d:Lcom/android/launcher3/z0$a;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Lcom/android/launcher3/z0$a;->a(Lcom/android/launcher3/views/k;)Landroid/os/Message;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "gesture_nav_contract_finish_callback"

    .line 35
    .line 36
    invoke-virtual {v0, p2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Lcom/android/launcher3/z0;->c:Landroid/os/Message;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/os/Message;->copyFrom(Landroid/os/Message;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object p0, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    const-string p1, "GestureNavContract"

    .line 59
    .line 60
    const-string p2, "Error sending icon position"

    .line 61
    .line 62
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 63
    .line 64
    .line 65
    return-void
.end method

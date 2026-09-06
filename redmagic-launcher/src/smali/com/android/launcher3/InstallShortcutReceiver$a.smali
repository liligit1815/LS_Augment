.class Lcom/android/launcher3/InstallShortcutReceiver$a;
.super Lorg/json/JSONObject;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/InstallShortcutReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/content/Intent;

.field public final b:Landroid/os/UserHandle;


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 2
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3
    const-string p1, "intent.launch"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$a;->a:Landroid/content/Intent;

    .line 4
    const-string p1, "userHandle"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 6
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/t;

    .line 7
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, LD1/t;->n(J)Landroid/os/UserHandle;

    move-result-object p1

    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/InstallShortcutReceiver$a;->b:Landroid/os/UserHandle;

    if-eqz p1, :cond_1

    return-void

    .line 9
    :cond_1
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid user"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method synthetic constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/launcher3/k1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/InstallShortcutReceiver$a;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method

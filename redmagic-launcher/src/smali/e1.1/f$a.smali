.class Le1/f$a;
.super Landroid/content/BroadcastReceiver;
.source "CMWidgetsManagerHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le1/f;->Q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Le1/f;


# direct methods
.method constructor <init>(Le1/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Le1/f$a;->a:Le1/f;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Le1/f$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Le1/f$a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Le1/f$a;->a:Le1/f;

    .line 2
    .line 3
    invoke-static {v0}, Le1/f;->g(Le1/f;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Le1/f$a;->a:Le1/f;

    .line 14
    .line 15
    invoke-static {v0}, Le1/f;->j(Le1/f;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Le1/f$a;->a:Le1/f;

    .line 26
    .line 27
    invoke-static {v1, v0}, Le1/f;->h(Le1/f;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Le1/f$a;->a:Le1/f;

    .line 31
    .line 32
    invoke-static {v0}, Le1/f;->i(Le1/f;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Le1/f$a;->a:Le1/f;

    .line 36
    .line 37
    invoke-static {p0}, Le1/f;->s(Le1/f;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "android.intent.action.SIM_STATE_CHANGED"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "onReceive: action: "

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "CMWidgetsManagerHelper"

    .line 35
    .line 36
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    sget-object p1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    new-instance p2, Le1/e;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Le1/e;-><init>(Le1/f$a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.class Lcom/android/launcher3/C2$f;
.super Landroid/content/BroadcastReceiver;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/C2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$f;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "com.zte.heartyservice.intent.action.UNINSTALL_HEARTY_SERVICE"

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_2

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/C2$f;->a:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/android/launcher3/C2;->D0:Landroid/view/View;

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    instance-of v1, p2, Lcom/android/launcher3/BubbleTextView;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    move-object v1, p2

    .line 27
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->K1()Lcom/android/launcher3/anim/G;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    new-instance v2, Lcom/android/launcher3/C2$f$a;

    .line 43
    .line 44
    invoke-direct {v2, p0, p1, v0}, Lcom/android/launcher3/C2$f$a;-><init>(Lcom/android/launcher3/C2$f;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p2, v2}, Lcom/android/launcher3/anim/G;->f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    const-string p0, "Launcher"

    .line 68
    .line 69
    const-string p2, "Uninstall heartyService, originalView type is error"

    .line 70
    .line 71
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    new-instance p0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    new-instance p2, Lcom/android/launcher3/util/E;

    .line 80
    .line 81
    new-instance v0, Landroid/content/ComponentName;

    .line 82
    .line 83
    const-string v1, "com.zte.heartyservice"

    .line 84
    .line 85
    const-string v2, "com.zte.heartyservice.main.HeartServiceActivityLauncher"

    .line 86
    .line 87
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-direct {p2, v0, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/H5;->E1(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    return-void
.end method

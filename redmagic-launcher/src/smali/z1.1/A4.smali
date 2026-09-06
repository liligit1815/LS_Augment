.class public Lz1/A4;
.super Landroid/content/BroadcastReceiver;
.source "SdCardAvailableReceiver.java"


# instance fields
.field private final a:Lcom/android/launcher3/D3;

.field private final b:Landroid/content/Context;

.field private final c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/D3;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/D3;",
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/A4;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/A4;->a:Lcom/android/launcher3/D3;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/A4;->c:Ljava/util/Set;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    .line 1
    const-class p2, Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Landroid/content/pm/LauncherApps;

    .line 8
    .line 9
    iget-object v0, p0, Lz1/A4;->c:Ljava/util/Set;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/android/launcher3/util/L1;

    .line 26
    .line 27
    iget-object v2, v1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 28
    .line 29
    new-instance v3, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v4, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v5, v1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p2, v5, v2}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-nez v5, :cond_2

    .line 46
    .line 47
    new-instance v5, Lcom/android/launcher3/util/k;

    .line 48
    .line 49
    iget-object v6, v1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v5, p1, v6, v2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5}, Lcom/android/launcher3/util/k;->l()Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    iget-object v1, v1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    iget-object v1, v1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    iget-object v1, p0, Lz1/A4;->a:Lcom/android/launcher3/D3;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1, v2, v3}, Lz1/Q2;->j(Landroid/os/UserHandle;Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_0

    .line 91
    .line 92
    iget-object v1, p0, Lz1/A4;->a:Lcom/android/launcher3/D3;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    new-array v3, v3, [Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, [Ljava/lang/String;

    .line 109
    .line 110
    const/4 v4, 0x0

    .line 111
    invoke-virtual {v1, v3, v2, v4}, Lz1/Q2;->onPackagesUnavailable([Ljava/lang/String;Landroid/os/UserHandle;Z)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    iget-object p1, p0, Lz1/A4;->b:Landroid/content/Context;

    .line 116
    .line 117
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

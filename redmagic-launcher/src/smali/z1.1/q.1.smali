.class public Lz1/q;
.super Ljava/lang/Object;
.source "AppEventProducer.java"

# interfaces
.implements Lcom/android/quickstep/logging/StatsLogCompatManager$StatsLogConsumer;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/os/Handler;

.field private final c:Ljava/util/function/ObjIntConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/ObjIntConsumer<",
            "Landroid/app/prediction/AppTargetEvent;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/function/ObjIntConsumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/function/ObjIntConsumer<",
            "Landroid/app/prediction/AppTargetEvent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/q;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Landroid/os/Handler;

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lz1/p;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lz1/p;-><init>(Lz1/q;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p1, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lz1/q;->b:Landroid/os/Handler;

    .line 23
    .line 24
    iput-object p2, p0, Lz1/q;->c:Ljava/util/function/ObjIntConsumer;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(LD1/t;ILandroid/os/UserHandle;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic b(Lz1/q;Landroid/os/Message;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/q;->h(Landroid/os/Message;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private c()Landroid/app/prediction/AppTarget;
    .locals 5

    .line 1
    new-instance v0, Landroid/app/prediction/AppTarget$Builder;

    .line 2
    .line 3
    new-instance v1, Landroid/app/prediction/AppTargetId;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "folder:"

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-direct {v1, v2}, Landroid/app/prediction/AppTargetId;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lz1/q;->a:Landroid/content/Context;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-direct {v0, v1, p0, v2}, Landroid/app/prediction/AppTarget$Builder;-><init>(Landroid/app/prediction/AppTargetId;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/app/prediction/AppTarget$Builder;->build()Landroid/app/prediction/AppTarget;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method private d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lz1/q$a;->c:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    aget v0, v0, v1

    .line 16
    .line 17
    const-string v1, "search-results"

    .line 18
    .line 19
    packed-switch v0, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d;->b()Lcom/android/launcher3/logger/d$b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p1, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 32
    .line 33
    if-ne p0, p1, :cond_0

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_0
    :goto_0
    const-string p0, ""

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_1
    return-object v1

    .line 40
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object p1, Lz1/q$a;->b:[I

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    aget p1, p1, v0

    .line 55
    .line 56
    const-string v0, "folder/"

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    if-eq p1, v1, :cond_2

    .line 60
    .line 61
    const/4 v1, 0x2

    .line 62
    if-eq p1, v1, :cond_1

    .line 63
    .line 64
    const-string p0, "folder"

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Lz1/q;->e(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0, v1, v1}, Lz1/q;->g(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;II)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :pswitch_3
    const-string p0, "taskbar"

    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_4
    const-string p0, "deep-shortcuts"

    .line 119
    .line 120
    return-object p0

    .line 121
    :pswitch_5
    const-string p0, "predictions"

    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_6
    const-string p0, "predictions/hotseat"

    .line 125
    .line 126
    return-object p0

    .line 127
    :pswitch_7
    const-string p0, "all-apps"

    .line 128
    .line 129
    return-object p0

    .line 130
    :pswitch_8
    const-string p0, "task-switcher"

    .line 131
    .line 132
    return-object p0

    .line 133
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Lz1/q;->e(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :pswitch_a
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanX()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanY()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p0, v0, p1}, Lz1/q;->g(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;II)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0

    .line 167
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static e(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->getIndex()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "hotseat/%1$d/[%1$d,0]/[1,1]"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private f(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getUserType()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x2

    .line 6
    if-eq p0, p1, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    if-eq p0, p1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    return p1

    .line 18
    :cond_2
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method private static g(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;II)Ljava/lang/String;
    .locals 3

    .line 1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridX()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridY()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    filled-new-array {v1, v2, p0, p1, p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "workspace/%d/[%d,%d]/[%d,%d]"

    .line 40
    .line 41
    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method private h(Landroid/os/Message;)Z
    .locals 1

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lz1/q;->c:Ljava/util/function/ObjIntConsumer;

    .line 8
    .line 9
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Landroid/app/prediction/AppTargetEvent;

    .line 12
    .line 13
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 14
    .line 15
    invoke-interface {p0, v0, p1}, Ljava/util/function/ObjIntConsumer;->accept(Ljava/lang/Object;I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method private static i(Ljava/lang/String;)Landroid/content/ComponentName;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private j(Landroid/app/prediction/AppTarget;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/app/prediction/AppTargetEvent$Builder;

    .line 10
    .line 11
    invoke-direct {v0, p1, p3}, Landroid/app/prediction/AppTargetEvent$Builder;-><init>(Landroid/app/prediction/AppTarget;I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p2}, Lz1/q;->d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Landroid/app/prediction/AppTargetEvent$Builder;->setLaunchLocation(Ljava/lang/String;)Landroid/app/prediction/AppTargetEvent$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/app/prediction/AppTargetEvent$Builder;->build()Landroid/app/prediction/AppTargetEvent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lz1/q;->b:Landroid/os/Handler;

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p2, p4, p2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lz1/q;->l(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Landroid/app/prediction/AppTarget;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0, p1, p2, p3}, Lz1/q;->j(Landroid/app/prediction/AppTarget;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public consume(Lcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, -0x66

    .line 5
    .line 6
    if-eq p1, v0, :cond_11

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->l:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    if-eq p1, v0, :cond_11

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->j:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 13
    .line 14
    if-eq p1, v0, :cond_11

    .line 15
    .line 16
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->o0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 17
    .line 18
    if-eq p1, v0, :cond_11

    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->n0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 21
    .line 22
    if-eq p1, v0, :cond_11

    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->m:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 25
    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->G:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 31
    .line 32
    if-eq p1, v0, :cond_10

    .line 33
    .line 34
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->U:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 35
    .line 36
    if-ne p1, v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :cond_1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->o:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 41
    .line 42
    if-ne p1, v0, :cond_2

    .line 43
    .line 44
    iput-object p2, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->p:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 48
    .line 49
    const/16 v3, -0x6f

    .line 50
    .line 51
    const/4 v4, 0x4

    .line 52
    const/4 v5, 0x3

    .line 53
    const/16 v6, -0x67

    .line 54
    .line 55
    if-ne p1, v0, :cond_7

    .line 56
    .line 57
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_3
    invoke-static {p1}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_4

    .line 68
    .line 69
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 70
    .line 71
    invoke-direct {p0, p1, v4, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 72
    .line 73
    .line 74
    :cond_4
    invoke-static {p2}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_5

    .line 79
    .line 80
    invoke-direct {p0, p2, v5, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 81
    .line 82
    .line 83
    :cond_5
    invoke-static {p2}, Lz1/i4;->d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_6

    .line 88
    .line 89
    invoke-direct {p0, p2, v5, v3}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 90
    .line 91
    .line 92
    :cond_6
    const/4 p1, 0x0

    .line 93
    iput-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 94
    .line 95
    return-void

    .line 96
    :cond_7
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->r:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 97
    .line 98
    if-ne p1, v0, :cond_8

    .line 99
    .line 100
    invoke-static {p2}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_f

    .line 105
    .line 106
    invoke-direct {p0}, Lz1/q;->c()Landroid/app/prediction/AppTarget;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-direct {p0, p1, p2, v5, v6}, Lz1/q;->j(Landroid/app/prediction/AppTarget;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 111
    .line 112
    .line 113
    invoke-direct {p0, p2, v4, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_8
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->Z0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 118
    .line 119
    if-ne p1, v0, :cond_9

    .line 120
    .line 121
    invoke-static {p2}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_f

    .line 126
    .line 127
    invoke-direct {p0}, Lz1/q;->c()Landroid/app/prediction/AppTarget;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-direct {p0, p1, p2, v4, v6}, Lz1/q;->j(Landroid/app/prediction/AppTarget;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0, p2, v5, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_9
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->E:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 139
    .line 140
    if-ne p1, v0, :cond_b

    .line 141
    .line 142
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 143
    .line 144
    if-eqz p1, :cond_a

    .line 145
    .line 146
    invoke-static {p1}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_a

    .line 151
    .line 152
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 153
    .line 154
    invoke-direct {p0, p1, v4, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 155
    .line 156
    .line 157
    :cond_a
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 158
    .line 159
    if-eqz p1, :cond_f

    .line 160
    .line 161
    invoke-static {p1}, Lz1/i4;->d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_f

    .line 166
    .line 167
    iget-object p1, p0, Lz1/q;->d:Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 168
    .line 169
    invoke-direct {p0, p1, v4, v3}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_b
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->a1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 174
    .line 175
    if-ne p1, v0, :cond_c

    .line 176
    .line 177
    invoke-static {p2}, Lz1/i4;->b(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_f

    .line 182
    .line 183
    invoke-direct {p0, p2, v5, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_c
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->e0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 188
    .line 189
    if-ne p1, v0, :cond_d

    .line 190
    .line 191
    new-instance p1, Landroid/app/prediction/AppTarget$Builder;

    .line 192
    .line 193
    new-instance v0, Landroid/app/prediction/AppTargetId;

    .line 194
    .line 195
    const-string v3, "launcher:launcher"

    .line 196
    .line 197
    invoke-direct {v0, v3}, Landroid/app/prediction/AppTargetId;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v3, p0, Lz1/q;->a:Landroid/content/Context;

    .line 201
    .line 202
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-direct {p1, v0, v3, v4}, Landroid/app/prediction/AppTarget$Builder;-><init>(Landroid/app/prediction/AppTargetId;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1}, Landroid/app/prediction/AppTarget$Builder;->build()Landroid/app/prediction/AppTarget;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-direct {p0, p1, p2, v1, v2}, Lz1/q;->j(Landroid/app/prediction/AppTarget;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_d
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->F2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 222
    .line 223
    if-ne p1, v0, :cond_e

    .line 224
    .line 225
    const/4 p1, 0x5

    .line 226
    invoke-direct {p0, p2, p1, v6}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_e
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->r3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 231
    .line 232
    if-ne p1, v0, :cond_f

    .line 233
    .line 234
    invoke-static {p2}, Lz1/i4;->d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-eqz p1, :cond_f

    .line 239
    .line 240
    invoke-direct {p0, p2, v5, v3}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 241
    .line 242
    .line 243
    :cond_f
    :goto_0
    return-void

    .line 244
    :cond_10
    :goto_1
    const/4 p1, 0x2

    .line 245
    invoke-direct {p0, p2, p1, v2}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :cond_11
    :goto_2
    invoke-direct {p0, p2, v1, v2}, Lz1/q;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;II)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method l(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Landroid/app/prediction/AppTarget;
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Lz1/q;->f(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    iget-object v2, p0, Lz1/q;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, LD1/t;

    .line 14
    .line 15
    invoke-virtual {v1}, LD1/t;->p()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Lz1/o;

    .line 24
    .line 25
    invoke-direct {v3, v1, v0}, Lz1/o;-><init>(LD1/t;I)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/os/UserHandle;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_0
    sget-object v2, Lz1/q$a;->a:[I

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    aget v2, v2, v3

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    const-string v4, "app:"

    .line 60
    .line 61
    if-eq v2, v3, :cond_9

    .line 62
    .line 63
    const/4 v3, 0x2

    .line 64
    if-eq v2, v3, :cond_5

    .line 65
    .line 66
    const/4 v3, 0x3

    .line 67
    if-eq v2, v3, :cond_4

    .line 68
    .line 69
    const/4 v3, 0x4

    .line 70
    if-eq v2, v3, :cond_2

    .line 71
    .line 72
    const/4 p1, 0x5

    .line 73
    if-eq v2, p1, :cond_1

    .line 74
    .line 75
    goto/16 :goto_2

    .line 76
    .line 77
    :cond_1
    invoke-direct {p0}, Lz1/q;->c()Landroid/app/prediction/AppTarget;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTask()Lcom/android/launcher3/logger/LauncherAtom$Task;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Task;->getComponentName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Lz1/q;->i(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    if-eqz p0, :cond_3

    .line 95
    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    :goto_0
    move-object v2, p1

    .line 116
    move-object p1, v1

    .line 117
    goto/16 :goto_3

    .line 118
    .line 119
    :cond_3
    move-object p1, v1

    .line 120
    :goto_1
    move-object v2, p1

    .line 121
    goto/16 :goto_3

    .line 122
    .line 123
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getComponentName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {p0}, Lz1/q;->i(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    if-eqz p0, :cond_3

    .line 136
    .line 137
    new-instance p1, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    const-string v2, "widget:"

    .line 143
    .line 144
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    goto :goto_0

    .line 159
    :cond_5
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getShortcut()Lcom/android/launcher3/logger/LauncherAtom$Shortcut;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutId()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-nez v2, :cond_8

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutName()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-static {v2}, Lz1/q;->i(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    if-eqz v2, :cond_7

    .line 182
    .line 183
    new-instance v3, LN1/f;

    .line 184
    .line 185
    iget-object p0, p0, Lz1/q;->a:Landroid/content/Context;

    .line 186
    .line 187
    invoke-direct {v3, p0, v0}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutId()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    filled-new-array {v4}, [Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v3, p0, v4}, LN1/f;->c(Ljava/lang/String;[Ljava/lang/String;)LN1/f;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const/16 v3, 0xb

    .line 207
    .line 208
    invoke-virtual {p0, v3}, LN1/f;->d(I)LN1/f$a;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {p0}, Ljava/util/Optional;->isPresent()Z

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    if-eqz v3, :cond_6

    .line 225
    .line 226
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    check-cast p0, Landroid/content/pm/ShortcutInfo;

    .line 231
    .line 232
    new-instance v3, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v4, "shortcut:"

    .line 238
    .line 239
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutId()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    move-object v5, p1

    .line 254
    move-object p1, p0

    .line 255
    move-object p0, v2

    .line 256
    move-object v2, v5

    .line 257
    goto :goto_3

    .line 258
    :cond_6
    return-object v1

    .line 259
    :cond_7
    move-object p1, v1

    .line 260
    move-object p0, v2

    .line 261
    goto/16 :goto_1

    .line 262
    .line 263
    :cond_8
    :goto_2
    move-object p0, v1

    .line 264
    move-object p1, p0

    .line 265
    goto/16 :goto_1

    .line 266
    .line 267
    :cond_9
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getApplication()Lcom/android/launcher3/logger/LauncherAtom$Application;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Application;->getComponentName()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-static {p0}, Lz1/q;->i(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    if-eqz p0, :cond_3

    .line 280
    .line 281
    new-instance p1, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :goto_3
    if-eqz v2, :cond_b

    .line 303
    .line 304
    if-eqz p0, :cond_b

    .line 305
    .line 306
    if-eqz p1, :cond_a

    .line 307
    .line 308
    new-instance p0, Landroid/app/prediction/AppTarget$Builder;

    .line 309
    .line 310
    new-instance v0, Landroid/app/prediction/AppTargetId;

    .line 311
    .line 312
    invoke-direct {v0, v2}, Landroid/app/prediction/AppTargetId;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-direct {p0, v0, p1}, Landroid/app/prediction/AppTarget$Builder;-><init>(Landroid/app/prediction/AppTargetId;Landroid/content/pm/ShortcutInfo;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget$Builder;->build()Landroid/app/prediction/AppTarget;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    return-object p0

    .line 323
    :cond_a
    new-instance p1, Landroid/app/prediction/AppTarget$Builder;

    .line 324
    .line 325
    new-instance v1, Landroid/app/prediction/AppTargetId;

    .line 326
    .line 327
    invoke-direct {v1, v2}, Landroid/app/prediction/AppTargetId;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    invoke-direct {p1, v1, v2, v0}, Landroid/app/prediction/AppTarget$Builder;-><init>(Landroid/app/prediction/AppTargetId;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    invoke-virtual {p1, p0}, Landroid/app/prediction/AppTarget$Builder;->setClassName(Ljava/lang/String;)Landroid/app/prediction/AppTarget$Builder;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget$Builder;->build()Landroid/app/prediction/AppTarget;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    return-object p0

    .line 350
    :cond_b
    return-object v1
.end method

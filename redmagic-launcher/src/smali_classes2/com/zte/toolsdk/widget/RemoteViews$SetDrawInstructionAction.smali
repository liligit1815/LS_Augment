.class Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetDrawInstructionAction"
.end annotation


# instance fields
.field private final mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 1

    .line 3
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 4
    invoke-static {}, Landroid/appwidget/flags/Flags;->drawDataParcel()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;->a(Landroid/os/Parcel;)Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    return-void
.end method

.method public static synthetic a(ILandroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Lcom/zte/toolsdk/widget/RemoteViews$Action;)V
    .locals 1

    .line 1
    iget v0, p3, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    instance-of p0, p3, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    check-cast p3, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;

    .line 10
    .line 11
    iget-object p0, p3, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->lambda$apply$1(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic lambda$apply$1(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string p4, "onClick"

    .line 6
    .line 7
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    aget-object p3, p5, p3

    .line 15
    .line 16
    check-cast p3, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 p4, 0x1

    .line 23
    aget-object p4, p5, p4

    .line 24
    .line 25
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p4, Lcom/zte/toolsdk/widget/k;

    .line 32
    .line 33
    invoke-direct {p4, p3, p1, p2}, Lcom/zte/toolsdk/widget/k;-><init>(ILandroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string p2, "RemoteViews"

    .line 2
    .line 3
    :try_start_0
    const-string v0, "com.android.internal.widget.remotecompose.player.RemoteComposePlayer"

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Landroid/appwidget/flags/Flags;->drawDataParcel()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;->mInstructions:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_0
    :try_start_1
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, [B

    .line 45
    .line 46
    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 47
    .line 48
    .line 49
    :try_start_2
    const-string v1, "com.android.internal.widget.remotecompose.player.RemoteComposeDocument"

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-class v3, Ljava/io/InputStream;

    .line 56
    .line 57
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "setDocument"

    .line 74
    .line 75
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v4, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    const-string v1, "com.android.internal.widget.remotecompose.player.RemoteComposePlayer$OnClickListener"

    .line 91
    .line 92
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v3, "addClickListener"

    .line 97
    .line 98
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v4, Lcom/zte/toolsdk/widget/l;

    .line 119
    .line 120
    invoke-direct {v4, p0, p1, p3}, Lcom/zte/toolsdk/widget/l;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v3, v1, v4}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 132
    .line 133
    .line 134
    :try_start_3
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :catch_0
    move-exception p0

    .line 139
    goto :goto_2

    .line 140
    :catch_1
    move-exception p0

    .line 141
    goto :goto_1

    .line 142
    :catchall_0
    move-exception p0

    .line 143
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :catchall_1
    move-exception p1

    .line 148
    :try_start_5
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    :goto_0
    throw p0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 152
    :goto_1
    :try_start_6
    const-string p1, "Failed to render draw instructions"

    .line 153
    .line 154
    invoke-static {p2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string p3, "SetDrawInstructionAction error: "

    .line 164
    .line 165
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    :cond_1
    :goto_3
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x23

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/appwidget/flags/Flags;->drawDataParcel()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;->mInstructions:Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;

    .line 8
    .line 9
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;->b(Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;Landroid/os/Parcel;I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

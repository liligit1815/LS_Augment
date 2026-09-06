.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnClickResponse"
.end annotation


# instance fields
.field final mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    invoke-static {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->lambda$apply$0(Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$apply$0(Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 4
    .line 5
    invoke-static {p0, p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 5

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
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/zte/toolsdk/widget/RemoteViews;->E(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_1
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const v2, 0x1020470

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x2

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v3, "Cannot SetOnClickResponse for collection item (id: "

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v3, ")"

    .line 74
    .line 75
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {p2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 96
    .line 97
    const/16 v1, 0x10

    .line 98
    .line 99
    if-lt p1, v1, :cond_2

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_2
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {v0, v2, p1}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 113
    .line 114
    invoke-static {v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const v4, 0x1020312

    .line 119
    .line 120
    .line 121
    if-eqz v1, :cond_6

    .line 122
    .line 123
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 124
    .line 125
    invoke-virtual {v1, v3}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_4

    .line 130
    .line 131
    const-string p0, "The method setOnClickFillInIntent is available only from RemoteViewsFactory (ie. on collection items)."

    .line 132
    .line 133
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_4
    if-ne v0, p1, :cond_5

    .line 138
    .line 139
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 140
    .line 141
    invoke-virtual {v0, v4, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_5
    :goto_0
    new-instance p1, Lcom/zte/toolsdk/widget/n;

    .line 146
    .line 147
    invoke-direct {p1, p0, p3}, Lcom/zte/toolsdk/widget/n;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_6
    const/4 p0, 0x0

    .line 155
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v4, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    const-string p3, "SetOnClickResponse apply error: "

    .line 171
    .line 172
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    :goto_2
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

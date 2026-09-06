.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnLongClickResponse"
.end annotation


# instance fields
.field mLongPressItems:[Ljava/lang/String;

.field final mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;[Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 4
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mLongPressItems:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 0

    .line 5
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 6
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 7
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 8
    invoke-static {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V

    .line 9
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mLongPressItems:[Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/view/View;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->lambda$apply$0(Landroid/view/View;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic lambda$apply$0(Landroid/view/View;Landroid/view/View;)Z
    .locals 7

    .line 1
    new-instance v5, Lcom/zte/mifavor/widget/w;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {v5, v0}, Lcom/zte/mifavor/widget/w;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v6, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;

    .line 15
    .line 16
    invoke-direct {v6, p0, v5, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$1;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Lcom/zte/mifavor/widget/w;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;

    .line 28
    .line 29
    new-instance v2, Landroid/os/Handler;

    .line 30
    .line 31
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 36
    .line 37
    .line 38
    move-object v1, p0

    .line 39
    move-object v4, p1

    .line 40
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$2;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/os/Handler;Landroid/content/ContentResolver;Landroid/view/View;Lcom/zte/mifavor/widget/w;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Lcom/zte/toolsdk/common/SharedPrefs;->getContentUri(Landroid/content/Context;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {v3, p0, p1, v0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, v1, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mLongPressItems:[Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v5, p0, v6}, Lcom/zte/mifavor/widget/w;->a([Ljava/lang/CharSequence;Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {v5, p2, p0}, Lcom/zte/mifavor/widget/w;->b(Landroid/view/View;Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;

    .line 70
    .line 71
    invoke-direct {p0, v1, v3, v0}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 75
    .line 76
    .line 77
    return p1
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->E(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    instance-of p2, p1, Lcom/android/internal/widget/remotecompose/player/RemoteComposePlayer;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 24
    .line 25
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    const v0, 0x1020470

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    const-string v2, "RemoteViews"

    .line 34
    .line 35
    if-eqz p3, :cond_3

    .line 36
    .line 37
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 38
    .line 39
    invoke-virtual {p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    new-instance p3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "Cannot SetOnClickResponse for collection item (id: "

    .line 51
    .line 52
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 56
    .line 57
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, ")"

    .line 61
    .line 62
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-static {v2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 83
    .line 84
    const/16 p3, 0x10

    .line 85
    .line 86
    if-lt p1, p3, :cond_2

    .line 87
    .line 88
    :goto_0
    return-void

    .line 89
    :cond_2
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 90
    .line 91
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p2, v0, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 100
    .line 101
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    if-eqz p3, :cond_5

    .line 106
    .line 107
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 108
    .line 109
    invoke-virtual {p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    if-nez p3, :cond_4

    .line 114
    .line 115
    const-string p0, "The method setOnClickFillInIntent is available only from RemoteViewsFactory (ie. on collection items)."

    .line 116
    .line 117
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    new-instance p3, Lcom/zte/toolsdk/widget/q;

    .line 122
    .line 123
    invoke-direct {p3, p0, p1}, Lcom/zte/toolsdk/widget/q;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/view/View;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_5
    const-string p0, "SetOnLongClickResponse apply6"

    .line 131
    .line 132
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    const/4 p0, 0x0

    .line 136
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2, v0, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    const p1, 0x1020312

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2, p1, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x28

    .line 2
    .line 3
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
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->mLongPressItems:[Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

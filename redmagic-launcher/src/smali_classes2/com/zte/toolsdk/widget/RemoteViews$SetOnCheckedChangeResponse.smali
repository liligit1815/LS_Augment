.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnCheckedChangeResponse"
.end annotation


# instance fields
.field private final mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    invoke-static {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->lambda$apply$0(Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/widget/CompoundButton;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$apply$0(Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

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
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    instance-of p2, p1, Landroid/widget/CompoundButton;

    .line 11
    .line 12
    const-string v0, ")"

    .line 13
    .line 14
    const-string v1, "RemoteViews"

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string p2, "setOnCheckedChange methods cannot be used on non-CompoundButton child (id: "

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    move-object p2, p1

    .line 45
    check-cast p2, Landroid/widget/CompoundButton;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const v3, 0x10204ba

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x2

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 60
    .line 61
    invoke-virtual {v2, v4}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    new-instance p1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string p2, "Cannot setOnCheckedChangePendingIntent for collection item (id: "

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const v1, 0x1020470

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 107
    .line 108
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    if-eqz p1, :cond_5

    .line 113
    .line 114
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 115
    .line 116
    invoke-virtual {p1, v4}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_4

    .line 121
    .line 122
    const-string p0, "The method setOnCheckedChangeFillInIntent is available only from RemoteViewsFactory (ie. on collection items)."

    .line 123
    .line 124
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    :goto_0
    new-instance p1, Lcom/zte/toolsdk/widget/m;

    .line 129
    .line 130
    invoke-direct {p1, p0, p3}, Lcom/zte/toolsdk/widget/m;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2, v3, p1}, Landroid/widget/CompoundButton;->setTagInternal(ILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_5
    const/4 p0, 0x0

    .line 141
    invoke-virtual {p2, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2, v3, p0}, Landroid/widget/CompoundButton;->setTagInternal(ILjava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x1d

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
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

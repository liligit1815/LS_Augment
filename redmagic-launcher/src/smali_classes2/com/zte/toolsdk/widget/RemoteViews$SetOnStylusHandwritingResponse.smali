.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnStylusHandwritingResponse"
.end annotation


# instance fields
.field final mPendingIntent:Landroid/app/PendingIntent;

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    invoke-static {p2}, Landroid/app/PendingIntent;->readPendingIntentOrNullFromParcel(Landroid/os/Parcel;)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 1

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
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string p2, "Cannot use setOnStylusHandwritingPendingIntent for collection item (id: "

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, ")"

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "RemoteViews"

    .line 44
    .line 45
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 50
    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    new-instance v0, Lcom/zte/toolsdk/widget/r;

    .line 58
    .line 59
    invoke-direct {v0, p2, p1, p3}, Lcom/zte/toolsdk/widget/r;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->setHandwritingDelegatorCallback(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/app/PendingIntent;->getCreatorPackage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Landroid/view/View;->setAllowedHandwritingDelegatePackage(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    invoke-virtual {p1, p0}, Landroid/view/View;->setHandwritingDelegatorCallback(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p0}, Landroid/view/View;->setAllowedHandwritingDelegatePackage(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x22

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;->mPendingIntent:Landroid/app/PendingIntent;

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/app/PendingIntent;->writePendingIntentOrNullToParcel(Landroid/app/PendingIntent;Landroid/os/Parcel;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

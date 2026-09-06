.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnSeekBarChangeResponse"
.end annotation


# instance fields
.field final mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 0

    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    invoke-static {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V

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
    move-result-object p2

    .line 7
    instance-of p3, p2, Landroid/widget/SeekBar;

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    check-cast p2, Landroid/widget/SeekBar;

    .line 13
    .line 14
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 15
    .line 16
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    const v0, 0x1020470

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 26
    .line 27
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p2, v0, p3}, Landroid/widget/SeekBar;->setTagInternal(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    new-instance p3, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse$1;

    .line 35
    .line 36
    invoke-direct {p3, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse$1;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    invoke-virtual {p2, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, v0, p0}, Landroid/widget/SeekBar;->setTagInternal(ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x24

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
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

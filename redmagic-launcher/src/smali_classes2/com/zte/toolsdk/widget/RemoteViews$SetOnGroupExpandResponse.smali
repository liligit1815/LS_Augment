.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetOnGroupExpandResponse"
.end annotation


# instance fields
.field private final mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

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

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    invoke-static {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->d(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;)V

    return-void
.end method

.method public static synthetic a(Landroid/widget/ExpandableListView;Landroid/view/View;I)V
    .locals 2

    .line 1
    const v0, 0x1020470

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/ExpandableListView;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/app/PendingIntent;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/content/Intent;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "android.widget.extra.GROUP_EXPAND"

    .line 18
    .line 19
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-virtual {p0, p1, p2, v0}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    const-string p0, "RemoteViews"

    .line 32
    .line 33
    const-string p1, "OnGroupExpandListener send pending intent error"

    .line 34
    .line 35
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_0
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
    if-nez p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    instance-of p3, p2, Landroid/widget/ExpandableListView;

    .line 11
    .line 12
    if-nez p3, :cond_1

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string p2, "SetOnGroupExpandResponse methods cannot be used on non-ExpandableListView child (id: "

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, ")"

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "RemoteViews"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    check-cast p2, Landroid/widget/ExpandableListView;

    .line 45
    .line 46
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 47
    .line 48
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    const v0, 0x1020470

    .line 53
    .line 54
    .line 55
    if-eqz p3, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Landroid/app/PendingIntent;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p2, v0, p0}, Landroid/widget/ExpandableListView;->setTagInternal(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Lcom/zte/toolsdk/widget/p;

    .line 67
    .line 68
    invoke-direct {p0, p2, p1}, Lcom/zte/toolsdk/widget/p;-><init>(Landroid/widget/ExpandableListView;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, p0}, Landroid/widget/ExpandableListView;->setOnGroupExpandListener(Landroid/widget/ExpandableListView$OnGroupExpandListener;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    invoke-virtual {p2, p0}, Landroid/widget/ExpandableListView;->setOnGroupExpandListener(Landroid/widget/ExpandableListView$OnGroupExpandListener;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v0, p0}, Landroid/widget/ExpandableListView;->setTagInternal(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x26

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
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;->mResponse:Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

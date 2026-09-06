.class public Lcom/zte/toolsdk/producer/RemoteViewsHelper;
.super Ljava/lang/Object;
.source "RemoteViewsHelper.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIntent:Landroid/content/Intent;

.field private mLayoutId:I

.field private final mRemoteViews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    const-class v1, Lcom/zte/toolsdk/producer/RemoteViewsReceiver;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public getRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    return-object p0
.end method

.method public loopLottieAnimation(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->loopLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public pauseLottieAnimation(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->pauseLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public playLottieAnimation(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->playLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setAdapter(ILcom/zte/toolsdk/producer/ItemAdapter;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lcom/zte/toolsdk/producer/ItemAdapter<",
            "TT;>;",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    invoke-static {v0, p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setAdapter(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/producer/ItemAdapter;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setBoolean(ILjava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setBoolean(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setByte(ILjava/lang/String;B)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setByte(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;B)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setCardId(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "cardId"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setChar(ILjava/lang/String;C)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setChar(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;C)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setCharSequence(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setChronometer(IJLjava/lang/String;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move-object v0, p0

    .line 14
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 15
    .line 16
    move v1, p1

    .line 17
    move-wide v2, p2

    .line 18
    move-object v4, p4

    .line 19
    move v5, p5

    .line 20
    invoke-static/range {v0 .. v5}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setChronometer(Lcom/zte/toolsdk/widget/RemoteViews;IJLjava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setChronometerCountDown(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setChronometerCountDown(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setDouble(ILjava/lang/String;D)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setDouble(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;D)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setExpandableListAdapter(ILcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(I",
            "Lcom/zte/toolsdk/producer/ExpandableItemAdapter<",
            "TT;TU;>;",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TU;>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    move-object v1, p0

    .line 16
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 17
    .line 18
    move v2, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v4, p3

    .line 21
    move-object v5, p4

    .line 22
    invoke-static/range {v0 .. v5}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setExpandableListAdapter(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setFloat(ILjava/lang/String;F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setFloat(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setImageViewBitmap(ILandroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setImageViewBitmap(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setImageViewResource(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setImageViewResource(Lcom/zte/toolsdk/widget/RemoteViews;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setInt(ILjava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setInt(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setLayoutId(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 2
    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p1}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setLong(ILjava/lang/String;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setLong(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setLottieAnimation(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnCheckedChangeListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnCheckedChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnClickListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnClickListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnExpandableListViewClickListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setPendingIntentTemplate(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnGridViewClickListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setPendingIntentTemplate(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnGroupCollapseListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnGroupCollapseListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnGroupExpandListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnGroupExpandListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnListViewClickListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setPendingIntentTemplate(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOnSeekBarChangeListener(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {v0, v1, p0, p1}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnSeekBarChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setProgress(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setProgress(Lcom/zte/toolsdk/widget/RemoteViews;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setRadioButtonState(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setRadioButtonState(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setRemotePackageName(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setRemotePackageName(Ljava/lang/String;Z)V

    return-void
.end method

.method public setRemotePackageName(Ljava/lang/String;Z)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    const-string v1, "packageName"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mIntent:Landroid/content/Intent;

    const-string p1, "pushCard"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-void
.end method

.method public setShort(ILjava/lang/String;S)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setShort(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;S)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setString(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setString(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setSwitchState(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setSwitchState(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTextColor(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setTextColor(Lcom/zte/toolsdk/widget/RemoteViews;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTextViewText(ILjava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setTextViewText(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setViewLayoutHeight(IFI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setViewLayoutHeight(Lcom/zte/toolsdk/widget/RemoteViews;IFI)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setViewLayoutMargin(IIFI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setViewLayoutMargin(Lcom/zte/toolsdk/widget/RemoteViews;IIFI)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setViewLayoutWidth(IFI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setViewLayoutWidth(Lcom/zte/toolsdk/widget/RemoteViews;IFI)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setViewPadding(IIIII)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move-object v0, p0

    .line 14
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 15
    .line 16
    move v1, p1

    .line 17
    move v2, p2

    .line 18
    move v3, p3

    .line 19
    move v4, p4

    .line 20
    move v5, p5

    .line 21
    invoke-static/range {v0 .. v5}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setViewPadding(Lcom/zte/toolsdk/widget/RemoteViews;IIIII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setViewVisibility(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setViewVisibility(Lcom/zte/toolsdk/widget/RemoteViews;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setVoid(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mRemoteViews:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->mLayoutId:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setVoid(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

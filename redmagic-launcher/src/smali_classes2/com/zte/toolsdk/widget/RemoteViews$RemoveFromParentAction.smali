.class Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoveFromParentAction"
.end annotation


# direct methods
.method constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 4
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    instance-of p2, p1, Landroid/view/ViewManager;

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    check-cast p1, Landroid/view/ViewManager;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x17

    .line 2
    .line 3
    return p0
.end method

.method public initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->createTree()V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeById(I)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-eqz p2, :cond_3

    .line 11
    .line 12
    if-ne p2, p1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewTreeParentOf(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    instance-of p3, p3, Landroid/view/ViewManager;

    .line 26
    .line 27
    if-nez p3, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    check-cast p3, Landroid/view/ViewManager;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->a(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;

    .line 44
    .line 45
    invoke-direct {p1, p0, p3, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;Landroid/view/ViewManager;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V

    .line 46
    .line 47
    .line 48
    return-object p1

    .line 49
    :cond_2
    :goto_0
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_3
    :goto_1
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public mergeBehavior()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;
.super Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$nextChild:I

.field final synthetic val$reapplyTask:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

.field final synthetic val$recycledViewIndex:I

.field final synthetic val$targetVg:Landroid/view/ViewGroup;

.field final synthetic val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;IILandroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$reapplyTask:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$recycledViewIndex:I

    .line 6
    .line 7
    iput p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$nextChild:I

    .line 8
    .line 9
    iput-object p6, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$reapplyTask:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->onPostExecute(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V

    .line 6
    .line 7
    .line 8
    iget p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$recycledViewIndex:I

    .line 9
    .line 10
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$nextChild:I

    .line 11
    .line 12
    if-le p1, p2, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 15
    .line 16
    sub-int/2addr p1, p2

    .line 17
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

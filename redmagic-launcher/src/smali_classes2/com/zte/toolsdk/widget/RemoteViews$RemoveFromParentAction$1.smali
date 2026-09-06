.class Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;
.super Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;->initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$parentVg:Landroid/view/ViewManager;

.field final synthetic val$target:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;Landroid/view/ViewManager;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;->val$parentVg:Landroid/view/ViewManager;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;->val$target:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;->val$parentVg:Landroid/view/ViewManager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction$1;->val$target:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->b(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1, p0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

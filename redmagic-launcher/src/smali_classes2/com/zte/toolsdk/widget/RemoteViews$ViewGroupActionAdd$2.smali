.class Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;
.super Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->insertNewView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Ljava/lang/Runnable;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$finalizeAction:Ljava/lang/Runnable;

.field final synthetic val$insertIndex:I

.field final synthetic val$targetVg:Landroid/view/ViewGroup;

.field final synthetic val$task:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

.field final synthetic val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Ljava/lang/Runnable;Landroid/view/ViewGroup;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$task:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$finalizeAction:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$targetVg:Landroid/view/ViewGroup;

    .line 8
    .line 9
    iput p6, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$insertIndex:I

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

    .line 1
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$task:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$tree:Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->onPostExecute(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$finalizeAction:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$targetVg:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$task:Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->b(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd$2;->val$insertIndex:I

    .line 22
    .line 23
    invoke-virtual {p1, p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

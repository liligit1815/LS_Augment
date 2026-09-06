.class Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;
.super Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

.field final synthetic val$targetVg:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->this$0:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->val$targetVg:Landroid/view/ViewGroup;

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
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->this$0:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->c(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, -0x2

    .line 8
    if-ne p1, p2, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    :goto_0
    if-ltz p1, :cond_1

    .line 19
    .line 20
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->T(Landroid/view/View;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void

    .line 41
    :cond_2
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->this$0:Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove$1;->val$targetVg:Landroid/view/ViewGroup;

    .line 44
    .line 45
    invoke-static {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;Landroid/view/ViewGroup;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

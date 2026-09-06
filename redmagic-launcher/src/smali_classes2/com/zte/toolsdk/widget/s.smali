.class public final synthetic Lcom/zte/toolsdk/widget/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# instance fields
.field public final synthetic a:Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;

.field public final synthetic b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;


# direct methods
.method public synthetic constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/s;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/s;->b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/s;->a:Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/s;->b:Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 4
    .line 5
    move-object v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move v4, p3

    .line 8
    move v5, p4

    .line 9
    move-wide v6, p5

    .line 10
    invoke-static/range {v0 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;->b(Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

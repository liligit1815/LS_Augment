.class public final synthetic Lcom/zte/toolsdk/widget/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/widget/ExpandableListView$OnGroupCollapseListener;


# instance fields
.field public final synthetic a:Landroid/widget/ExpandableListView;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ExpandableListView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/o;->a:Landroid/widget/ExpandableListView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/o;->b:Landroid/view/View;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onGroupCollapse(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/o;->a:Landroid/widget/ExpandableListView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/o;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;->a(Landroid/widget/ExpandableListView;Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

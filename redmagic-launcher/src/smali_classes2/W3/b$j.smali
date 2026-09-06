.class public LW3/b$j;
.super Landroid/content/BroadcastReceiver;
.source "BaseSinkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LW3/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "j"
.end annotation


# instance fields
.field final synthetic a:LW3/b;


# direct methods
.method public constructor <init>(LW3/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3/b$j;->a:LW3/b;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p1, p0, LW3/b$j;->a:LW3/b;

    .line 2
    .line 3
    invoke-static {p1}, LW3/b;->E(LW3/b;)Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, LW3/b$j;->a:LW3/b;

    .line 10
    .line 11
    invoke-static {p1}, LW3/b;->E(LW3/b;)Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 p2, -0x1

    .line 16
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, LW3/b$j;->a:LW3/b;

    .line 23
    .line 24
    invoke-static {p0}, LW3/b;->E(LW3/b;)Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

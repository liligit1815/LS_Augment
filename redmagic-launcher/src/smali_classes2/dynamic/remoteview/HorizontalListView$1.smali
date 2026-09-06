.class Ldynamic/remoteview/HorizontalListView$1;
.super Landroid/database/DataSetObserver;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ldynamic/remoteview/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ldynamic/remoteview/HorizontalListView;


# direct methods
.method constructor <init>(Ldynamic/remoteview/HorizontalListView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 2

    .line 1
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ldynamic/remoteview/HorizontalListView;->d(Ldynamic/remoteview/HorizontalListView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ldynamic/remoteview/HorizontalListView;->e(Ldynamic/remoteview/HorizontalListView;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 14
    .line 15
    invoke-static {v0}, Ldynamic/remoteview/HorizontalListView;->j(Ldynamic/remoteview/HorizontalListView;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/AdapterView;->invalidate()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/AdapterView;->requestLayout()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onInvalidated()V
    .locals 2

    .line 1
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ldynamic/remoteview/HorizontalListView;->e(Ldynamic/remoteview/HorizontalListView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 8
    .line 9
    invoke-static {v0}, Ldynamic/remoteview/HorizontalListView;->j(Ldynamic/remoteview/HorizontalListView;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 13
    .line 14
    invoke-static {v0}, Ldynamic/remoteview/HorizontalListView;->h(Ldynamic/remoteview/HorizontalListView;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/AdapterView;->invalidate()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ldynamic/remoteview/HorizontalListView$1;->this$0:Ldynamic/remoteview/HorizontalListView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/AdapterView;->requestLayout()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.class public Lcom/android/launcher3/cloudfolder/c$b;
.super Lcom/android/launcher3/cloudfolder/RemoteView$j;
.source "NubiaRemoteView.java"

# interfaces
.implements Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic i:Lcom/android/launcher3/cloudfolder/c;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/cloudfolder/c;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$j;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private c(ILjava/lang/String;IIJ)V
    .locals 6

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "event_type"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "event_extra_view_id"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    const-string p3, "event_extra_item_index"

    .line 17
    .line 18
    invoke-virtual {v0, p3, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const-string p3, "event_extra_item_id"

    .line 22
    .line 23
    invoke-virtual {v0, p3, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 27
    .line 28
    iget-object p3, p3, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 29
    .line 30
    invoke-interface {p3}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->e()Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 39
    .line 40
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->b(ILandroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 45
    .line 46
    iget-object p3, p3, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    const-string p3, "SClicked"

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    if-nez p3, :cond_1

    .line 66
    .line 67
    const-string p3, "LClicked"

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 77
    .line 78
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 79
    .line 80
    iget-object p4, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 81
    .line 82
    const-string p5, "BadIPC"

    .line 83
    .line 84
    invoke-virtual {p2, p3, p4, p5}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$b;->i:Lcom/android/launcher3/cloudfolder/c;

    .line 88
    .line 89
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 90
    .line 91
    iget-object v2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 92
    .line 93
    const/4 v4, 0x0

    .line 94
    const/4 v5, 0x1

    .line 95
    const-string v3, "BadIPC"

    .line 96
    .line 97
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onLongClick(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    return-void
.end method

.method public onScrollStateChanged(Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener$ScrollState;)V
    .locals 8

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onScrollStateChanged-newState:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RemoteView"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    sget-object v0, Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener$ScrollState;

    if-ne p1, v0, :cond_0

    .line 4
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-string v3, "Scroll"

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/cloudfolder/c$b;->c(ILjava/lang/String;IIJ)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

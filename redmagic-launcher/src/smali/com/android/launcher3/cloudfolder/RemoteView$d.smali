.class Lcom/android/launcher3/cloudfolder/RemoteView$d;
.super Landroid/widget/FrameLayout;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field private g:I

.field final synthetic h:Lcom/android/launcher3/cloudfolder/RemoteView;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/content/Context;I)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 3
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    iput p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->g:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/content/Context;ILd1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$d;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 10

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-interface {v0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->d(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 15
    .line 16
    iget v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->g:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v1, v2, p0, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v4, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 35
    .line 36
    iget-object v5, v0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v9, 0x1

    .line 40
    const/4 v7, 0x0

    .line 41
    move-object v6, p0

    .line 42
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->d(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 17
    .line 18
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->g:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 29
    .line 30
    iget-object v3, v0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 31
    .line 32
    invoke-static {v2, v3, p0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView;->e(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$d;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 36
    .line 37
    invoke-static {p0, v0}, Lcom/android/launcher3/cloudfolder/RemoteView;->g(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$b;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

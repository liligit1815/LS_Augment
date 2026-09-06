.class public Lcom/android/launcher3/cloudfolder/b;
.super Lcom/android/launcher3/cloudfolder/RemoteView;
.source "MyOSRemoteView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/cloudfolder/b$a;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/cloudfolder/b$a;

    .line 5
    .line 6
    new-instance v2, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {v2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 13
    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    move-object v1, p0

    .line 17
    move-object v3, p2

    .line 18
    move v4, p3

    .line 19
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/cloudfolder/b$a;-><init>(Lcom/android/launcher3/cloudfolder/b;Landroid/os/Handler;Ljava/lang/String;ILd1/e;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, v1, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method protected K()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->d:Landroid/view/View;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 7
    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lez v1, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    if-ge v2, v1, :cond_1

    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 42
    .line 43
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 44
    .line 45
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 48
    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-interface {v3, v4}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->a(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 60
    .line 61
    .line 62
    :cond_2
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 67
    .line 68
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/b$a;

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    check-cast v1, Lcom/android/launcher3/cloudfolder/b$a;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/android/launcher3/cloudfolder/b$a;->l()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 78
    .line 79
    :cond_3
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->j:Landroid/view/View;

    .line 80
    .line 81
    return-void
.end method

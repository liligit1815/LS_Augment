.class public Lcom/android/launcher3/taskbar/j3;
.super Ljava/lang/Object;
.source "TaskbarModelCallbacks.java"

# interfaces
.implements Lz1/y0$b;
.implements Lcom/android/launcher3/util/Y0;


# instance fields
.field private final g:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lcom/android/launcher3/taskbar/I1;

.field private final j:Lcom/android/launcher3/taskbar/TaskbarView;

.field protected k:Lcom/android/launcher3/taskbar/R1;

.field private l:Z

.field private m:Ljava/lang/Runnable;

.field private n:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 10
    .line 11
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j3;->n:Z

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j3;->i:Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/launcher3/taskbar/j3;->j:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 21
    .line 22
    return-void
.end method

.method private F()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j3;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->i:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Lcom/android/launcher3/h0;->a2:I

    .line 13
    .line 14
    new-array v1, v0, [Lcom/android/launcher3/model/data/y;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    move v4, v3

    .line 24
    :goto_0
    if-ge v3, v0, :cond_2

    .line 25
    .line 26
    iget-object v5, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    aput-object v5, v1, v3

    .line 35
    .line 36
    if-nez v5, :cond_1

    .line 37
    .line 38
    if-ge v4, v2, :cond_1

    .line 39
    .line 40
    iget-object v5, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    aput-object v5, v1, v3

    .line 49
    .line 50
    iput v3, v5, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 51
    .line 52
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/F3;->B([Lcom/android/launcher3/model/data/y;)[Lcom/android/launcher3/model/data/y;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/j3;->l:Z

    .line 66
    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    new-instance v2, Lcom/android/launcher3/taskbar/i3;

    .line 70
    .line 71
    invoke-direct {v2, p0, v1, v0}, Lcom/android/launcher3/taskbar/i3;-><init>(Lcom/android/launcher3/taskbar/j3;[Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/taskbar/F3;)V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Lcom/android/launcher3/taskbar/j3;->m:Ljava/lang/Runnable;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/F3;->s()Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/j3;->v([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private R(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 17
    .line 18
    iget v2, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 19
    .line 20
    const/16 v3, -0x65

    .line 21
    .line 22
    if-ne v2, v3, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 25
    .line 26
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 27
    .line 28
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return v0
.end method

.method private T(Ljava/util/function/Predicate;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    sub-int/2addr v0, v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ltz v0, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    invoke-interface {p1, v3}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 29
    .line 30
    .line 31
    move v2, v1

    .line 32
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v2
.end method

.method private synthetic W([Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/taskbar/F3;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/F3;->s()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/j3;->v([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/taskbar/j3;[Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/taskbar/F3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/j3;->W([Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/taskbar/F3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->j:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->x([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/W4;->y0()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/z3;->A(Landroid/util/SparseArray;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public B(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/P0;->s(Ljava/util/Collection;)Ljava/util/function/Predicate;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/j3;->T(Ljava/util/function/Predicate;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j3;->R(Ljava/util/List;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public E(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->i:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/util/Y0;->m(Ljava/util/Set;Lcom/android/launcher3/views/k;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Ljava/util/function/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j3;->T(Ljava/util/function/Predicate;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public K(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/z3;->z(Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j3;->R(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j3;->n:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method protected Q(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarModelCallbacks:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->g:Landroid/util/SparseArray;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "%s\thotseat items count=%s"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "%s\tpredicted items count=%s"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j3;->l:Z

    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "%s\tmDeferUpdatesForSUW=%b"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j3;->m:Ljava/lang/Runnable;

    .line 89
    .line 90
    if-eqz p0, :cond_1

    .line 91
    .line 92
    const/4 p0, 0x1

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    const/4 p0, 0x0

    .line 95
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string p1, "%s\tupdates pending=%b"

    .line 104
    .line 105
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public U(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public a(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/A;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public a0(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j3;->l:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j3;->m:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->j:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j3;->m:Ljava/lang/Runnable;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public c(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->j:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j3;->j:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    instance-of v4, v3, Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    invoke-interface {p1, v3, v2}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    return-object v2

    .line 33
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public h(Lcom/android/launcher3/util/z0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j3;->n:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/d;",
            "I",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/taskbar/allapps/c;->j([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/z3;->y([Lcom/android/launcher3/model/data/d;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/x0;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/j3;->R(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/j3;->R(Ljava/util/List;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public t(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public z(Lz1/y0$c;)V
    .locals 2

    .line 1
    iget v0, p1, Lz1/y0$c;->a:I

    .line 2
    .line 3
    const/16 v1, -0x67

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j3;->h:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j3;->F()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/16 v1, -0x66

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j3;->k:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 22
    .line 23
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/allapps/c;->m(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

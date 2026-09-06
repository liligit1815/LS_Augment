.class public Lcom/android/launcher3/taskbar/z3;
.super Ljava/lang/Object;
.source "TaskbarPopupController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/z3$a;,
        Lcom/android/launcher3/taskbar/z3$b;
    }
.end annotation


# static fields
.field private static final n:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation
.end field

.field private static final o:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Lcom/android/launcher3/popup/n;

.field private i:Lcom/android/launcher3/taskbar/R1;

.field private j:Z

.field private k:[Lcom/android/launcher3/model/data/d;

.field private l:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lcom/android/launcher3/taskbar/b0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/taskbar/b0<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/r3;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/r3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/taskbar/z3;->n:Lcom/android/launcher3/popup/P$i;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/taskbar/s3;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/s3;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/taskbar/z3;->o:Lcom/android/launcher3/popup/P$i;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/taskbar/z3;->k:[Lcom/android/launcher3/model/data/d;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/popup/n;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/android/launcher3/popup/n;-><init>(Lcom/android/launcher3/views/k;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 16
    .line 17
    return-void
.end method

.method private B(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/z3;->n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->M()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 18
    .line 19
    const/16 p1, -0x68

    .line 20
    .line 21
    if-eq p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/z3;->t(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/z3;->u(Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/popup/P$i;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Lcom/android/launcher3/popup/P$i;->a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/b;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/taskbar/v3;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/v3;-><init>(Lcom/android/launcher3/taskbar/b;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/b;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/b;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/z3;->s(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/z3;)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method private l(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/popup/P;
    .locals 10

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->isPredictedItem()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 10
    .line 11
    const/16 v2, -0x65

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    new-instance v3, Lcom/android/launcher3/taskbar/P0;

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    iget-object v8, p0, Lcom/android/launcher3/taskbar/z3;->l:Landroid/util/SparseArray;

    .line 19
    .line 20
    move-object v4, p1

    .line 21
    move-object v5, p2

    .line 22
    move-object v6, p3

    .line 23
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/taskbar/P0;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;ZLandroid/util/SparseArray;)V

    .line 24
    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_1
    move-object v4, p1

    .line 28
    move-object v5, p2

    .line 29
    move-object v6, p3

    .line 30
    iget-object p1, p0, Lcom/android/launcher3/taskbar/z3;->l:Landroid/util/SparseArray;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object p2, p0, Lcom/android/launcher3/taskbar/z3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->G0()LY1/l;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2}, LY1/l;->b()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-ge p1, p2, :cond_2

    .line 47
    .line 48
    move-object v7, v6

    .line 49
    move-object v6, v5

    .line 50
    move-object v5, v4

    .line 51
    new-instance v4, Lcom/android/launcher3/taskbar/P0;

    .line 52
    .line 53
    const/4 v8, 0x1

    .line 54
    iget-object v9, p0, Lcom/android/launcher3/taskbar/z3;->l:Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/taskbar/P0;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;ZLandroid/util/SparseArray;)V

    .line 57
    .line 58
    .line 59
    return-object v4

    .line 60
    :cond_2
    return-object v1
.end method

.method private q()Ljava/util/stream/Stream;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/stream/Stream<",
            "Lcom/android/launcher3/popup/P$i;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/taskbar/z3;->n:Lcom/android/launcher3/popup/P$i;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/taskbar/z3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/o4;->m()Ljava/util/stream/Stream;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-static {}, LN2/g;->c()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    sget-object v1, Lcom/android/launcher3/taskbar/z3;->o:Lcom/android/launcher3/popup/P$i;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->I()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/taskbar/z3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 60
    .line 61
    invoke-static {v1}, LO2/d;->c(Landroid/content/Context;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/a4;->d0()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->v()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->o()Ljava/util/stream/Stream;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method

.method private synthetic s(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 2

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/z3;->B(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/taskbar/b0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    invoke-direct {v0, p1, p2, p3, v1}, Lcom/android/launcher3/taskbar/b0;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/taskbar/R1;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/z3;->m:Lcom/android/launcher3/taskbar/b0;

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method private synthetic t(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/z3;->B(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/launcher3/taskbar/O0;

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/O0;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method private synthetic u(Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/z3$b;

    .line 2
    .line 3
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/z3;->j:Z

    .line 4
    .line 5
    move-object v4, p1

    .line 6
    move-object v1, p2

    .line 7
    move-object v2, p3

    .line 8
    move-object v3, p4

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/z3$b;-><init>(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;Z)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public A(Landroid/util/SparseArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3;->l:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-void
.end method

.method public C(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/popup/PopupContainerWithArrow;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/BubbleTextView;",
            ")",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/widget/TextView;->clearFocus()V

    .line 19
    .line 20
    .line 21
    return-object v2

    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    instance-of v3, v1, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    instance-of v3, v1, Lcom/android/quickstep/util/SingleTask;

    .line 44
    .line 45
    if-eqz v3, :cond_3

    .line 46
    .line 47
    check-cast v1, Lcom/android/quickstep/util/SingleTask;

    .line 48
    .line 49
    sget-object v2, Lcom/android/quickstep/util/SingleTask;->Companion:Lcom/android/quickstep/util/SingleTask$Companion;

    .line 50
    .line 51
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/SingleTask$Companion;->createTaskItemInfo(Lcom/android/quickstep/util/SingleTask;)Lcom/android/launcher3/model/data/D;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Lcom/android/launcher3/popup/n;->j(Lcom/android/launcher3/model/data/y;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/z3;->q()Ljava/util/stream/Stream;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    new-instance v4, Lcom/android/launcher3/taskbar/t3;

    .line 66
    .line 67
    invoke-direct {v4, v0, v1, p1}, Lcom/android/launcher3/taskbar/t3;-><init>(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    new-instance v4, Lcom/android/launcher3/popup/g;

    .line 75
    .line 76
    invoke-direct {v4}, Lcom/android/launcher3/popup/g;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Ljava/util/List;

    .line 92
    .line 93
    invoke-static {}, Lcom/android/launcher3/y0;->N()Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    const/4 v5, 0x0

    .line 98
    if-eqz v4, :cond_2

    .line 99
    .line 100
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/z3;->l(Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/popup/P;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    if-eqz v4, :cond_2

    .line 105
    .line 106
    invoke-interface {v3, v5, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    const v6, 0x7f0e0194

    .line 114
    .line 115
    .line 116
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    invoke-virtual {v4, v6, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    check-cast v4, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 125
    .line 126
    invoke-virtual {v4, p1, v1, v2, v3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->j0(Landroid/view/View;Lcom/android/launcher3/model/data/y;ILjava/util/List;)V

    .line 127
    .line 128
    .line 129
    new-instance p1, Lcom/android/launcher3/taskbar/z3$a;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/z3$a;-><init>(Lcom/android/launcher3/taskbar/z3;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->setPopupItemDragHandler(Lcom/android/launcher3/popup/PopupContainerWithArrow$f;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 140
    .line 141
    invoke-virtual {p0, v4}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 145
    .line 146
    .line 147
    const/4 p0, 0x1

    .line 148
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/b;->i(Z)V

    .line 149
    .line 150
    .line 151
    new-instance p0, Lcom/android/launcher3/taskbar/u3;

    .line 152
    .line 153
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/u3;-><init>(Lcom/android/launcher3/taskbar/b;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4, p0}, Lcom/android/launcher3/popup/c;->addOnCloseCallback(Ljava/lang/Runnable;)V

    .line 157
    .line 158
    .line 159
    return-object v4

    .line 160
    :cond_3
    return-object v2
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
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
    const-string v1, "TaskbarPopupController:"

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, "\t"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/popup/n;->g(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/z3;->m:Lcom/android/launcher3/taskbar/b0;

    .line 3
    .line 4
    return-void
.end method

.method public j()Lcom/android/launcher3/popup/P$i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/w3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/w3;-><init>(Lcom/android/launcher3/taskbar/z3;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method k()Lcom/android/launcher3/popup/P$i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/x3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/x3;-><init>(Lcom/android/launcher3/taskbar/z3;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method m(Lcom/android/launcher3/util/y2$b;)Lcom/android/launcher3/popup/P$i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/y2$b;",
            ")",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/y3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/y3;-><init>(Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/util/y2$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public n(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/model/data/d;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/android/launcher3/model/data/d;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 11
    .line 12
    iput-object v2, v1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 15
    .line 16
    iput-object p1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/taskbar/z3;->k:[Lcom/android/launcher3/model/data/d;

    .line 19
    .line 20
    sget-object v2, Lcom/android/launcher3/model/data/d;->p:Ljava/util/Comparator;

    .line 21
    .line 22
    invoke-static {p1, v1, v2}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-gez p1, :cond_1

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->k:[Lcom/android/launcher3/model/data/d;

    .line 30
    .line 31
    aget-object p0, p0, p1

    .line 32
    .line 33
    return-object p0
.end method

.method o()Ljava/util/stream/Stream;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/stream/Stream<",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->k()Lcom/android/launcher3/popup/P$i;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->j()Lcom/android/launcher3/popup/P$i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [Lcom/android/launcher3/popup/P$i;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aput-object v0, v1, v2

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    aput-object p0, v1, v0

    .line 19
    .line 20
    invoke-static {v1}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-static {}, Ljava/util/stream/Stream;->empty()Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public p()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3;->i:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/notification/NotificationListener;->i(Lcom/android/launcher3/notification/NotificationListener$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/z3;->m:Lcom/android/launcher3/taskbar/b0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b0;->P()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->i()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/notification/NotificationListener;->s(Lcom/android/launcher3/notification/NotificationListener$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/z3;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public y([Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3;->k:[Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    return-void
.end method

.method public z(Ljava/util/HashMap;)V
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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3;->h:Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/n;->k(Ljava/util/HashMap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

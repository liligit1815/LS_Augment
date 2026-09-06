.class public final Lcom/android/launcher3/q0;
.super Ljava/lang/Object;
.source "DropTargetHandler.kt"


# instance fields
.field private final a:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    const-string v0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/SecondaryDropTarget$a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/q0;->h(Lcom/android/launcher3/SecondaryDropTarget$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final h(Lcom/android/launcher3/SecondaryDropTarget$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/SecondaryDropTarget$a;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final j(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "removed by accessibility drop"

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    sget-object p2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object p2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final b()Lcom/android/launcher3/dragndrop/DragLayer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getDragLayer(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final c(Lcom/android/launcher3/model/data/y;)Landroid/view/View;
    .locals 1

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Lcom/android/launcher3/model/data/A;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget p1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 11
    .line 12
    const/16 v0, -0x64

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lc1/a;->e:Landroid/view/View;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public final d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "announcement"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q0;->j(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final e(Lcom/android/launcher3/ButtonDropTarget;)V
    .locals 1

    .line 1
    const-string v0, "buttonDropTarget"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0, v0}, LO0/c;->e(Landroid/view/View;Landroid/graphics/Rect;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f(Lcom/android/launcher3/model/data/y;)V
    .locals 3

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/q0;->j(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 16
    .line 17
    .line 18
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 19
    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget p1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 29
    .line 30
    invoke-interface {v0, p1}, Lcom/android/launcher3/util/Y0;->x(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfo"

    .line 41
    .line 42
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 46
    .line 47
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance p1, Lcom/android/launcher3/o0;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Lcom/android/launcher3/o0;-><init>(Lz1/J3;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1}, Lcom/android/launcher3/views/W;->S(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    const p1, 0x7f14021a

    .line 79
    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/android/launcher3/views/W;->V(Lcom/android/launcher3/C2;I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final g(Landroid/content/ComponentName;Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    const-string v0, "d"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 7
    .line 8
    instance-of v0, p2, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p2

    .line 13
    check-cast v0, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 14
    .line 15
    instance-of p2, p2, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, v0, Lcom/android/launcher3/SecondaryDropTarget$a;->i:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    new-instance p1, Lcom/android/launcher3/p0;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Lcom/android/launcher3/p0;-><init>(Lcom/android/launcher3/SecondaryDropTarget$a;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/v;->addEventCallback(ILjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/SecondaryDropTarget$a;->b()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final i(ILcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {p1, v1, p2}, Lcom/android/launcher3/util/O1;->w(ILcom/android/launcher3/widget/N0;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {v0, p2}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/q0;->a:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    const/16 v0, 0xd

    .line 25
    .line 26
    invoke-virtual {p2, p0, p1, v0}, Lcom/android/launcher3/widget/l0;->Y(Lcom/android/launcher3/v;II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

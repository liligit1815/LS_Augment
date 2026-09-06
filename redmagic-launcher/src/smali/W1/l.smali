.class public final LW1/l;
.super Ljava/lang/Object;
.source "BubbleBarFlyoutController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LW1/l$a;,
        LW1/l$b;,
        LW1/l$c;
    }
.end annotation


# static fields
.field private static final i:LW1/l$b;


# instance fields
.field private final a:Landroid/widget/FrameLayout;

.field private final b:LW1/n;

.field private final c:LW1/A;

.field private final d:LW1/B;

.field private final e:I

.field private f:LW1/z;

.field private g:Ly/z;

.field private final h:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LW1/l$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LW1/l$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LW1/l;->i:LW1/l$b;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;)V
    .locals 8

    .line 1
    const-string v0, "container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "positioner"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbacks"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v1 .. v7}, LW1/l;-><init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;LW1/B;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;LW1/B;)V
    .locals 1

    const-string v0, "container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "positioner"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbacks"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "flyoutScheduler"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, LW1/l;->a:Landroid/widget/FrameLayout;

    .line 4
    iput-object p2, p0, LW1/l;->b:LW1/n;

    .line 5
    iput-object p3, p0, LW1/l;->c:LW1/A;

    .line 6
    iput-object p4, p0, LW1/l;->d:LW1/B;

    .line 7
    sget-object p2, LW1/z;->H:LW1/z$b;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    const-string p4, "getContext(...)"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, LW1/z$b;->c(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, LW1/l;->e:I

    .line 8
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070c1d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, LW1/l;->h:I

    return-void
.end method

.method public synthetic constructor <init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;LW1/B;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    .line 9
    new-instance p4, LW1/D;

    invoke-direct {p4, p1}, LW1/D;-><init>(Landroid/view/View;)V

    .line 10
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, LW1/l;-><init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;LW1/B;)V

    return-void
.end method

.method private final A(LW1/l$a;Lu4/a;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/l$a;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    iget-object v2, p0, LW1/l;->f:LW1/z;

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0}, LW1/l;->r()Ljava/lang/Float;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v3, 0x0

    .line 20
    :goto_0
    const-wide/16 v4, 0x190

    .line 21
    .line 22
    long-to-float v4, v4

    .line 23
    const/high16 v5, 0x3f800000    # 1.0f

    .line 24
    .line 25
    sub-float v6, v5, v3

    .line 26
    .line 27
    mul-float/2addr v4, v6

    .line 28
    float-to-long v6, v4

    .line 29
    iget-object v4, p0, LW1/l;->g:Ly/z;

    .line 30
    .line 31
    if-eqz v4, :cond_2

    .line 32
    .line 33
    invoke-virtual {v4}, Ly/z;->cancel()V

    .line 34
    .line 35
    .line 36
    :cond_2
    new-array v4, v1, [F

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    aput v3, v4, v8

    .line 40
    .line 41
    aput v5, v4, v0

    .line 42
    .line 43
    invoke-static {v4}, Ly/z;->B([F)Ly/z;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3, v6, v7}, Ly/z;->G(J)Ly/z;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object v4, LJ0/l;->a:Ly/n;

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ly/z;->I(Ly/n;)V

    .line 54
    .line 55
    .line 56
    iput-object v3, p0, LW1/l;->g:Ly/z;

    .line 57
    .line 58
    sget-object v4, LW1/l$c;->a:[I

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    aget p1, v4, p1

    .line 65
    .line 66
    if-eq p1, v0, :cond_4

    .line 67
    .line 68
    if-ne p1, v1, :cond_3

    .line 69
    .line 70
    new-instance p1, LW1/b;

    .line 71
    .line 72
    invoke-direct {p1, v2, v3}, LW1/b;-><init>(LW1/z;Ly/z;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, p1}, Ly/d;->c(Ly/d$c;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    new-instance p0, Lh4/j;

    .line 80
    .line 81
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :cond_4
    new-instance p1, LW1/k;

    .line 86
    .line 87
    invoke-direct {p1, v2, v3}, LW1/k;-><init>(LW1/z;Ly/z;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, p1}, Ly/d;->c(Ly/d$c;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    new-instance p1, LW1/l$e;

    .line 97
    .line 98
    invoke-direct {p1, p2, v2, p0}, LW1/l$e;-><init>(Lu4/a;LW1/z;LW1/l;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, p1}, Ly/d;->b(Ly/d$a;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ly/z;->L()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private static final B(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ly/z;->t()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "null cannot be cast to non-null type kotlin.Float"

    .line 6
    .line 7
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p1, Ljava/lang/Float;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final C(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ly/z;->t()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "null cannot be cast to non-null type kotlin.Float"

    .line 6
    .line 7
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p1, Ljava/lang/Float;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, LW1/z;->J(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final E(LW1/z;LW1/m;LW1/l;Lu4/a;)Lh4/t;
    .locals 1

    .line 1
    new-instance v0, LW1/j;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, LW1/j;-><init>(LW1/l;Lu4/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, LW1/z;->I(LW1/m;Lu4/a;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 10
    .line 11
    return-object p0
.end method

.method private static final F(LW1/l;Lu4/a;)Lh4/t;
    .locals 1

    .line 1
    sget-object v0, LW1/l$a;->h:LW1/l$a;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, LW1/l;->A(LW1/l$a;Lu4/a;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method

.method private static final H(LW1/l;Lu4/a;)Lh4/t;
    .locals 1

    .line 1
    sget-object v0, LW1/l$a;->g:LW1/l$a;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, LW1/l;->A(LW1/l$a;Lu4/a;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method

.method private static final J()Lh4/t;
    .locals 1

    .line 1
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic a(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LW1/l;->B(LW1/z;Ly/z;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LW1/l;->w(LW1/z;Ly/z;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LW1/l;->C(LW1/z;Ly/z;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LW1/l;->H(LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LW1/l;->n(LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(LW1/z;LW1/m;LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LW1/l;->E(LW1/z;LW1/m;LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LW1/l;->q(LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h(LW1/z;Lu4/a;LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LW1/l;->z(LW1/z;Lu4/a;LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LW1/l;->F(LW1/l;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LW1/l;->x(LW1/z;Ly/z;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k()Lh4/t;
    .locals 1

    .line 1
    invoke-static {}, LW1/l;->J()Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static final synthetic l(LW1/l;)LW1/A;
    .locals 0

    .line 1
    iget-object p0, p0, LW1/l;->c:LW1/A;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final n(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0}, LW1/l;->o()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 8
    .line 9
    return-object p0
.end method

.method private final o()V
    .locals 2

    .line 1
    iget-object v0, p0, LW1/l;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object v1, p0, LW1/l;->f:LW1/z;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LW1/l;->f:LW1/z;

    .line 10
    .line 11
    return-void
.end method

.method private static final q(LW1/l;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0}, LW1/l;->o()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 8
    .line 9
    return-object p0
.end method

.method private final r()Ljava/lang/Float;
    .locals 2

    .line 1
    iget-object p0, p0, LW1/l;->g:Ly/z;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ly/z;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ly/z;->t()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p0, Ljava/lang/Float;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    return-object v0
.end method

.method private final v(LW1/l$a;Lu4/a;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/l$a;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    iget-object v2, p0, LW1/l;->f:LW1/z;

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0}, LW1/l;->r()Ljava/lang/Float;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 20
    .line 21
    :goto_0
    const-wide/16 v4, 0x15e

    .line 22
    .line 23
    long-to-float v4, v4

    .line 24
    mul-float/2addr v4, v3

    .line 25
    float-to-long v4, v4

    .line 26
    iget-object v6, p0, LW1/l;->g:Ly/z;

    .line 27
    .line 28
    if-eqz v6, :cond_2

    .line 29
    .line 30
    invoke-virtual {v6}, Ly/z;->cancel()V

    .line 31
    .line 32
    .line 33
    :cond_2
    new-array v6, v1, [F

    .line 34
    .line 35
    const/4 v7, 0x0

    .line 36
    aput v3, v6, v7

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    aput v3, v6, v0

    .line 40
    .line 41
    invoke-static {v6}, Ly/z;->B([F)Ly/z;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3, v4, v5}, Ly/z;->G(J)Ly/z;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget-object v4, LJ0/l;->a:Ly/n;

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ly/z;->I(Ly/n;)V

    .line 52
    .line 53
    .line 54
    iput-object v3, p0, LW1/l;->g:Ly/z;

    .line 55
    .line 56
    sget-object p0, LW1/l$c;->a:[I

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    aget p0, p0, v4

    .line 63
    .line 64
    if-eq p0, v0, :cond_4

    .line 65
    .line 66
    if-ne p0, v1, :cond_3

    .line 67
    .line 68
    new-instance p0, LW1/h;

    .line 69
    .line 70
    invoke-direct {p0, v2, v3}, LW1/h;-><init>(LW1/z;Ly/z;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, p0}, Ly/d;->c(Ly/d$c;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    new-instance p0, Lh4/j;

    .line 78
    .line 79
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 80
    .line 81
    .line 82
    throw p0

    .line 83
    :cond_4
    new-instance p0, LW1/g;

    .line 84
    .line 85
    invoke-direct {p0, v2, v3}, LW1/g;-><init>(LW1/z;Ly/z;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, p0}, Ly/d;->c(Ly/d$c;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, LW1/l$d;

    .line 95
    .line 96
    invoke-direct {p0, p2, v2, p1}, LW1/l$d;-><init>(Lu4/a;LW1/z;LW1/l$a;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, p0}, Ly/d;->b(Ly/d$a;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Ly/z;->L()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private static final w(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ly/z;->t()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "null cannot be cast to non-null type kotlin.Float"

    .line 6
    .line 7
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p1, Ljava/lang/Float;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final x(LW1/z;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ly/z;->t()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "null cannot be cast to non-null type kotlin.Float"

    .line 6
    .line 7
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p1, Ljava/lang/Float;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, LW1/z;->J(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final z(LW1/z;Lu4/a;LW1/l;Lu4/a;)Lh4/t;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, LW1/z;->J(F)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    sget-object p0, LW1/l$a;->g:LW1/l$a;

    .line 9
    .line 10
    invoke-direct {p2, p0, p3}, LW1/l;->A(LW1/l$a;Lu4/a;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 14
    .line 15
    return-object p0
.end method


# virtual methods
.method public final D(LW1/m;Lu4/a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/m;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onEnd"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LW1/l;->f:LW1/z;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v1, LW1/l$a;->h:LW1/l$a;

    .line 17
    .line 18
    new-instance v2, LW1/i;

    .line 19
    .line 20
    invoke-direct {v2, v0, p1, p0, p2}, LW1/i;-><init>(LW1/z;LW1/m;LW1/l;Lu4/a;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v1, v2}, LW1/l;->v(LW1/l$a;Lu4/a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final G(LW1/m;Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/m;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onEnd"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LW1/l;->f:LW1/z;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v1, p0, LW1/l;->g:Ly/z;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Ly/z;->i()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v1, p0, LW1/l;->g:Ly/z;

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {v1}, Ly/d;->k()V

    .line 28
    .line 29
    .line 30
    :cond_2
    new-instance v1, LW1/e;

    .line 31
    .line 32
    invoke-direct {v1, p0, p2}, LW1/e;-><init>(LW1/l;Lu4/a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1, v1}, LW1/z;->I(LW1/m;Lu4/a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final I(LW1/m;)V
    .locals 1

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LW1/l;->f:LW1/z;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, LW1/d;

    .line 12
    .line 13
    invoke-direct {v0}, LW1/d;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, LW1/z;->I(LW1/m;Lu4/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final m(Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "endAction"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LW1/l$a;->h:LW1/l$a;

    .line 7
    .line 8
    new-instance v1, LW1/c;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, LW1/c;-><init>(LW1/l;Lu4/a;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, LW1/l;->v(LW1/l$a;Lu4/a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final p(Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "endAction"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LW1/l$a;->g:LW1/l$a;

    .line 7
    .line 8
    new-instance v1, LW1/f;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, LW1/f;-><init>(LW1/l;Lu4/a;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, LW1/l;->v(LW1/l$a;Lu4/a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final s()Landroid/graphics/Rect;
    .locals 2

    .line 1
    iget-object p0, p0, LW1/l;->f:LW1/z;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p0}, LW1/z;->getBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    float-to-int p0, p0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public final t()I
    .locals 0

    .line 1
    iget p0, p0, LW1/l;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final u()Z
    .locals 0

    .line 1
    iget-object p0, p0, LW1/l;->f:LW1/z;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final y(LW1/m;Lu4/a;Lu4/a;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/m;",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onInit"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onEnd"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LW1/l;->f:LW1/z;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, LW1/l;->a:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v0, LW1/z;

    .line 26
    .line 27
    iget-object v1, p0, LW1/l;->a:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "getContext(...)"

    .line 34
    .line 35
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, LW1/l;->b:LW1/n;

    .line 39
    .line 40
    iget-object v3, p0, LW1/l;->d:LW1/B;

    .line 41
    .line 42
    invoke-direct {v0, v1, v2, v3}, LW1/z;-><init>(Landroid/content/Context;LW1/n;LW1/B;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, LW1/l;->b:LW1/n;

    .line 46
    .line 47
    invoke-interface {v1}, LW1/n;->g()F

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    iget-object v2, p0, LW1/l;->b:LW1/n;

    .line 57
    .line 58
    invoke-interface {v2}, LW1/n;->a()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const/4 v2, 0x3

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v2, 0x5

    .line 67
    :goto_0
    or-int/lit8 v2, v2, 0x50

    .line 68
    .line 69
    const/4 v3, -0x2

    .line 70
    invoke-direct {v1, v3, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 71
    .line 72
    .line 73
    iget v2, p0, LW1/l;->h:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 76
    .line 77
    .line 78
    iget v2, p0, LW1/l;->h:I

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, LW1/l;->a:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, LW1/l;->f:LW1/z;

    .line 89
    .line 90
    new-instance v1, LW1/a;

    .line 91
    .line 92
    invoke-direct {v1, v0, p2, p0, p3}, LW1/a;-><init>(LW1/z;Lu4/a;LW1/l;Lu4/a;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p1, v1}, LW1/z;->C(LW1/m;Lu4/a;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

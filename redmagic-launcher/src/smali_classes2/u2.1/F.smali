.class public final Lu2/F;
.super Ljava/lang/Object;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/F$a;,
        Lu2/F$b;,
        Lu2/F$c;,
        Lu2/F$d;,
        Lu2/F$e;,
        Lu2/F$f;,
        Lu2/F$g;,
        Lu2/F$h;,
        Lu2/F$i;,
        Lu2/F$j;,
        Lu2/F$k;,
        Lu2/F$l;
    }
.end annotation


# static fields
.field public static final i:Lu2/F$b;

.field private static final j:Landroid/graphics/PorterDuffXfermode;

.field private static final k:Lu2/F$g;


# instance fields
.field private final a:Ljava/util/concurrent/Executor;

.field private final b:Lu2/F$l;

.field private final c:Lu2/F$e;

.field private final d:Lu2/F$j;

.field private final e:Lu2/F$e;

.field private final f:Lu2/F$g;

.field private final g:[I

.field private final h:[F


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lu2/F$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lu2/F$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lu2/F;->i:Lu2/F$b;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 10
    .line 11
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lu2/F;->j:Landroid/graphics/PorterDuffXfermode;

    .line 17
    .line 18
    new-instance v2, Lu2/F$g;

    .line 19
    .line 20
    const/high16 v7, 0x43fa0000    # 500.0f

    .line 21
    .line 22
    const v8, 0x3f7d70a4    # 0.99f

    .line 23
    .line 24
    .line 25
    const/high16 v3, 0x43e10000    # 450.0f

    .line 26
    .line 27
    const v4, 0x3f770a3d    # 0.965f

    .line 28
    .line 29
    .line 30
    const/high16 v5, 0x43c80000    # 400.0f

    .line 31
    .line 32
    const v6, 0x3f733333    # 0.95f

    .line 33
    .line 34
    .line 35
    invoke-direct/range {v2 .. v8}, Lu2/F$g;-><init>(FFFFFF)V

    .line 36
    .line 37
    .line 38
    sput-object v2, Lu2/F;->k:Lu2/F$g;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lu2/F$l;Lu2/F$e;Lu2/F$j;Lu2/F$e;Lu2/F$g;)V
    .locals 1

    const-string v0, "mainExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timings"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "interpolators"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "springParams"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lu2/F;->a:Ljava/util/concurrent/Executor;

    .line 3
    iput-object p2, p0, Lu2/F;->b:Lu2/F$l;

    .line 4
    iput-object p3, p0, Lu2/F;->c:Lu2/F$e;

    .line 5
    iput-object p4, p0, Lu2/F;->d:Lu2/F$j;

    .line 6
    iput-object p5, p0, Lu2/F;->e:Lu2/F$e;

    .line 7
    iput-object p6, p0, Lu2/F;->f:Lu2/F$g;

    const/4 p1, 0x2

    .line 8
    new-array p1, p1, [I

    iput-object p1, p0, Lu2/F;->g:[I

    const/16 p1, 0x8

    .line 9
    new-array p1, p1, [F

    iput-object p1, p0, Lu2/F;->h:[F

    const/4 p0, 0x0

    const/4 p1, 0x1

    if-nez p4, :cond_0

    move p2, p1

    goto :goto_0

    :cond_0
    move p2, p0

    :goto_0
    if-nez p5, :cond_1

    move p0, p1

    :cond_1
    if-ne p2, p0, :cond_2

    return-void

    .line 10
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Check failed."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Lu2/F$l;Lu2/F$e;Lu2/F$j;Lu2/F$e;Lu2/F$g;ILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p8, p7, 0x8

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move-object p4, v0

    :cond_0
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_1

    move-object p5, v0

    :cond_1
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_2

    .line 11
    sget-object p6, Lu2/F;->k:Lu2/F$g;

    .line 12
    :cond_2
    invoke-direct/range {p0 .. p6}, Lu2/F;-><init>(Ljava/util/concurrent/Executor;Lu2/F$l;Lu2/F$e;Lu2/F$j;Lu2/F$e;Lu2/F$g;)V

    return-void
.end method

.method private static final A(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    const/4 p8, 0x1

    .line 2
    invoke-virtual {p0, p8}, Lu2/F$i;->l(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static/range {p0 .. p7}, Lu2/F;->D(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final B(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    move-object/from16 v1, p17

    .line 4
    .line 5
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static/range {p0 .. p17}, Lu2/F;->E(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method private static final C(Lu2/F$k;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu2/F$k;",
            "Lkotlin/jvm/internal/A;",
            "Lkotlin/jvm/internal/A;",
            "Lkotlin/jvm/internal/C<",
            "Lcom/android/internal/dynamicanimation/animation/SpringAnimation;",
            ">;",
            "Lkotlin/jvm/internal/C<",
            "Lcom/android/internal/dynamicanimation/animation/SpringAnimation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lu2/F$k;->c()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p1, Lkotlin/jvm/internal/A;->g:F

    .line 6
    .line 7
    cmpg-float v0, v0, v1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lu2/F$k;->d()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v1, p2, Lkotlin/jvm/internal/A;->g:F

    .line 17
    .line 18
    cmpg-float v0, v0, v1

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0}, Lu2/F$k;->c()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p1, Lkotlin/jvm/internal/A;->g:F

    .line 28
    .line 29
    invoke-virtual {p0}, Lu2/F$k;->d()F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    iput p0, p2, Lkotlin/jvm/internal/A;->g:F

    .line 34
    .line 35
    iget-object p0, p3, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    iget p1, p1, Lkotlin/jvm/internal/A;->g:F

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object p0, p4, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p0, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 49
    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    iget p1, p2, Lkotlin/jvm/internal/A;->g:F

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method private static final D(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lu2/F$i;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct/range {p1 .. p7}, Lu2/F;->J(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final E(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu2/F$k;",
            "Lu2/F$k;",
            "Lkotlin/jvm/internal/z;",
            "Lu2/F;",
            "Lu2/F$c;",
            "Landroid/graphics/drawable/GradientDrawable;",
            "Landroid/view/View;",
            "Landroid/view/ViewGroupOverlay;",
            "Landroid/view/View;",
            "Landroid/view/ViewOverlay;",
            "ZZZ",
            "Lkotlin/jvm/internal/A;",
            "Lkotlin/jvm/internal/A;",
            "Lkotlin/jvm/internal/C<",
            "Lcom/android/internal/dynamicanimation/animation/SpringAnimation;",
            ">;",
            "Lkotlin/jvm/internal/C<",
            "Lcom/android/internal/dynamicanimation/animation/SpringAnimation;",
            ">;",
            "Lu2/F$i;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v10, p17

    .line 1
    invoke-virtual {v10}, Lu2/F$i;->e()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v10}, Lu2/F$i;->d()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2
    :cond_0
    invoke-virtual {v10}, Lu2/F$i;->g()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v10}, Lu2/F$i;->f()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3
    :cond_1
    invoke-virtual {v10}, Lu2/F$i;->j()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v10}, Lu2/F$i;->i()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    return-void

    :cond_3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {v10, v2}, Lu2/F$i;->m(Z)V

    .line 5
    invoke-virtual {v10, v2}, Lu2/F$i;->p(Z)V

    .line 6
    invoke-virtual {v10, v2}, Lu2/F$i;->s(Z)V

    .line 7
    invoke-virtual/range {p0 .. p0}, Lu2/F$k;->k()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {p1 .. p1}, Lu2/F$k;->k()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v4

    invoke-static {v2, v3, v4}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v2

    .line 8
    invoke-virtual/range {p0 .. p0}, Lu2/F$k;->e()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual/range {p1 .. p1}, Lu2/F$k;->e()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v5

    invoke-static {v3, v4, v5}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v3

    .line 9
    invoke-virtual {v10}, Lu2/F$i;->a()F

    move-result v4

    const/4 v5, 0x2

    int-to-float v5, v5

    div-float/2addr v2, v5

    sub-float/2addr v4, v2

    float-to-int v14, v4

    .line 10
    invoke-virtual {v10}, Lu2/F$i;->b()F

    move-result v4

    div-float/2addr v3, v5

    sub-float/2addr v4, v3

    float-to-int v12, v4

    .line 11
    invoke-virtual {v10}, Lu2/F$i;->a()F

    move-result v4

    add-float/2addr v4, v2

    float-to-int v15, v4

    .line 12
    invoke-virtual {v10}, Lu2/F$i;->b()F

    move-result v2

    add-float/2addr v2, v3

    float-to-int v13, v2

    .line 13
    invoke-virtual/range {p0 .. p0}, Lu2/F$k;->i()F

    move-result v2

    .line 14
    invoke-virtual/range {p1 .. p1}, Lu2/F$k;->i()F

    move-result v3

    .line 15
    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v4

    .line 16
    invoke-static {v2, v3, v4}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v16

    .line 17
    invoke-virtual/range {p0 .. p0}, Lu2/F$k;->b()F

    move-result v2

    .line 18
    invoke-virtual/range {p1 .. p1}, Lu2/F$k;->b()F

    move-result v3

    .line 19
    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v4

    .line 20
    invoke-static {v2, v3, v4}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v17

    .line 21
    new-instance v2, Lu2/F$k;

    move-object v11, v2

    invoke-direct/range {v11 .. v17}, Lu2/F$k;-><init>(IIIIFF)V

    .line 22
    iget-object v3, v1, Lu2/F;->b:Lu2/F$l;

    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v4

    invoke-interface/range {p4 .. p4}, Lu2/F$c;->d()Z

    move-result v5

    invoke-direct {v1, v3, v4, v5}, Lu2/F;->p(Lu2/F$l;FZ)Z

    move-result v3

    invoke-virtual {v2, v3}, Lu2/F$k;->r(Z)V

    .line 23
    iget-boolean v3, v0, Lkotlin/jvm/internal/z;->g:Z

    if-nez v3, :cond_4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move/from16 v9, p10

    move-object v3, v2

    move-object/from16 v2, p4

    .line 24
    invoke-direct/range {v1 .. v9}, Lu2/F;->G(Lu2/F$c;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;Z)Z

    move-result v5

    move-object v2, v3

    .line 25
    iput-boolean v5, v0, Lkotlin/jvm/internal/z;->g:Z

    .line 26
    :cond_4
    iget-boolean v0, v0, Lkotlin/jvm/internal/z;->g:Z

    if-eqz v0, :cond_5

    .line 27
    invoke-static/range {p8 .. p8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    move-object/from16 v4, p8

    goto :goto_0

    .line 28
    :cond_5
    invoke-interface/range {p4 .. p4}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    move-result-object v0

    move-object v4, v0

    .line 29
    :goto_0
    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v3

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v0, p3

    move-object/from16 v1, p5

    move/from16 v5, p11

    move/from16 v6, p12

    .line 30
    invoke-direct/range {v0 .. v8}, Lu2/F;->o(Landroid/graphics/drawable/GradientDrawable;Lu2/F$k;FLandroid/view/View;ZZZZ)V

    .line 31
    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v0

    invoke-virtual {v10}, Lu2/F$i;->c()F

    move-result v1

    move-object/from16 v3, p4

    invoke-interface {v3, v2, v0, v1}, Lu2/F$c;->i(Lu2/F$k;FF)V

    move-object/from16 v0, p1

    move-object/from16 v1, p13

    move-object/from16 v2, p14

    move-object/from16 v3, p15

    move-object/from16 v4, p16

    .line 32
    invoke-static {v0, v1, v2, v3, v4}, Lu2/F;->C(Lu2/F$k;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;)V

    return-void
.end method

.method private final G(Lu2/F$c;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;Z)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Lu2/F$c;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    if-eqz p8, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Lu2/F$k;->j()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p5, p3}, Landroid/view/ViewGroupOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p7, p3}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lu2/I;->a:Lu2/I;

    .line 26
    .line 27
    invoke-static {p6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Lu2/u;

    .line 31
    .line 32
    invoke-direct {p1}, Lu2/u;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p4, p6, p1}, Lu2/I;->c(Landroid/view/View;Landroid/view/View;Lu4/a;)V

    .line 36
    .line 37
    .line 38
    return v0

    .line 39
    :cond_0
    invoke-interface {p1}, Lu2/F$c;->d()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    if-eqz p8, :cond_1

    .line 46
    .line 47
    invoke-virtual {p2}, Lu2/F$k;->j()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-static {p7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p7, p3}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p5, p3}, Landroid/view/ViewGroupOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Lu2/I;->a:Lu2/I;

    .line 63
    .line 64
    invoke-static {p6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Lu2/v;

    .line 68
    .line 69
    invoke-direct {p1}, Lu2/v;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p6, p4, p1}, Lu2/I;->c(Landroid/view/View;Landroid/view/View;Lu4/a;)V

    .line 73
    .line 74
    .line 75
    return v0

    .line 76
    :cond_1
    const/4 p0, 0x0

    .line 77
    return p0
.end method

.method private static final H()Lh4/t;
    .locals 1

    .line 1
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object v0
.end method

.method private static final I()Lh4/t;
    .locals 1

    .line 1
    sget-object v0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object v0
.end method

.method private final J(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V
    .locals 7

    .line 1
    new-instance v0, Lu2/D;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v3, p4

    .line 7
    move-object v6, p5

    .line 8
    move v5, p6

    .line 9
    invoke-direct/range {v0 .. v6}, Lu2/D;-><init>(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/android/systemui/Flags;->sceneContainer()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    invoke-interface {v1}, Lu2/F$c;->d()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    :goto_0
    iget-object p0, p0, Lu2/F;->a:Ljava/util/concurrent/Executor;

    .line 30
    .line 31
    new-instance p1, Lu2/E;

    .line 32
    .line 33
    invoke-direct {p1, v0}, Lu2/E;-><init>(Lu4/a;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private static final K(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)Lh4/t;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu2/F$c;->j(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2, p3}, Landroid/view/ViewGroupOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lu2/F$c;->d()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-eqz p5, :cond_0

    .line 16
    .line 17
    invoke-virtual {p5, p3}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 21
    .line 22
    return-object p0
.end method

.method private static final L(Lu4/a;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final M(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Lu2/F$c;->m(Z)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lu2/F$c;->d()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_1

    .line 9
    .line 10
    if-nez p5, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p5, p3}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    :goto_0
    invoke-virtual {p4, p3}, Landroid/view/ViewGroupOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p11}, Lu2/F;->A(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()Lh4/t;
    .locals 1

    .line 1
    invoke-static {}, Lu2/F;->I()Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic c(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p11}, Lu2/F;->v(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lu2/F;->L(Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p17}, Lu2/F;->B(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p17}, Lu2/F;->w(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g()Lh4/t;
    .locals 1

    .line 1
    invoke-static {}, Lu2/F;->H()Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic h(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lu2/F;->y(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lu2/F;->K(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p17}, Lu2/F;->z(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p11}, Lu2/F;->x(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lu2/F;FLkotlin/jvm/internal/A;ILkotlin/jvm/internal/B;Lu2/F$k;ILkotlin/jvm/internal/B;ILkotlin/jvm/internal/B;FFFFLu2/F$c;Lkotlin/jvm/internal/z;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p27}, Lu2/F;->s(Lu2/F;FLkotlin/jvm/internal/A;ILkotlin/jvm/internal/B;Lu2/F$k;ILkotlin/jvm/internal/B;ILkotlin/jvm/internal/B;FFFFLu2/F$c;Lkotlin/jvm/internal/z;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic m(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lu2/F;->J(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic n(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lu2/F;->M(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final o(Landroid/graphics/drawable/GradientDrawable;Lu2/F$k;FLandroid/view/View;ZZZZ)V
    .locals 12

    .line 1
    iget-object v0, p0, Lu2/F;->g:[I

    .line 2
    .line 3
    move-object/from16 v1, p4

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lu2/F$k;->f()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lu2/F;->g:[I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aget v1, v1, v2

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    invoke-virtual {p2}, Lu2/F$k;->h()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v3, p0, Lu2/F;->g:[I

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    aget v3, v3, v4

    .line 26
    .line 27
    sub-int/2addr v1, v3

    .line 28
    invoke-virtual {p2}, Lu2/F$k;->g()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    iget-object v5, p0, Lu2/F;->g:[I

    .line 33
    .line 34
    aget v5, v5, v2

    .line 35
    .line 36
    sub-int/2addr v3, v5

    .line 37
    invoke-virtual {p2}, Lu2/F$k;->a()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    iget-object v6, p0, Lu2/F;->g:[I

    .line 42
    .line 43
    aget v6, v6, v4

    .line 44
    .line 45
    sub-int/2addr v5, v6

    .line 46
    invoke-virtual {p1, v0, v1, v3, v5}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lu2/F;->h:[F

    .line 50
    .line 51
    invoke-virtual {p2}, Lu2/F$k;->i()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    aput v1, v0, v2

    .line 56
    .line 57
    iget-object v0, p0, Lu2/F;->h:[F

    .line 58
    .line 59
    invoke-virtual {p2}, Lu2/F$k;->i()F

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    aput v1, v0, v4

    .line 64
    .line 65
    iget-object v0, p0, Lu2/F;->h:[F

    .line 66
    .line 67
    const/4 v1, 0x2

    .line 68
    invoke-virtual {p2}, Lu2/F$k;->i()F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    aput v3, v0, v1

    .line 73
    .line 74
    iget-object v0, p0, Lu2/F;->h:[F

    .line 75
    .line 76
    const/4 v1, 0x3

    .line 77
    invoke-virtual {p2}, Lu2/F$k;->i()F

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    aput v3, v0, v1

    .line 82
    .line 83
    iget-object v0, p0, Lu2/F;->h:[F

    .line 84
    .line 85
    const/4 v1, 0x4

    .line 86
    invoke-virtual {p2}, Lu2/F$k;->b()F

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    aput v3, v0, v1

    .line 91
    .line 92
    iget-object v0, p0, Lu2/F;->h:[F

    .line 93
    .line 94
    const/4 v1, 0x5

    .line 95
    invoke-virtual {p2}, Lu2/F$k;->b()F

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    aput v3, v0, v1

    .line 100
    .line 101
    iget-object v0, p0, Lu2/F;->h:[F

    .line 102
    .line 103
    const/4 v1, 0x6

    .line 104
    invoke-virtual {p2}, Lu2/F$k;->b()F

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    aput v3, v0, v1

    .line 109
    .line 110
    iget-object v0, p0, Lu2/F;->h:[F

    .line 111
    .line 112
    const/4 v1, 0x7

    .line 113
    invoke-virtual {p2}, Lu2/F$k;->b()F

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    aput p2, v0, v1

    .line 118
    .line 119
    iget-object p2, p0, Lu2/F;->h:[F

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 122
    .line 123
    .line 124
    if-eqz p8, :cond_0

    .line 125
    .line 126
    iget-object p2, p0, Lu2/F;->e:Lu2/F$e;

    .line 127
    .line 128
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lu2/F;->d:Lu2/F$j;

    .line 132
    .line 133
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 137
    .line 138
    invoke-virtual {p0}, Lu2/F$j;->c()F

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {p0}, Lu2/F$j;->d()F

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {v0, p3, v1, v3}, Lu2/F$b;->f(FFF)F

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {p0}, Lu2/F$j;->a()F

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    invoke-virtual {p0}, Lu2/F$j;->b()F

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    invoke-virtual {v0, p3, v3, p0}, Lu2/F$b;->f(FFF)F

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    goto :goto_0

    .line 163
    :cond_0
    iget-object p2, p0, Lu2/F;->c:Lu2/F$e;

    .line 164
    .line 165
    sget-object v5, Lu2/F;->i:Lu2/F$b;

    .line 166
    .line 167
    iget-object v6, p0, Lu2/F;->b:Lu2/F$l;

    .line 168
    .line 169
    invoke-virtual {v6}, Lu2/F$l;->e()J

    .line 170
    .line 171
    .line 172
    move-result-wide v8

    .line 173
    iget-object v0, p0, Lu2/F;->b:Lu2/F$l;

    .line 174
    .line 175
    invoke-virtual {v0}, Lu2/F$l;->f()J

    .line 176
    .line 177
    .line 178
    move-result-wide v10

    .line 179
    move v7, p3

    .line 180
    invoke-virtual/range {v5 .. v11}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    iget-object v6, p0, Lu2/F;->b:Lu2/F$l;

    .line 185
    .line 186
    invoke-virtual {v6}, Lu2/F$l;->c()J

    .line 187
    .line 188
    .line 189
    move-result-wide v8

    .line 190
    iget-object p0, p0, Lu2/F;->b:Lu2/F$l;

    .line 191
    .line 192
    invoke-virtual {p0}, Lu2/F$l;->d()J

    .line 193
    .line 194
    .line 195
    move-result-wide v10

    .line 196
    invoke-virtual/range {v5 .. v11}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    :goto_0
    const/high16 p3, 0x3f800000    # 1.0f

    .line 201
    .line 202
    const/16 v0, 0xff

    .line 203
    .line 204
    if-eqz p7, :cond_4

    .line 205
    .line 206
    cmpg-float v3, v1, p3

    .line 207
    .line 208
    if-gez v3, :cond_1

    .line 209
    .line 210
    invoke-virtual {p2}, Lu2/F$e;->d()Landroid/view/animation/Interpolator;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-interface {p0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    int-to-float p2, v0

    .line 219
    mul-float/2addr p0, p2

    .line 220
    invoke-static {p0}, Lx4/a;->a(F)I

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_1
    if-eqz p5, :cond_2

    .line 229
    .line 230
    int-to-float p3, v4

    .line 231
    invoke-virtual {p2}, Lu2/F$e;->c()Landroid/view/animation/Interpolator;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-interface {p2, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    sub-float/2addr p3, p0

    .line 240
    int-to-float p0, v0

    .line 241
    mul-float/2addr p3, p0

    .line 242
    invoke-static {p3}, Lx4/a;->a(F)I

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 247
    .line 248
    .line 249
    if-eqz p6, :cond_5

    .line 250
    .line 251
    sget-object p0, Lu2/F;->j:Landroid/graphics/PorterDuffXfermode;

    .line 252
    .line 253
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setXfermode(Landroid/graphics/Xfermode;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_2
    invoke-static {}, Lcom/android/systemui/Flags;->moveTransitionAnimationLayer()Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-eqz p2, :cond_3

    .line 262
    .line 263
    cmpl-float p0, p0, p3

    .line 264
    .line 265
    if-ltz p0, :cond_3

    .line 266
    .line 267
    if-eqz p6, :cond_3

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 270
    .line 271
    .line 272
    sget-object p0, Lu2/F;->j:Landroid/graphics/PorterDuffXfermode;

    .line 273
    .line 274
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setXfermode(Landroid/graphics/Xfermode;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_3
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_4
    cmpg-float p3, v1, p3

    .line 283
    .line 284
    if-gez p3, :cond_6

    .line 285
    .line 286
    if-eqz p5, :cond_6

    .line 287
    .line 288
    invoke-virtual {p2}, Lu2/F$e;->d()Landroid/view/animation/Interpolator;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-interface {p0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    int-to-float p2, v0

    .line 297
    mul-float/2addr p0, p2

    .line 298
    invoke-static {p0}, Lx4/a;->a(F)I

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 303
    .line 304
    .line 305
    if-eqz p6, :cond_5

    .line 306
    .line 307
    sget-object p0, Lu2/F;->j:Landroid/graphics/PorterDuffXfermode;

    .line 308
    .line 309
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setXfermode(Landroid/graphics/Xfermode;)V

    .line 310
    .line 311
    .line 312
    :cond_5
    return-void

    .line 313
    :cond_6
    int-to-float p3, v4

    .line 314
    invoke-virtual {p2}, Lu2/F$e;->c()Landroid/view/animation/Interpolator;

    .line 315
    .line 316
    .line 317
    move-result-object p2

    .line 318
    invoke-interface {p2, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 319
    .line 320
    .line 321
    move-result p0

    .line 322
    sub-float/2addr p3, p0

    .line 323
    int-to-float p0, v0

    .line 324
    mul-float/2addr p3, p0

    .line 325
    invoke-static {p3}, Lx4/a;->a(F)I

    .line 326
    .line 327
    .line 328
    move-result p0

    .line 329
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 330
    .line 331
    .line 332
    const/4 p0, 0x0

    .line 333
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setXfermode(Landroid/graphics/Xfermode;)V

    .line 334
    .line 335
    .line 336
    return-void
.end method

.method private final p(Lu2/F$l;FZ)Z
    .locals 8

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    sget-object v1, Lu2/F;->i:Lu2/F$b;

    .line 6
    .line 7
    invoke-virtual {p1}, Lu2/F$l;->e()J

    .line 8
    .line 9
    .line 10
    move-result-wide v4

    .line 11
    invoke-virtual {p1}, Lu2/F$l;->f()J

    .line 12
    .line 13
    .line 14
    move-result-wide v6

    .line 15
    move-object v2, p1

    .line 16
    move v3, p2

    .line 17
    invoke-virtual/range {v1 .. v7}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/high16 p2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    cmpg-float p1, p1, p2

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    return p0

    .line 29
    :cond_1
    move-object v2, p1

    .line 30
    move v3, p2

    .line 31
    sget-object v1, Lu2/F;->i:Lu2/F$b;

    .line 32
    .line 33
    invoke-virtual {v2}, Lu2/F$l;->c()J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    invoke-virtual {v2}, Lu2/F$l;->d()J

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    invoke-virtual/range {v1 .. v7}, Lu2/F$b;->e(Lu2/F$l;FJJ)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/4 p2, 0x0

    .line 46
    cmpl-float p1, p1, p2

    .line 47
    .line 48
    if-lez p1, :cond_2

    .line 49
    .line 50
    return v0

    .line 51
    :cond_2
    return p0
.end method

.method private final r(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZ)Lu2/F$a;
    .locals 29

    move-object/from16 v1, p0

    .line 1
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->h()I

    move-result v8

    .line 2
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->a()I

    move-result v9

    .line 3
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->f()I

    move-result v0

    .line 4
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->g()I

    move-result v2

    add-int v3, v0, v2

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v10, v3, v4

    sub-int v11, v2, v0

    move v12, v11

    .line 5
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->i()F

    move-result v11

    .line 6
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->b()F

    move-result v13

    move v14, v8

    .line 7
    new-instance v8, Lkotlin/jvm/internal/B;

    invoke-direct {v8}, Lkotlin/jvm/internal/B;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->h()I

    move-result v0

    iput v0, v8, Lkotlin/jvm/internal/B;->g:I

    move v15, v10

    .line 8
    new-instance v10, Lkotlin/jvm/internal/B;

    invoke-direct {v10}, Lkotlin/jvm/internal/B;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->a()I

    move-result v0

    iput v0, v10, Lkotlin/jvm/internal/B;->g:I

    .line 9
    new-instance v0, Lkotlin/jvm/internal/B;

    invoke-direct {v0}, Lkotlin/jvm/internal/B;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->f()I

    move-result v2

    iput v2, v0, Lkotlin/jvm/internal/B;->g:I

    .line 10
    new-instance v2, Lkotlin/jvm/internal/B;

    invoke-direct {v2}, Lkotlin/jvm/internal/B;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->g()I

    move-result v3

    iput v3, v2, Lkotlin/jvm/internal/B;->g:I

    .line 11
    new-instance v3, Lkotlin/jvm/internal/A;

    invoke-direct {v3}, Lkotlin/jvm/internal/A;-><init>()V

    iget v5, v0, Lkotlin/jvm/internal/B;->g:I

    iget v6, v2, Lkotlin/jvm/internal/B;->g:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v5, v4

    iput v5, v3, Lkotlin/jvm/internal/A;->g:F

    .line 12
    new-instance v4, Lkotlin/jvm/internal/B;

    invoke-direct {v4}, Lkotlin/jvm/internal/B;-><init>()V

    iget v5, v2, Lkotlin/jvm/internal/B;->g:I

    iget v6, v0, Lkotlin/jvm/internal/B;->g:I

    sub-int/2addr v5, v6

    iput v5, v4, Lkotlin/jvm/internal/B;->g:I

    move/from16 v16, v12

    .line 13
    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->i()F

    move-result v12

    move/from16 v17, v14

    .line 14
    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->b()F

    move-result v14

    move-object/from16 v5, p3

    move-object/from16 v6, p5

    move-object v7, v3

    .line 15
    invoke-virtual {v1, v6, v5}, Lu2/F;->F(Landroid/view/View;Lu2/F$k;)Z

    move-result v3

    move/from16 v18, v16

    .line 16
    new-instance v16, Lkotlin/jvm/internal/z;

    invoke-direct/range {v16 .. v16}, Lkotlin/jvm/internal/z;-><init>()V

    move-object/from16 v26, v0

    const/4 v0, 0x2

    .line 17
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    move-object/from16 v27, v2

    .line 18
    iget-object v2, v1, Lu2/F;->b:Lu2/F$l;

    invoke-virtual {v2}, Lu2/F$l;->g()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 19
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    move-object v1, v0

    .line 20
    new-instance v0, Lu2/F$m;

    move-object/from16 v2, p1

    move-object/from16 v5, p6

    move-object/from16 v6, p8

    move-object/from16 v20, v4

    move-object/from16 v19, v7

    move-object/from16 v21, v8

    move-object/from16 v4, p4

    move/from16 v7, p11

    move-object v8, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v7}, Lu2/F$m;-><init>(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 21
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 22
    new-instance v0, Lu2/t;

    move-object/from16 v6, p2

    move-object/from16 v25, p3

    move/from16 v23, p9

    move/from16 v24, p10

    move/from16 v22, p11

    move-object/from16 v28, v8

    move v2, v15

    move/from16 v7, v17

    move/from16 v4, v18

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v8, v21

    move-object/from16 v15, p1

    move-object/from16 v17, p4

    move-object/from16 v18, p5

    move-object/from16 v19, p6

    move-object/from16 v20, p7

    move-object/from16 v21, p8

    invoke-direct/range {v0 .. v27}, Lu2/t;-><init>(Lu2/F;FLkotlin/jvm/internal/A;ILkotlin/jvm/internal/B;Lu2/F$k;ILkotlin/jvm/internal/B;ILkotlin/jvm/internal/B;FFFFLu2/F$c;Lkotlin/jvm/internal/z;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;)V

    move-object/from16 v8, v28

    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 23
    new-instance v0, Lu2/F$d;

    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-direct {v0, v8}, Lu2/F$d;-><init>(Landroid/animation/Animator;)V

    return-object v0

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static final s(Lu2/F;FLkotlin/jvm/internal/A;ILkotlin/jvm/internal/B;Lu2/F$k;ILkotlin/jvm/internal/B;ILkotlin/jvm/internal/B;FFFFLu2/F$c;Lkotlin/jvm/internal/z;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Landroid/animation/ValueAnimator;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v2, p5

    move-object/from16 v9, p15

    const-string v1, "animation"

    move-object/from16 v3, p27

    invoke-static {v3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v15, p2

    move-object/from16 v16, p4

    move-object/from16 v10, p7

    move-object/from16 v12, p9

    move-object/from16 v11, p24

    move-object/from16 v13, p25

    move-object/from16 v14, p26

    .line 1
    invoke-static/range {v10 .. v16}, Lu2/F;->t(Lkotlin/jvm/internal/B;Lu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/B;)V

    .line 2
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v10

    .line 3
    iget-object v1, v0, Lu2/F;->c:Lu2/F$e;

    invoke-virtual {v1}, Lu2/F$e;->e()Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-interface {v1, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v11

    .line 4
    iget-object v1, v0, Lu2/F;->c:Lu2/F$e;

    invoke-virtual {v1}, Lu2/F$e;->f()Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-interface {v1, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    .line 5
    iget v3, v15, Lkotlin/jvm/internal/A;->g:F

    move/from16 v4, p1

    invoke-static {v4, v3, v1}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v1

    move-object/from16 v3, p4

    .line 6
    iget v3, v3, Lkotlin/jvm/internal/B;->g:I

    move/from16 v4, p3

    invoke-static {v4, v3, v11}, Landroid/util/MathUtils;->lerp(IIF)F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    move-object/from16 v4, p7

    .line 7
    iget v4, v4, Lkotlin/jvm/internal/B;->g:I

    move/from16 v5, p6

    invoke-static {v5, v4, v11}, Landroid/util/MathUtils;->lerp(IIF)F

    move-result v4

    invoke-static {v4}, Lx4/a;->a(F)I

    move-result v4

    invoke-virtual {v2, v4}, Lu2/F$k;->p(I)V

    .line 8
    iget v4, v12, Lkotlin/jvm/internal/B;->g:I

    move/from16 v5, p8

    invoke-static {v5, v4, v11}, Landroid/util/MathUtils;->lerp(IIF)F

    move-result v4

    invoke-static {v4}, Lx4/a;->a(F)I

    move-result v4

    invoke-virtual {v2, v4}, Lu2/F$k;->l(I)V

    sub-float v4, v1, v3

    .line 9
    invoke-static {v4}, Lx4/a;->a(F)I

    move-result v4

    invoke-virtual {v2, v4}, Lu2/F$k;->n(I)V

    add-float/2addr v1, v3

    .line 10
    invoke-static {v1}, Lx4/a;->a(F)I

    move-result v1

    invoke-virtual {v2, v1}, Lu2/F$k;->o(I)V

    move/from16 v1, p10

    move/from16 v3, p11

    .line 11
    invoke-static {v1, v3, v11}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v1

    .line 12
    invoke-virtual {v2, v1}, Lu2/F$k;->q(F)V

    move/from16 v1, p12

    move/from16 v3, p13

    .line 13
    invoke-static {v1, v3, v11}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result v1

    .line 14
    invoke-virtual {v2, v1}, Lu2/F$k;->m(F)V

    .line 15
    iget-object v1, v0, Lu2/F;->b:Lu2/F$l;

    invoke-interface/range {p14 .. p14}, Lu2/F$c;->d()Z

    move-result v3

    invoke-direct {v0, v1, v10, v3}, Lu2/F;->p(Lu2/F$l;FZ)Z

    move-result v1

    invoke-virtual {v2, v1}, Lu2/F$k;->r(Z)V

    .line 16
    iget-boolean v1, v9, Lkotlin/jvm/internal/z;->g:Z

    if-nez v1, :cond_0

    move-object/from16 v1, p14

    move-object/from16 v3, p16

    move-object/from16 v4, p17

    move-object/from16 v5, p18

    move-object/from16 v6, p19

    move-object/from16 v7, p20

    move/from16 v8, p21

    .line 17
    invoke-direct/range {v0 .. v8}, Lu2/F;->G(Lu2/F$c;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;Z)Z

    move-result v4

    .line 18
    iput-boolean v4, v9, Lkotlin/jvm/internal/z;->g:Z

    .line 19
    :cond_0
    iget-boolean v0, v9, Lkotlin/jvm/internal/z;->g:Z

    if-eqz v0, :cond_1

    .line 20
    invoke-static/range {p19 .. p19}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    move-object/from16 v4, p19

    goto :goto_0

    .line 21
    :cond_1
    invoke-interface/range {p14 .. p14}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    move-result-object v0

    move-object v4, v0

    .line 22
    :goto_0
    invoke-interface/range {p14 .. p14}, Lu2/F$c;->d()Z

    move-result v7

    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object/from16 v2, p5

    move-object/from16 v1, p16

    move/from16 v5, p22

    move/from16 v6, p23

    move v3, v10

    .line 23
    invoke-direct/range {v0 .. v8}, Lu2/F;->o(Landroid/graphics/drawable/GradientDrawable;Lu2/F$k;FLandroid/view/View;ZZZZ)V

    move-object/from16 v1, p14

    .line 24
    invoke-interface {v1, v2, v11, v3}, Lu2/F$c;->i(Lu2/F$k;FF)V

    return-void
.end method

.method private static final t(Lkotlin/jvm/internal/B;Lu2/F$k;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/B;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/B;)V
    .locals 2

    .line 1
    iget v0, p0, Lkotlin/jvm/internal/B;->g:I

    .line 2
    .line 3
    invoke-virtual {p1}, Lu2/F$k;->h()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p2, Lkotlin/jvm/internal/B;->g:I

    .line 10
    .line 11
    invoke-virtual {p1}, Lu2/F$k;->a()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget v0, p3, Lkotlin/jvm/internal/B;->g:I

    .line 18
    .line 19
    invoke-virtual {p1}, Lu2/F$k;->f()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    iget v0, p4, Lkotlin/jvm/internal/B;->g:I

    .line 26
    .line 27
    invoke-virtual {p1}, Lu2/F$k;->g()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eq v0, v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lu2/F$k;->h()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lkotlin/jvm/internal/B;->g:I

    .line 40
    .line 41
    invoke-virtual {p1}, Lu2/F$k;->a()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    iput p0, p2, Lkotlin/jvm/internal/B;->g:I

    .line 46
    .line 47
    invoke-virtual {p1}, Lu2/F$k;->f()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    iput p0, p3, Lkotlin/jvm/internal/B;->g:I

    .line 52
    .line 53
    invoke-virtual {p1}, Lu2/F$k;->g()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    iput p0, p4, Lkotlin/jvm/internal/B;->g:I

    .line 58
    .line 59
    iget p1, p3, Lkotlin/jvm/internal/B;->g:I

    .line 60
    .line 61
    add-int p2, p1, p0

    .line 62
    .line 63
    int-to-float p2, p2

    .line 64
    const/high16 p3, 0x40000000    # 2.0f

    .line 65
    .line 66
    div-float/2addr p2, p3

    .line 67
    iput p2, p5, Lkotlin/jvm/internal/A;->g:F

    .line 68
    .line 69
    sub-int/2addr p0, p1

    .line 70
    iput p0, p6, Lkotlin/jvm/internal/B;->g:I

    .line 71
    .line 72
    return-void
.end method

.method private final u(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/PointF;JLandroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZ)Lu2/F$a;
    .locals 42

    move-object/from16 v2, p0

    .line 1
    new-instance v16, Lkotlin/jvm/internal/C;

    invoke-direct/range {v16 .. v16}, Lkotlin/jvm/internal/C;-><init>()V

    .line 2
    new-instance v17, Lkotlin/jvm/internal/C;

    invoke-direct/range {v17 .. v17}, Lkotlin/jvm/internal/C;-><init>()V

    .line 3
    new-instance v14, Lkotlin/jvm/internal/A;

    invoke-direct {v14}, Lkotlin/jvm/internal/A;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->c()F

    move-result v0

    iput v0, v14, Lkotlin/jvm/internal/A;->g:F

    .line 4
    new-instance v15, Lkotlin/jvm/internal/A;

    invoke-direct {v15}, Lkotlin/jvm/internal/A;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->d()F

    move-result v0

    iput v0, v15, Lkotlin/jvm/internal/A;->g:F

    .line 5
    new-instance v3, Lkotlin/jvm/internal/z;

    invoke-direct {v3}, Lkotlin/jvm/internal/z;-><init>()V

    .line 6
    new-instance v1, Lu2/F$i;

    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->c()F

    move-result v19

    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->d()F

    move-result v20

    const/16 v28, 0x1fc

    const/16 v29, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v18, v1

    invoke-direct/range {v18 .. v29}, Lu2/F$i;-><init>(FFFZZZZZZILkotlin/jvm/internal/j;)V

    move-object/from16 v0, p3

    move-object/from16 v7, p8

    .line 7
    invoke-virtual {v2, v7, v0}, Lu2/F;->F(Landroid/view/View;Lu2/F$k;)Z

    move-result v18

    .line 8
    new-instance v4, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 9
    sget-object v5, Lu2/F;->i:Lu2/F$b;

    sget-object v6, Lu2/F$h;->g:Lu2/F$h;

    new-instance v0, Lu2/w;

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v11, p14

    move-object/from16 v30, v1

    move-object/from16 v31, v4

    move-object/from16 v32, v5

    move-object/from16 v33, v6

    move-object/from16 v5, p1

    move-object/from16 v1, p2

    move-object/from16 v6, p7

    move-object v4, v2

    move-object/from16 v2, p3

    invoke-direct/range {v0 .. v17}, Lu2/w;-><init>(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;)V

    move-object v1, v0

    move-object v10, v3

    move-object v2, v4

    move-object/from16 v9, v16

    move-object/from16 v11, v32

    move-object/from16 v0, v33

    invoke-static {v11, v0, v1}, Lu2/F$b;->a(Lu2/F$b;Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;

    move-result-object v0

    move-object/from16 v1, v30

    move-object/from16 v12, v31

    .line 10
    invoke-direct {v12, v1, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 11
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/SpringForce;

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->c()F

    move-result v3

    invoke-direct {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;-><init>(F)V

    .line 12
    iget-object v3, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v3}, Lu2/F$g;->b()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setStiffness(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 13
    iget-object v3, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v3}, Lu2/F$g;->a()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setDampingRatio(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 14
    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setSpring(Lcom/android/internal/dynamicanimation/animation/SpringForce;)Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 15
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->c()F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setStartValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    move-object/from16 v13, p4

    .line 16
    iget v0, v13, Landroid/graphics/PointF;->x:F

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setStartVelocity(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 17
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->c()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->c()F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMinValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 18
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->c()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->c()F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMaxValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 19
    new-instance v0, Lu2/x;

    move-object/from16 v3, p1

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p11

    move/from16 v8, p14

    move/from16 v4, v18

    invoke-direct/range {v0 .. v8}, Lu2/x;-><init>(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->addEndListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 20
    iput-object v12, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 21
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 22
    sget-object v2, Lu2/F$h;->h:Lu2/F$h;

    move-object v3, v0

    new-instance v0, Lu2/y;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move/from16 v12, p12

    move/from16 v13, p13

    move-object/from16 v34, v1

    move-object/from16 v37, v2

    move-object/from16 v36, v3

    move-object v3, v10

    move-object/from16 v35, v11

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move/from16 v11, p14

    invoke-direct/range {v0 .. v17}, Lu2/y;-><init>(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;)V

    move-object v1, v0

    move-object v10, v3

    move-object v2, v4

    move-object/from16 v9, v17

    move-object/from16 v11, v35

    move-object/from16 v0, v37

    invoke-static {v11, v0, v1}, Lu2/F$b;->a(Lu2/F$b;Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;

    move-result-object v0

    move-object/from16 v1, v34

    move-object/from16 v12, v36

    .line 23
    invoke-direct {v12, v1, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 24
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/SpringForce;

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->d()F

    move-result v3

    invoke-direct {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;-><init>(F)V

    .line 25
    iget-object v3, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v3}, Lu2/F$g;->d()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setStiffness(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 26
    iget-object v3, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v3}, Lu2/F$g;->c()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setDampingRatio(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 27
    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setSpring(Lcom/android/internal/dynamicanimation/animation/SpringForce;)Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 28
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->d()F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setStartValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    move-object/from16 v13, p4

    .line 29
    iget v0, v13, Landroid/graphics/PointF;->y:F

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setStartVelocity(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 30
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->d()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->d()F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMinValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 31
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->d()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lu2/F$k;->d()F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMaxValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 32
    new-instance v0, Lu2/z;

    move-object/from16 v3, p1

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p11

    move/from16 v8, p14

    move/from16 v4, v18

    invoke-direct/range {v0 .. v8}, Lu2/z;-><init>(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    invoke-virtual {v12, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->addEndListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 33
    iput-object v12, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 34
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 35
    sget-object v2, Lu2/F$h;->i:Lu2/F$h;

    move-object v3, v0

    new-instance v0, Lu2/A;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move/from16 v12, p12

    move/from16 v13, p13

    move-object/from16 v38, v1

    move-object/from16 v41, v2

    move-object/from16 v40, v3

    move-object v3, v10

    move-object/from16 v39, v11

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move/from16 v11, p14

    invoke-direct/range {v0 .. v17}, Lu2/A;-><init>(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;)V

    move-object v1, v0

    move-object v2, v4

    move-object/from16 v9, v16

    move-object/from16 v10, v17

    move-object/from16 v11, v39

    move-object/from16 v0, v41

    invoke-static {v11, v0, v1}, Lu2/F$b;->a(Lu2/F$b;Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;

    move-result-object v0

    move-object/from16 v1, v38

    move-object/from16 v11, v40

    .line 36
    invoke-direct {v11, v1, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 37
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/SpringForce;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v3}, Lcom/android/internal/dynamicanimation/animation/SpringForce;-><init>(F)V

    .line 38
    iget-object v4, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v4}, Lu2/F$g;->f()F

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setStiffness(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 39
    iget-object v4, v2, Lu2/F;->f:Lu2/F$g;

    invoke-virtual {v4}, Lu2/F$g;->e()F

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/dynamicanimation/animation/SpringForce;->setDampingRatio(F)Lcom/android/internal/dynamicanimation/animation/SpringForce;

    .line 40
    invoke-virtual {v11, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setSpring(Lcom/android/internal/dynamicanimation/animation/SpringForce;)Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    const/4 v0, 0x0

    .line 41
    invoke-virtual {v11, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setStartValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 42
    invoke-virtual {v11, v3}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMaxValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 43
    invoke-virtual/range {p2 .. p2}, Lu2/F$k;->e()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {v11, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->setMinimumVisibleChange(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 44
    new-instance v0, Lu2/B;

    move-object/from16 v3, p1

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p11

    move/from16 v8, p14

    move/from16 v4, v18

    invoke-direct/range {v0 .. v8}, Lu2/B;-><init>(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    move-object/from16 v18, v1

    invoke-virtual {v11, v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->addEndListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 45
    new-instance v7, Lu2/F$f;

    iget-object v0, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    iget-object v0, v10, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    new-instance v0, Lu2/C;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v5, p9

    move-object/from16 v6, p11

    move v3, v4

    move-object/from16 v4, p7

    invoke-direct/range {v0 .. v6}, Lu2/C;-><init>(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    move-wide/from16 p12, p5

    move-object/from16 p14, v0

    move-object/from16 p7, v7

    move-object/from16 p8, v8

    move-object/from16 p9, v9

    move-object/from16 p10, v11

    move-object/from16 p11, v18

    invoke-direct/range {p7 .. p14}, Lu2/F$f;-><init>(Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lu2/F$i;JLjava/lang/Runnable;)V

    move-object/from16 v0, p7

    return-object v0
.end method

.method private static final v(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    const/4 p8, 0x1

    .line 2
    invoke-virtual {p0, p8}, Lu2/F$i;->o(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static/range {p0 .. p7}, Lu2/F;->D(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final w(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    move-object/from16 v1, p17

    .line 4
    .line 5
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static/range {p0 .. p17}, Lu2/F;->E(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method private static final x(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;ZLcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    const/4 p8, 0x1

    .line 2
    invoke-virtual {p0, p8}, Lu2/F$i;->r(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static/range {p0 .. p7}, Lu2/F;->D(Lu2/F$i;Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final y(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lu2/F;->M(Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final z(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    move-object/from16 v1, p17

    .line 4
    .line 5
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static/range {p0 .. p17}, Lu2/F;->E(Lu2/F$k;Lu2/F$k;Lkotlin/jvm/internal/z;Lu2/F;Lu2/F$c;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZLkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/C;Lkotlin/jvm/internal/C;Lu2/F$i;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public final F(Landroid/view/View;Lu2/F$k;)Z
    .locals 5

    .line 1
    const-string v0, "transitionContainer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "endState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lu2/F;->g:[I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lu2/F$k;->h()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lu2/F;->g:[I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    aget v1, v1, v2

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    if-gt v0, v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p2}, Lu2/F$k;->a()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lu2/F;->g:[I

    .line 33
    .line 34
    aget v1, v1, v2

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    add-int/2addr v1, v4

    .line 41
    if-lt v0, v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p2}, Lu2/F$k;->f()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lu2/F;->g:[I

    .line 48
    .line 49
    aget v1, v1, v3

    .line 50
    .line 51
    if-gt v0, v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p2}, Lu2/F$k;->g()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iget-object p0, p0, Lu2/F;->g:[I

    .line 58
    .line 59
    aget p0, p0, v3

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    add-int/2addr p0, p1

    .line 66
    if-lt p2, p0, :cond_0

    .line 67
    .line 68
    return v2

    .line 69
    :cond_0
    return v3
.end method

.method public final N(Lu2/F$c;Lu2/F$k;IZZLandroid/graphics/PointF;J)Lu2/F$a;
    .locals 11

    .line 1
    const-string v0, "controller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "endState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lu2/F$c;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 18
    .line 19
    invoke-virtual {v0}, Lu2/F$b;->c()V

    .line 20
    .line 21
    .line 22
    :cond_0
    if-eqz p6, :cond_1

    .line 23
    .line 24
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 25
    .line 26
    invoke-virtual {v0}, Lu2/F$b;->b()V

    .line 27
    .line 28
    .line 29
    :cond_1
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    .line 30
    .line 31
    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v5, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 35
    .line 36
    .line 37
    const/4 p3, 0x0

    .line 38
    invoke-virtual {v5, p3}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1}, Lu2/F$c;->e()Lu2/F$k;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    move-object v1, p0

    .line 46
    move-object v2, p1

    .line 47
    move-object v4, p2

    .line 48
    move v6, p4

    .line 49
    move/from16 v7, p5

    .line 50
    .line 51
    move-object/from16 v8, p6

    .line 52
    .line 53
    move-wide/from16 v9, p7

    .line 54
    .line 55
    invoke-virtual/range {v1 .. v10}, Lu2/F;->q(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;ZZLandroid/graphics/PointF;J)Lu2/F$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Lu2/F$a;->start()V

    .line 60
    .line 61
    .line 62
    return-object p0
.end method

.method public final q(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;ZZLandroid/graphics/PointF;J)Lu2/F$a;
    .locals 15
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .line 1
    const-string v1, "controller"

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "startState"

    .line 9
    .line 10
    move-object/from16 v3, p2

    .line 11
    .line 12
    invoke-static {v3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "endState"

    .line 16
    .line 17
    move-object/from16 v4, p3

    .line 18
    .line 19
    invoke-static {v4, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v1, "windowBackgroundLayer"

    .line 23
    .line 24
    move-object/from16 v7, p4

    .line 25
    .line 26
    invoke-static {v7, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v2}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-interface {v2}, Lu2/F$c;->h()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    if-eqz v10, :cond_0

    .line 42
    .line 43
    invoke-virtual {v10}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :goto_0
    move-object v11, v1

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    const/4 v1, 0x0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    if-eqz v10, :cond_1

    .line 52
    .line 53
    invoke-virtual {v10}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v2}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-static {v1, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    :goto_2
    move v14, v1

    .line 73
    goto :goto_3

    .line 74
    :cond_1
    const/4 v1, 0x0

    .line 75
    goto :goto_2

    .line 76
    :goto_3
    if-eqz p7, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Lu2/F;->d:Lu2/F$j;

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    iget-object v1, p0, Lu2/F;->e:Lu2/F$e;

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    move-object v0, p0

    .line 90
    move/from16 v12, p5

    .line 91
    .line 92
    move/from16 v13, p6

    .line 93
    .line 94
    move-object v1, v2

    .line 95
    move-object v2, v3

    .line 96
    move-object v3, v4

    .line 97
    move-object v9, v6

    .line 98
    move-object/from16 v4, p7

    .line 99
    .line 100
    move-wide/from16 v5, p8

    .line 101
    .line 102
    invoke-direct/range {v0 .. v14}, Lu2/F;->u(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/PointF;JLandroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZ)Lu2/F$a;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    return-object v0

    .line 107
    :cond_2
    move-object v7, v10

    .line 108
    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    move-object v0, p0

    .line 112
    move-object/from16 v1, p1

    .line 113
    .line 114
    move-object/from16 v2, p2

    .line 115
    .line 116
    move-object/from16 v3, p3

    .line 117
    .line 118
    move-object/from16 v4, p4

    .line 119
    .line 120
    move/from16 v9, p5

    .line 121
    .line 122
    move/from16 v10, p6

    .line 123
    .line 124
    move-object v5, v8

    .line 125
    move-object v8, v11

    .line 126
    move v11, v14

    .line 127
    invoke-direct/range {v0 .. v11}, Lu2/F;->r(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZ)Lu2/F$a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    return-object v0
.end method
